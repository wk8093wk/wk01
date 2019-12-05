<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\db\Where;
use think\facade\Env;
use think\facade\Cookie;
use think\facade\Session;
use think\facade\Request;
use think\Page;
class Member extends Common
{
	public function initialize(){
        parent::initialize();
		
    }
    public function index()
    {  
	   
        return $this->fetch();
    }
	
	public function index_json()
    { 
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  $admin_id=session('admin_id');
	 
	  $register_time=I('post.register_time','');
	  
	  
	  $last_time=I('post.last_time','');
		
		
	  $where = new Where;
	  $where['is_delete']=array('eq',0);
	  if($key_word){
		 $where['user_name|email']=array('like','%'.$key_word.'%');  
	  }
	  
	  if($register_time){
	  	 $where['register_time']=array('EGT',(time()-$register_time*86400));
	  }
	  
		if($last_time){
			$where['last_time']=array('EGT',(time()-$last_time*86400));
		 }
	  
	  
	 
	  $count = M('admin')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('admin')->where($where)->limit($page->firstRow,$page->listRows)->order('admin_id DESC')->select(); 
	  foreach($logs as $k=>$v){
		 $logs[$k]['add_time']=date('Y-m-d H:i:s',$v['add_time']);
		 $logs[$k]['last_login']=date('Y-m-d H:i:s',$v['last_login']);
		 $raw = M('admin_role')->where('role_id',$v['role_id'])->find();
		 if($logs[$k]['role_id']!=2){
		 	$logs[$k]['role_name']=$raw['role_name']; 
		 }
		 $raw2 = M('role')->where('role_id',$v['role_ids'])->find();
		 if($logs[$k]['role_id'] == 2){
		 	$logs[$k]['role_name']=$raw2['role_name']; 
		 }
	  }
	 
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
    }
	
	
	//角色列表
	
	public function role_list(){
		return $this->fetch();
	}
	
	public function role_list_json()
    { 
	


	  
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  $sort_by=I('post.sort_by','role_id');
	  $sort_order=I('post.sort_order','desc');
		
		
	  $where = new Where;
	  if($key_word){
		 $where['user_name|email']=array('like','%'.$key_word.'%');  
	  }
	  
	  
	  
	 
	  $count = M('role')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('role')->where($where)->limit($page->firstRow,$page->listRows)->order('role_id DESC')->select(); 
	/*  foreach($logs as $k=>$v){
		 $logs[$k]['add_time']=date('Y-m-d H:i:s',$v['add_time']);
		 $logs[$k]['last_login']=date('Y-m-d H:i:s',$v['last_login']);
		 $raw = M('admin_role')->where('role_id',$v['role_id'])->find();
		 $logs[$k]['role_name']=$raw['role_name']; 
	  }*/
	 
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
    }

	
	
	public function add()
    {  
	    if (Request::get()){
			
			$param = I('get.');
			
			$mobile=$param['user_name'];
			
			if(!$mobile){
				$this->ajaxReturn(['code'=>1,'msg'=>'手机号不能为空！']);
				exit();
			}
			
			//查询当前用户中是否有这个用户
			
			$res=M('user')->where('mobile',$mobile)->find();
			
			if(!$res){
				$this->ajaxReturn(['code'=>1,'msg'=>'请先在用户管理注册该用户信息！']);
				exit();
			}
			//查询当前用户受否已经在管理员表中
			$res2=M('admin')->where('user_name',$mobile)->find();
			
			if($res2){
				$this->ajaxReturn(['code'=>1,'msg'=>'此用户已经是管理员！']);
				exit();
			}
			$res4=M('user')->where('mobile',$mobile)->find();
			
			 $data['user_name']=$param['user_name'];
			 $data['password']=$res4['password'];
			 $data['role_id']=$param['role_id'];
			 $data['role_ids']=$param['role_ids'];
			 
			 
			 
			 
			$data['add_time']=time();
			$data['last_login']=time();
			
			 $res3= M('admin')->data($data)->insert();
			 if($res3){
				 
				  $this->ajaxReturn(['code'=>0,'msg'=>'添加成功']);
				 
			 }else{
				 $this->ajaxReturn(['code'=>1,'msg'=>'添加失败']);
				
				

			}
		  
		}
	    
		$role_list = M('admin_role')->select();
		$this->assign('role_list',$role_list);
		
		$role_lists=M('role')->select();
		$this->assign('role_lists',$role_lists);
		
        return $this->fetch();
    }
	
	public function edit()
    {  
	    if (Request::post()){
			$param = I('post.');
		  if($param){
			
			if(empty($param['password'])){
				unset($param['password']);
			}else{
				$param['password'] =encrypt($param['password']);
			}
			 M('admin')->update($param);
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
			 
		  }
		}
	    $id = I('get.id/d',0);
	    $info = M('admin')->where('admin_id',$id)->find();
		$this->assign('info',$info);
		$role_list = M('admin_role')->select();
		$this->assign('role_list',$role_list);
		
		$role_lists=M('role')->select();
		$this->assign('role_lists',$role_lists);
		
        return $this->fetch();
    }
	
	public function member_del(){
		$id = I('post.id',0);
		$row=M('admin')->where(array('admin_id'=>$id))->delete();
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	public function member_dels(){
		$ids = I('post.ids');
		if(empty($ids)){
			$this->ajaxReturn(['code'=>1,'msg'=>'删除失败！']);
		}
		$id_all=implode(",",$ids);
		$row=M('admin')->where('admin_id','in',$id_all)->delete();
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	public function group()
    {  
	   
        return $this->fetch();
    }
	
	public function group_json()
    { 
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $admin_id=session('admin_id');
	 
	  $where = new Where;

	 
	  $count = M('admin_role')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('admin_role')->where($where)->limit($page->firstRow,$page->listRows)->order('role_id DESC')->select(); 
	  foreach($logs as $k=>$v){
		
		 
	  }
	 
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
    }
	
	public function group_edit()
    {  
	    if (Request::post()){
			$param = I('post.');
		  if($param){
			  M('admin_role')->update($param);
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
			 
		  }
		}
	    $id = I('get.id/d',0);
	    $info = M('admin_role')->where('role_id',$id)->find();
		$this->assign('info',$info);
        return $this->fetch();
    }
	
	public function group_add()
    {  
	    if (Request::post()){
			$param = I('post.');
		  if($param){
			  M('admin_role')->data($param)->insert();
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
			 
		  }
		}
	    
        return $this->fetch();
    }
	
	//添加角色
	public function role_add()
    {  
	    if (Request::post()){
			$param = I('post.');
		  if($param){
			  $raw=M('role')->where('role_name',$param['role_name'])->find();
			  if($raw){
				  $res=array('code'=>1,'msg'=>'该管理员角色已存在'); 
            	  $this->ajaxReturn($res); 
			  }
			  M('role')->data($param)->insert();
			 $res=array('code'=>0,'msg'=>'添加成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'添加失败'); 
            $this->ajaxReturn($res);
			 
		  }
		}
	    
        return $this->fetch();
    }
	
	
		public function role_edit()
  		  {  
			if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['role_name']=$param['role_name'];
			 $data['role_id']=$param['role_id'];
			 
			 $raw=M('role')->where('role_name',$data['role_name'])->find();
			  if($raw){
				  $res=array('code'=>1,'msg'=>'该管理员角色已存在'); 
            	  $this->ajaxReturn($res); 
			  }
			 
			 M('role')->where('role_id',$param['role_id'])->update($data);
			 
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
			 
		  }
		  }
		$id = I('get.role_id/d',0);
	    $info = M('role')->where('role_id',$id)->find();
		$this->assign('info',$info);
		  
		
        return $this->fetch();
    }
	
	
		public function role_del(){
		$id = I('post.id',0);
		$row2=M('admin')->where(array('role_ids'=>$id))->find();
		if($row2){
			$this->ajaxReturn(['code'=>1,'msg'=>'该角色下有管理员，无法删除！']);
		}
		
		else{
			$row=M('role')->where(array('role_id'=>$id))->delete();
		
			if($row){
			  $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
			}
		}
	}
	
		public function role_dels(){
		$ids = I('post.ids');
		
		$row2=M('admin')->where('role_ids','in',$ids)->find();
		if($row2){
			$this->ajaxReturn(['code'=>1,'msg'=>'角色下有管理员，无法删除！']);
		}
		
		else{
			$row=M('role')->where('role_id','in',$ids)->delete();
			
			if($row){
			  $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
			}
		}
	}
	
	
	
	public function group_del(){
		$id = I('post.id',0);
		$row=M('admin_role')->where(array('role_id'=>$id))->delete();
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	public function group_dels(){
		$ids = I('post.ids',0);
		$id_all=implode(",",$ids);
		$row=M('admin_role')->where('role_id','in',$id_all)->delete();
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	//检测手机号时候能注册管理员
	
	public function ajax_jiance(){
		
		$mobile=I('get.user_name');
		
		if(!$mobile){
			$this->ajaxReturn(['code'=>-1,'msg'=>'手机号不能为空！']);
		}
		
		//查询当前用户中是否有这个用户
		
		$res=M('user')->where('mobile',$mobile)->find();
		
		if(!$res){
			$this->ajaxReturn(['code'=>-1,'msg'=>'此用户还未注册！']);
		}
		//查询当前用户受否已经在管理员表中
		$res2=M('admin')->where('mobile',$mobile)->find();
		
		if($res2){
			$this->ajaxReturn(['code'=>-1,'msg'=>'此用户已经是管理员！']);
		}else{
		
			$this->ajaxReturn(['code'=>0,'msg'=>'可以注册！']);
		}
		
	}
	
	
	//权限管理
	 public function power(){
		 
		if (Request::post()) {
		  $param = I('post.');
		  if(!$param['role_id']){
			$this->error('操作失败');  
		  }else{
			 $list=array_merge($param['chkGroup'],$param['action_code']);
			
			 
			  //判断包含哪些一级
			 $menus=getAdminMenu();
			 $menus_top = array();
			 foreach ($menus as $k=>$v){
				 foreach($v['children'] as $kk=>$vv){
					if(in_array($vv,$list)){
						$menus_top[]=$v['id']; 
					}
					continue;
				 }
			 }
			 $menus_top=array_unique($menus_top);
			
			 $list=array_merge($menus_top,$list);
			 $act_list=implode(',',$list);
			 $data['act_list']=$act_list;
			 M('admin_role')->where('role_id',$param['role_id'])->update($data);
			 $this->success('操作成功');  
		  }
			
		}
    	$id = I('role_id/d');
    	$detail = M('admin_role')->where("role_id",$id)->find();
		
		$act_list_on=explode(",",$detail['act_list']);
		
		$this->assign('detail',$detail);
		
		$this->assign('act_list_on',$act_list_on);
		
		  $authRule = db('auth_rule')->where('menustatus=1')->order('sort','asc')->select();
           // cache('authRule', $authRule, 3600);
      // }
        //声明数组
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
      
        $this->assign('menus',$menus);
		
    	return $this->fetch();
    }
	
	//权限管理
	public function power_role(){
		 
		if (Request::post()) {
		  $param = I('post.');
		  if(!$param['role_id']){
			$this->error('操作失败');  
		  }else{
			 $list=array_merge($param['chkGroup'],$param['action_code']);
			
			 
			  //判断包含哪些一级
			 $menus=getAdminMenu();
			 $menus_top = array();
			 foreach ($menus as $k=>$v){
				 foreach($v['children'] as $kk=>$vv){
					if(in_array($vv,$list)){
						$menus_top[]=$v['id']; 
					}
					continue;
				 }
			 }
			 $menus_top=array_unique($menus_top);
			
			 $list=array_merge($menus_top,$list);
			 $act_list=implode(',',$list);
			 $data['act_list']=$act_list;
			 M('role')->where('role_id',$param['role_id'])->update($data);
			 $this->success('操作成功');  
		  }
			
		}
    	$id = I('role_id/d');
    	$detail = M('role')->where("role_id",$id)->find();
		
		$act_list_on=explode(",",$detail['act_list']);
		
		$this->assign('detail',$detail);
		
		$this->assign('act_list_on',$act_list_on);
		
		$authRule = db('auth_rule')->where('menustatus=1')->order('sort','asc')->select();
           // cache('authRule', $authRule, 3600);
      // }
        //声明数组
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
      
        $this->assign('menus',$menus);
		
    	return $this->fetch();
    }
	
    
}
