<?php
namespace app\admin\controller;
use think\Db;
use think\Controller;
use think\facade\Session;
use think\facade\Cookie;
use think\facade\Request;
use think\response\Json;
use think\facade\Config;
class Common extends Controller
{
    protected $mod,$role,$system,$nav,$menudata,$cache_model,$categorys,$module,$moduleid,$adminRules,$HrefId;
    public function initialize()
    {
		
        //判断管理员是否登录
        if (!Session::get('admin_id')) {
            $this->redirect('login/index'); 
			
        }
		$admin_id = Session::get('admin_id');
		$this->assign('admin_id',$admin_id);
		//$webinfo=tpCache('global');
		//$this->assign('webinfo',$webinfo);
		
		//common->base 里面自己定义
				
		
        $res = M('config')->where('is_del',0)->select();
		foreach($res as $k=>$val){
                    $config[$val['name']] = $val['value'];
        }
		$this->assign('config',$config);
		
		
		
        defined('IS_GET') or define('IS_GET', $this->request->isGet());
		defined('IS_POST') or define('IS_POST', $this->request->isPost());
		defined('IS_AJAX') or define('IS_AJAX', $this->request->isAjax());
		//print_r($_COOKIE);
        !defined('PREFIX') && define('PREFIX',Config::get('database.prefix')); // 数据库表前缀
		
      
    }
    //空操作
    public function _empty(){
        return $this->error('空操作，返回上次访问页面中...');
    }
	
	public function ajaxReturn($data,$type = 'json'){                        
         exit(json_encode($data));
    }
	
	
}


 function getossname($annex){
		$res = M('config')->where('is_del',0)->select();
		foreach($res as $k=>$val){
			$config[$val['name']] = $val['value'];
        }	
		
		$token = gettoken();
		
	    $url = $config['ipaddress']."/resource/info/byid?resourceId=".$annex."&token=".$token;
		$return = getUrl($url);
		$json= json_decode($return, true);
		return $json['data'];
	}	
