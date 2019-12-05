<?php
/**
 * tpshop
 * ============================================================================
 * 版权所有 2015-2027 深圳搜豹网络科技有限公司，并保留所有权利。
 * 网站地址: http://www.tp-shop.cn
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和使用 .
 * 不允许对程序代码以任何形式任何目的的再发布。
 * 采用最新Thinkphp5助手函数特性实现单字母函数M D U等简写方式
 * ============================================================================
 * Author: lhb
 */

namespace app\common\logic;

use think\Db;
use think\facade\Session;
use think\facade\Request;
use think\Controller;

class AdminLogic
{
    public function login($username, $password)
    {
        if (empty($username) || empty($password)) {
            return ['status' => 0, 'msg' => '请填写账号密码'];
        }

        //Saas::instance()->ssoAdmin($username, $password);

        $condition['a.user_name'] = $username;
        $condition['a.password'] = encrypt($password);
		
        $admin = Db::name('admin')->alias('a')->join('admin_role ar', 'a.role_id=ar.role_id')->where($condition)->find();
		
        if (!$admin) {
            return json(['status' => 0, 'msg' => '账号密码不正确']);
        }
		
		if($admin['role_id']==1){
			
			$act_list=M('auth_rule')->where("menustatus",1)->select();
			foreach ($act_list as $k=>$v){
				$act_list[$k]=$v['id'];
			}
			$admin['act_list']=implode(',',$act_list);
		}
         
       $this->handleLogin($admin, $admin['act_list']);
      
        $url = session('from_url') ? session('from_url') : U('Admin/Index/index');
        return json(['status' => 1, 'url' => $url,'msg' => '登录成功']);
    }

    public function handleLogin($admin, $actList)
    {
        M('admin')->where('admin_id', $admin['admin_id'])->data(['last_login' => time(),'last_ip' =>request()->ip()])->update();

        $this->sessionRoleRights($admin, $actList);

        session('admin_id', $admin['admin_id']);
        session('last_login_time', $admin['last_login']);
        session('last_login_ip', $admin['last_ip']);
		session('role_id', $admin['role_id']);

       adminLog('后台登录');
    }

    public function sessionRoleRights($admin,$actList)
    {
        session('act_list', $actList);
    }

    public function logout($adminId)
    {
        session_unset();
        session_destroy();
        Session::clear();

        //Saas::instance()->handleLogout($adminId);
    }
}






