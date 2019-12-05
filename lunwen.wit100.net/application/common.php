<?php

/**
 * 获取缓存或者更新缓存，只适用于config表
 * @param string $config_key 缓存文件名称
 * @param array $data 缓存数据  array('k1'=>'v1','k2'=>'v3')
 * @return array or string or bool
 */

use mailer\PHPMailer;
use mailer\SMTP;
 
 
 
 
function tpCache($config_key,$data = array()){
    $param = explode('.', $config_key);
    // $request = think\Request::instance();
    // $module_name = $request->module();
    // $controller_name = $request->controller();
    // $action_name = $request->action();
    if(empty($data)){
        //如$config_key=shop_info则获取网站信息数组
        //如$config_key=shop_info.logo则获取网站logo字符串
        $config = F($param[0],'',TEMP_PATH);//直接获取缓存文件
        if(empty($config)){
            //缓存文件不存在就读取数据库
            if ($param[0] == 'global') {
                $param[0] = 'global';
                $res = M('config')->where('is_del',0)->select();
            } else {
                $res = M('config')->where("inc_type",$param[0])->where('is_del',0)->select();
            }
            if($res){
                foreach($res as $k=>$val){
                    $config[$val['name']] = $val['value'];
                }
                F($param[0],$config,TEMP_PATH);
            }
            write_global_params();
        }
        if(!empty($param) && count($param)>1){
            $newKey = strtolower($param[1]);
            return isset($config[$newKey]) ? $config[$newKey] : '';
        }else{
            return $config;
        }
	}else if($param[0] == 'global'){
		$result =  M('config')->where('is_del',0)->select();
        if($result){
            foreach($result as $val){
                $temp[$val['name']] = $val['value'];
            }
            $add_data = array();
            foreach ($data as $k=>$v){
                $newK = strtolower($k);
                $newArr = array('name'=>$newK,'value'=>trim($v));
                if(!isset($temp[$newK])){
                    array_push($add_data, $newArr); //新key数据插入数据库
                    // M('config')->add($newArr);//新key数据插入数据库
                }else{
                    if($v!=$temp[$newK])
                        M('config')->where("name", $newK)->data($newArr)->update();//缓存key存在且值有变更新此项
                }
            }
            if (!empty($add_data)) {
                M('config')->insertAll($add_data);
            }
            //更新后的数据库记录
            $newRes = M('config')->where("inc_type", $param[0])->where('is_del',0)->select();
            foreach ($newRes as $rs){
                $newData[$rs['name']] = $rs['value'];
            }
        }
		
		 $result = false;
        // $global = F('global','',TEMP_PATH);
        // if (!empty($global)) {
        //     $global = array_merge($global, $newData);
        //     $result = F('global',$global,TEMP_PATH);
        // } else {
            $res = M('config')->where('is_del',0)->select();
            if($res){
                $global = array();
                foreach($res as $k=>$val){
                    $global[$val['name']] = $val['value'];
                }
                $result = F('global',$global,TEMP_PATH);
            } 
		
		
    }else{
        //更新缓存
        $result =  M('config')->where("inc_type", $param[0])->where('is_del',0)->select();
        if($result){
            foreach($result as $val){
                $temp[$val['name']] = $val['value'];
            }
            $add_data = array();
            foreach ($data as $k=>$v){
                $newK = strtolower($k);
                $newArr = array('name'=>$newK,'value'=>trim($v),'inc_type'=>$param[0]);
                if(!isset($temp[$newK])){
                    array_push($add_data, $newArr); //新key数据插入数据库
                    // M('config')->add($newArr);//新key数据插入数据库
                }else{
                    if($v!=$temp[$newK])
                        M('config')->where("name", $newK)->data($newArr)->update();//缓存key存在且值有变更新此项
                }
            }
            if (!empty($add_data)) {
                M('config')->insertAll($add_data);
            }
            //更新后的数据库记录
            $newRes = M('config')->where("inc_type", $param[0])->where('is_del',0)->select();
            foreach ($newRes as $rs){
                $newData[$rs['name']] = $rs['value'];
            }
        }else{
            if ($param[0] != 'global') {
                foreach($data as $k=>$v){
                    $newK = strtolower($k);
                    $newArr[] = array('name'=>$newK,'value'=>trim($v),'inc_type'=>$param[0]);
                }
                M('config')->insertAll($newArr);
            }
            $newData = $data;
        }

        $result = false;
        // $global = F('global','',TEMP_PATH);
        // if (!empty($global)) {
        //     $global = array_merge($global, $newData);
        //     $result = F('global',$global,TEMP_PATH);
        // } else {
            $res = M('config')->where('is_del',0)->select();
            if($res){
                $global = array();
                foreach($res as $k=>$val){
                    $global[$val['name']] = $val['value'];
                }
                $result = F('global',$global,TEMP_PATH);
            } 
        // }

        if ($param[0] != 'global') {
            $result = F($param[0],$newData,TEMP_PATH);
        }
        
        return $result;
    }
}
function tpCacheMem($data = array()){
    
    // $request = think\Request::instance();
    // $module_name = $request->module();
    // $controller_name = $request->controller();
    // $action_name = $request->action();
    if(empty($data)){
        //如$config_key=shop_info则获取网站信息数组
        //如$config_key=shop_info.logo则获取网站logo字符串
        $config = F('mem_setting','',TEMP_PATH);//直接获取缓存文件
        if(empty($config)){
            //缓存文件不存在就读取数据库
           
             $res = M('member_config')->select();
            
            if($res){
                foreach($res as $k=>$val){
                    $config[$val['name']] = $val['value'];
                }
                F('mem_setting',$config,TEMP_PATH);
            }
            write_global_params();
        }
       
            return $config;
        
	}else{
        //更新缓存
        $result =  M('member_config')->select();
        if($result){
            foreach($result as $val){
                $temp[$val['name']] = $val['value'];
            }
            $add_data = array();
            foreach ($data as $k=>$v){
                $newK = strtolower($k);
                $newArr = array('name'=>$newK,'value'=>trim($v));
                if(!isset($temp[$newK])){
                    array_push($add_data, $newArr); //新key数据插入数据库
                    // M('config')->add($newArr);//新key数据插入数据库
                }else{
                    if($v!=$temp[$newK])
                        M('member_config')->where("name", $newK)->data($newArr)->update();//缓存key存在且值有变更新此项
                }
            }
            if (!empty($add_data)) {
                M('member_config')->insertAll($add_data);
            }
            //更新后的数据库记录
            $newRes = M('member_config')->select();
            foreach ($newRes as $rs){
                $newData[$rs['name']] = $rs['value'];
            }
        }else{
           
            $newData = $data;
        }

        $result = false;
        // $global = F('global','',TEMP_PATH);
        // if (!empty($global)) {
        //     $global = array_merge($global, $newData);
        //     $result = F('global',$global,TEMP_PATH);
        // } else {
            $res = M('member_config')->select();
            if($res){
                $global = array();
                foreach($res as $k=>$val){
                    $global[$val['name']] = $val['value'];
                }
                $result = F('mem_setting',$global,TEMP_PATH);
            } 
        // }

        return $result;
    }
}

/**
 * 写入全局内置参数
 * @return array
 */
function write_global_params()
{
    $globalParams = tpCache('global'); // 全局变量
    $web_basehost = !empty($globalParams['web_basehost']) ? $globalParams['web_basehost'] : ''; // 网站根网址
    $web_cmspath = !empty($globalParams['web_cmspath']) ? $globalParams['web_cmspath'] : ''; // EyouCMS安装目录
    /*启用绝对网址，开启此项后附件、栏目连接、arclist内容等都使用http路径*/
    $web_multi_site = !empty($globalParams['web_multi_site']) ? $globalParams['web_multi_site'] : '';
    if($web_multi_site == 1)
    {
        $web_mainsite = $web_basehost;
    }
    else
    {
        $web_mainsite = '';
    }
    /*--end*/
    /*CMS安装目录的网址*/
    $param['web_cmsurl'] = $web_mainsite.$web_cmspath;
    /*--end*/
    $param['web_templets_dir'] = $web_cmspath.'/template'; // 前台模板根目录
    $param['web_templeturl'] = $web_mainsite.$param['web_templets_dir']; // 前台模板根目录的网址
    $param['web_templets_pc'] = $web_mainsite.$param['web_templets_dir'].'/pc'; // 前台PC模板主题
    $param['web_templets_m'] = $web_mainsite.$param['web_templets_dir'].'/mobile'; // 前台手机模板主题

    /*将内置的全局变量(页面上没有入口更改的全局变量)存储到web版块里*/
    $inc_type = 'web';
    foreach ($param as $key => $val) {
        if (preg_match("/^".$inc_type."_(.)+/i", $key) !== 1) {
            $nowKey = strtolower($inc_type.'_'.$key);
            $param[$nowKey] = $val;
        }
    }
    tpCache($inc_type, $param);
    $globalParams = array_merge($globalParams, $param);
    /*--end*/

    return $globalParams;
}

/**
 *  过滤换行回车符
 *
 * @param     string  $str     字符串信息
 * @return    string
 */
function filter_line_return($str = '', $replace = '')
{
    return str_replace(PHP_EOL, $replace, $str);
}

/**
 * 参数 is_jsonp 为true，表示跨域ajax请求的返回值
 *
 * @param string $res 数组
 * @param bool $is_jsonp 是否跨域
 * @return string
 */
function respose($res, $is_jsonp = false){
    if (true === $is_jsonp) {
        exit(I('callback')."(".json_encode($res).")");
    } else {
        exit(json_encode($res));
    }
}

function urlsafe_b64encode($string) 
{
    $data = base64_encode($string);
    $data = str_replace(array('+','/','='),array('-','_',''),$data);
    return $data;
}

/**
 * 获取当前时间戳
 *
 */
function getTime()
{
    return time();
}

/**
 * 获取当前时间戳
 *
 */
function getProduct($pro)
{
    $send_scene = Config::get('WEB_PRODUCT');
	$prolist=explode(',', $pro);
	$re=array();
	foreach ($prolist as $k => $v){
		$re[$k]=$send_scene[$v][0];
	}
	$p=implode(",",$re);
	return $p;
}

if (!function_exists('C')) {
/**
 * 采有TP5最新助手函数特性实现函数简写方式 S 
 * 获取和设置配置参数 支持批量定义
 * @param string|array $name 配置变量
 * @param mixed $value 配置值
 * @param mixed $default 默认值
 * @return mixed
 */
    function C($name=null, $value=null,$default=null) {
        return config($name);
   }   
}

function encrypt($str){
	return md5(C("AUTH_CODE").$str);
}
/**
 * 管理员操作记录
 * @param $log_info string 记录信息
 */
function adminLog($log_info){
    $add['log_time'] = time();
    $add['admin_id'] = session('admin_id');
    $add['log_info'] = $log_info;
    $add['log_ip'] = request()->ip();
    $add['log_url'] = request()->baseUrl() ;
    M('admin_log')->data($add)->insert();
}

// 递归删除文件夹
function delFile($path,$delDir = FALSE) {
    if(!is_dir($path))
                return FALSE;		
	$handle = @opendir($path);
	if ($handle) {
		while (false !== ( $item = readdir($handle) )) {
			if ($item != "." && $item != "..")
				is_dir("$path/$item") ? delFile("$path/$item", $delDir) : unlink("$path/$item");
		}
		closedir($handle);
		if ($delDir) return rmdir($path);
	}else {
		if (file_exists($path)) {
			return unlink($path);
		} else {
			return FALSE;
		}
	}
}

/**
 * 清除模版缓存 不删除cache目录
 */
function clear_sys_cache() {
Cache::clear();
}
/**
 * 清除模版缓存 不删除 temp目录
 */
function clear_temp_ahce() {
  array_map( 'unlink', glob( TEMP_PATH.DS.'/*.php' ) );

}

/**
 * 获取用户信息
 * @param $user_value  用户id 邮箱 手机 第三方id
 * @param int $type  类型 0 user_id查找 1 邮箱查找 2 手机查找 3 第三方唯一标识查找
 * @param string $oauth  第三方来源
 * @return mixed
 */
function get_user_info($user_value, $type = 0, $oauth = '')
{
    $map = [];
    if ($type == 0) {
        $map['user_id'] = $user_value;
    } elseif ($type == 1) {
        $map['email'] = $user_value;
    } elseif ($type == 2) {
        $map['mobile'] = $user_value;
    } elseif ($type == 3) {
        $thirdUser = Db::name('oauth_users')->where(['openid' => $user_value, 'oauth' => $oauth])->find();
        $map['user_id'] = $thirdUser['user_id'];
    } elseif ($type == 4) {
        $thirdUser = Db::name('oauth_users')->where(['unionid' => $user_value])->find();
        $map['user_id'] = $thirdUser['user_id'];
    }

    return Db::name('users')->where($map)->find();
}

function get_arr_column($arr, $key_name)

{

	$arr2 = array();

	foreach($arr as $key => $val){

		$arr2[] = $val[$key_name];        

	}

	return $arr2;

}


/**
 * 清除日志缓存 不删出log目录
 */
function clear_log_chache() {
	
	delFile(LOG_PATH);
}

/**
 * 检查手机号码格式
 * @param $mobile 手机号码
 */
function check_mobile($mobile){
    if(preg_match('/1[34578]\d{9}$/',$mobile))
        return true;
    return false;
}

if (!function_exists('format_bytes')) 
{
    /**
     * 格式化字节大小
     *
     * @param  number $size      字节数
     * @param  string $delimiter 数字和单位分隔符
     * @return string            格式化后的带单位的大小
     */
    function format_bytes($size, $delimiter = '') {
        $units = array('B', 'KB', 'MB', 'GB', 'TB', 'PB');
        for ($i = 0; $size >= 1024 && $i < 5; $i++) $size /= 1024;
        return round($size, 2) . $delimiter . $units[$i];
    }
}

if (!function_exists('is_check_access')) 
{
    /**
     * 检测是否有该权限
     */
    function is_check_access($str = 'Index@index') {  
        $bool_flag = 1;
        $role_id = session('admin_info.role_id');
        if (0 < intval($role_id)) {
            $ctl_act = strtolower($str);
            $arr = explode('@', $ctl_act);
            $ctl = !empty($arr[0]) ? $arr[0] : '';
            $act = !empty($arr[1]) ? $arr[1] : '';
            $ctl_all = $ctl.'@*';

            $auth_role_info = session('admin_info.auth_role_info');
            $permission = $auth_role_info['permission'];
            $permission_rules = !empty($permission['rules']) ? $permission['rules'] : [];

            $auth_rule = get_auth_rule();
            $all_auths = []; // 系统全部权限对应的菜单ID
            $admin_auths = []; // 用户当前拥有权限对应的菜单ID
            $diff_auths = []; // 用户没有被授权的权限对应的菜单ID
            foreach($auth_rule as $key => $val){
                $all_auths = array_merge($all_auths, explode(',', strtolower($val['auths'])));
                if (in_array($val['id'], $permission_rules)) {
                    $admin_auths = array_merge($admin_auths, explode(',', strtolower($val['auths'])));
                }
            }
            $all_auths = array_unique($all_auths);
            $admin_auths = array_unique($admin_auths);
            $diff_auths = array_diff($all_auths, $admin_auths);

            if (in_array($ctl_act, $diff_auths) || in_array($ctl_all, $diff_auths)) {
                $bool_flag = false;
            }
        }

        return $bool_flag;
    }
}

if (!function_exists('getCmsVersion')) 
{
    /**
     * 获取当前CMS版本号
     *
     * @return string
     */
    function getCmsVersion()
    {
        $ver = 'v1.1.8';
       
        return $ver;
    }
}

if (!function_exists('getCatGoods')) 
{
    /**
     * 格式化字节大小
     *
     * @param  number $size      字节数
     * @param  string $delimiter 数字和单位分隔符
     * @return string            格式化后的带单位的大小
     */
    function getCatGoods($catid) {
       $num=M('goods')->where("cat_id",$catid)->count();
	   return $num;
    }
}
if (!function_exists('getCatName')) 
{
    /**
     * 格式化字节大小
     *
     * @param  number $size      字节数
     * @param  string $delimiter 数字和单位分隔符
     * @return string            格式化后的带单位的大小
     */
    function getCatName($catid) {
       $rows=M('category')->where("id",$catid)->field('cat_name')->find();
	   return $rows['cat_name'];
    }
}
//获取科目
function  type_name($id){
	$rows=M('exam_type')->where("id",$id)->find();
	
	return $rows['typename'];
}
function  option_name($id){
	if($id=='1'){
		return 'A';
	}
	if($id=='2'){
		return 'B';
	}
	if($id=='3'){
		return 'C';
	}
	if($id=='4'){
		return 'D';
	}
	


}
//获取工作组
function  getUsername($id){
	$rows=M('group')->where("group_id",$id)->find();
	
	return $rows['name'];
}

//获取会议管理员
function  getadministrators($id){
	$rows=M('admin')->where("admin_id",$id)->find();
	
	return $rows['user_name'];
}

//获取后台新闻上传者
function  getAdminname($admin_id){
	$rows=M('admin')->where("admin_id",$admin_id)->find();
	
	return $rows['user_name'];
}

//获取前台论文上传者
function  getlunwenname($user_id){
	$rows=M('user')->where("user_id",$user_id)->find(); 
	
	return $rows['mobile'];
}


////获取酒店名
function  gethotelname($hotel_id){
	$rows=M('hotel')->where("hotel_id",$hotel_id)->find(); 
	
	return $rows['name'];
}

//获取房间规格
function  getroomname($room_id){
	$rows=M('room')->where("room_id",$room_id)->find(); 
	
	return $rows['name'];
}









//获取店铺等级
function  getShopname($id){
	$rows=M('shop_level')->where("level_id",$id)->find();
	return $rows['level_name'];
}

//获取商业圈
function  getDistrictname($id){
	$rows=M('district')->where("id",$id)->find();
	return $rows['name'];
}


function getAdPosition($id){
	$rows=M('ad_position')->where("position_id",$id)->find();
	
	return $rows['position_name'];
	
}

//计算两点之间距离
 function getDistance($lat1, $lng1, $lat2, $lng2){

    //将角度转为狐度

    $radLat1=deg2rad($lat1);//deg2rad()函数将角度转换为弧度

    $radLat2=deg2rad($lat2);

    $radLng1=deg2rad($lng1);

    $radLng2=deg2rad($lng2);

    $a=$radLat1-$radLat2;

    $b=$radLng1-$radLng2;

    $s=2*asin(sqrt(pow(sin($a/2),2)+cos($radLat1)*cos($radLat2)*pow(sin($b/2),2)))*6378.137;

    return $s;

}

//获取门店名称
function  getShopNameNew($id){
	$rows=M('shop')->where("id",$id)->find();
	return $rows['name'];
}

function mb_unserialize($serial_str) {
    $out = preg_replace_callback( '!s:(\d+):"(.*?)";!s', function($r){ return 's:'.strlen($r[2]).':"'.$r[2].'";'; }, $serial_str );
    return unserialize($out);
}

function numeral($num){
    $china=array('零','一','二','三','四','五','六','七','八','九','十','十一','十二','十三','十四','十五','十六','十七','十八','十九','二十');
    $arr=str_split($num);
    for($i=0;$i<count($arr);$i++){
        return $china[$arr[$i]];
    }
}


function subtext($text, $length){
 if(mb_strlen($text, 'utf8') > $length)
 return mb_substr($text,0,$length,'utf8').'...';return $text;
}

//获取后台导航一级和二级

function getAdminMenu(){
	$authRule = db('auth_rule')->where('menustatus=1')->field('id,pid,title,href')->order('sort','asc')->select();
	$menus = array();
        foreach ($authRule as $key=>$val){
            $authRule[$key]['href'] = url($val['href']);
            if($val['pid']==0){
               
                    $menus[] = $val;
               
            }
        }
		foreach ($menus as $k=>$v){
            foreach ($authRule as $kk=>$vv){
                if($v['id']==$vv['pid']){
                        $menus[$k]['children'][] = $vv['id'];
                }
            }
        }
     return $menus;
	
}






 function getUrl($url, $header = false) {
        $ch = curl_init($url);
        curl_setopt($ch,CURLOPT_HEADER,0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //返回数据不直接输出
        curl_setopt($ch, CURLOPT_ENCODING, "gzip"); //指定gzip压缩
        //add header
        if(!empty($header)) {
            curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        }
        //add ssl support
        if(substr($url, 0, 5) == 'https') {
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);    //SSL 报错时使用
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);    //SSL 报错时使用
        }
        //add 302 support
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        //curl_setopt($ch,CURLOPT_COOKIEFILE, $this->lastCookieFile); //使用提交后得到的cookie数据
        try {
            $content = curl_exec($ch); //执行并存储结果
        } catch (\Exception $e) {
            $this->_log($e->getMessage());
        }
        $curlError = curl_error($ch);
        if(!empty($curlError)) {
            $this->_log($curlError);
        }
        curl_close($ch);
        return $content;
    }
	
 function postUrl($url, $postData = false, $header = false) {
    $ch = curl_init($url);
    curl_setopt($ch,CURLOPT_HEADER,0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //返回数据不直接输出
    curl_setopt($ch, CURLOPT_ENCODING, "gzip"); //指定gzip压缩
    //add header
    if(!empty($header)) {
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
    }
    //add ssl support
    if(substr($url, 0, 5) == 'https') {
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);    //SSL 报错时使用
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);    //SSL 报错时使用
    }
    //add 302 support
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    //curl_setopt($ch,CURLOPT_COOKIEFILE, $this->lastCookieFile); //使用提交后得到的cookie数据
    //add post data support
    if(!empty($postData)) {
        curl_setopt($ch,CURLOPT_POST, 1);
        curl_setopt($ch,CURLOPT_POSTFIELDS, $postData);
    }
    try {
        $content = curl_exec($ch); //执行并存储结果
    } catch (\Exception $e) {
        $this->_log($e->getMessage());
    }
    $curlError = curl_error($ch);
    if(!empty($curlError)) {
        $this->_log($curlError);
    }
    curl_close($ch);
    return $content;
}







function GetRandStr($len) {
    $chars = array("0", "1", "2","3", "4", "5", "6", "7", "8", "9");
    $charsLen = count($chars) - 1;
    shuffle($chars);
    $output = "";
    for ($i=0; $i<$len; $i++){
        $output .= $chars[mt_rand(0, $charsLen)];
    }
    return $output;
}




/*
 * 应用公共函数文件，函数不能定义为public类型，
 * 如果我们要使用我们定义的公共函数，直接在我们想用的地方直接调用函数即可。
 * */
// 公共发送邮件函数
function sendEmail($toemail,$code){
    
		
		
        $mail = new PHPMailer();
        $mail->isSMTP();// 使用SMTP服务
        $mail->CharSet = "utf8";// 编码格式为utf8，不设置编码的话，中文会出现乱码
        $mail->Host = "smtp.163.com";// 发送方的SMTP服务器地址
        $mail->SMTPAuth = true;// 是否使用身份验证
        $mail->Username = "lk1069978790@163.com";// 发送方的163邮箱用户名，就是你申请163的SMTP服务使用的163邮箱</span><span style="color:#333333;">
        $mail->Password = "qwertyuiop147147";// 发送方的邮箱密码，注意用163邮箱这里填写的是“客户端授权密码”而不是邮箱的登录密码！</span><span style="color:#333333;">
        $mail->SMTPSecure = "ssl";// 使用ssl协议方式</span><span style="color:#333333;">
        $mail->Port = 465;// 163邮箱的ssl协议方式端口号是465/994
        $mail->setFrom("lk1069978790@163.com","lk");// 设置发件人信息，如邮件格式说明中的发件人，这里会显示为Mailer(xxxx@163.com），Mailer是当做名字显示
        $mail->addAddress($toemail,'收件人');// 设置收件人信息，如邮件格式说明中的收件人，这里会显示为Liang(yyyy@163.com)
        $mail->addReplyTo("lk1069978790@163.com","lk...");// 设置回复人信息，指的是收件人收到邮件后，如果要回复，回复邮件将发送到的邮箱地址
        //$mail->addCC("xxx@163.com");// 设置邮件抄送人，可以只写地址，上述的设置也可以只写地址(这个人也能收到邮件)
        //$mail->addBCC("xxx@163.com");// 设置秘密抄送人(这个人也能收到邮件)
        //$mail->addAttachment("bug0.jpg");// 添加附件
        $mail->Subject = "邮箱验证!";// 邮件标题
        $mail->Body = " 你的邮箱验证码为：".$code;// 邮件正文
        //$mail->AltBody = "This is the plain text纯文本";// 这个是设置纯文本方式显示的正文内容，如果不支持Html方式，就会用到这个，基本无用
      
        if(!$mail->send()){// 发送邮件
            
            return $mail->ErrorInfo;
        // echo "Message could not be sent.";
        // echo "Mailer Error: ".$mail->ErrorInfo;// 输出错误信息
        }else{
            return 1;
        }
}




function send_mail($toemail,$code) {
        $url = 'http://api.sendcloud.net/apiv2/mail/send';
        $API_USER = 'DESTUP_QsQ0bY2';
        $API_KEY = 'V6MXpXaAITzXdGHZ';


		$res = M('config')->where('is_del',0)->select();
		foreach($res as $k=>$val){
			$config[$val['name']] = $val['value'];
        }		
		
		
        $param = array(
            'apiUser' => $API_USER, # 使用api_user和api_key进行验证
            'apiKey' => $API_KEY,
            'from' => $config['code_email'], # 发信人，用正确邮件地址替代
            'fromName' => $config['code_name'],
            'to' => $toemail,# 收件人地址, 用正确邮件地址替代, 多个地址用';'分隔  
            'subject' => '邮箱验证码',
            'html' => '您的邮箱验证码为'.$code,
            'respEmailId' => 'true'
        );
        

        $data = http_build_query($param);

        $options = array(
            'http' => array(
                'method' => 'POST',
                'header' => 'Content-Type: application/x-www-form-urlencoded',
                'content' => $data
        ));
        $context  = stream_context_create($options);
        $result = file_get_contents($url, FILE_TEXT, $context);

        return $result;
}





	//获取token
 function gettoken(){
		$res = M('config')->where('is_del',0)->select();
		foreach($res as $k=>$val){
			$config[$val['name']] = $val['value'];
        }		
		
		$userId = $config['userid'];
		$secret = $config['secret'];
		$sign = base64_encode($secret.time());
	    $url = $config['ipaddress']."/token/create?userId=".$userId."&sign=".$sign;
		$return = getUrl($url);
		$json = json_decode($return, true);
		return $json['token'];
	}
	
	



