<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\facade\Env;
use think\facade\Cookie;
use think\facade\Session;
use think\facade\Request;
class Index extends Common
{
	public function initialize(){
        parent::initialize();
		
    }
    public function index()
    {  
	   
	 
	    $admin_id=session('admin_id');
	   
	   
	    $admin_name=session('admin_name');
		$this->assign('admin_name',$admin_name);
		
		$act_list=explode(",",session('act_list'));
		
		//查询权限列表
		$admin_res=M('admin')->where('admin_id',$admin_id)->find();
		
		$admin_role_res=M('admin_role')->where('role_id',$admin_res['role_id'])->find();
		
		$act_list=$admin_role_res['act_list'];
		
		
		
		
		
	   if($admin_res['role_id']==3){
		  $authRule = db('auth_rule')->where('menustatus=1')->where('id','in',$act_list)->order('sort','asc')->select();
	   }else if($admin_res['role_id']==1){
         $authRule = db('auth_rule')->where('menustatus=1')->order('sort','asc')->select();
	   }else if ($admin_res['role_id']==2){
		   
		   $rolerole=M('role')->where('role_id',$admin_res['role_ids'])->find();
		 	
			$act_list =$rolerole['act_list'];
			
			if(!$act_list){
				$act_list=0;
			}
			$authRule = db('auth_rule')->where('menustatus=1')->where('id','in',$act_list)->order('sort','asc')->select();
		 }else if($admin_res['role_id']==5){
			$admin_role_res2=M('admin_role')->where('role_id',3)->find();
			
			if(!$admin_role_res2['act_list']){
				$admin_role_res2['act_list']=0;
			}
			
			$rolerole=M('role')->where('role_id',$admin_res['role_ids'])->find();
		 	
			$act_list =$rolerole['act_list'];
			
			if(!$act_list){
				$act_list=0;
			}
			
			$act_list=$act_list.','.$admin_role_res2['act_list'];
			$authRule = db('auth_rule')->where('menustatus=1')->where('id','in',$act_list)->order('sort','asc')->select();
			
		} 
		 
		 
		 
		 
	    $rule = db('admin_role')->where('role_id',session('role_id'))->find();
		
		$role_id=session('role_id');
		
		$role_name=$rule['role_name'];
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
                        $menus[$k]['children'][] = $vv;
						
						foreach ($menus[$k]['children'] as $m=>$n){
							$menus[$k]['children'][$m]['son']=array();
							foreach ($authRule as $kkk=>$vvv){ 
							  if($n['id']==$vvv['pid']){
								  $menus[$k]['children'][$m]['son'][] = $vvv;  							
							  }	
							
							}
							
						}
						
                }
            }
        }
		//左侧导航菜单
        $this->assign('act_list',$act_list);
		$this->assign('role_id',$role_id);
		$this->assign('role_name',$role_name);
        $this->assign('menus',$menus);
		
     return $this->fetch();
    }
	
	public function main(){
        
        return $this->fetch();
    }
	
	//退出登陆
    public function logout(){
        Session::clear('store');
		
        $this->redirect('admin/login/index');
    }

    
}
