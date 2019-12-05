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
use PHPExcel_IOFactory;
use PHPExcel;

class User extends Common
{
	public function initialize(){
        parent::initialize();
		
    }
    public function index()
    {  
     return $this->fetch();
    }
	
	
	
	public function art_del(){
		
		$id = I('post.id',0);
		$row=M('user')->where(array('user_id'=>$id))->delete();
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
		
	}
	
		public function art_dels(){
		$ids = I('post.ids');
		//$ids=implode(",", $id);
		$row=M('user')->where('user_id','in',$ids)->delete();
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	
	
	public function index_json()
    { 
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  $user_id=session('user_id');
	 
	  $where = new Where;
	  $where['is_delete']=array('eq',0);
	  if($key_word){
		 $where['user_name|mobile|email|company|name|register_ip|last_ip']=array('like','%'.$key_word.'%');  
	  }
	  
	   $register_time1=I('post.register_time1','');
	   $register_time2=I('post.register_time2','');

	  
	   $last_time1=I('post.last_time1','');
	   $last_time2=I('post.last_time2','');
	  
		if($register_time1 && !$register_time2){
			$where['register_time'] = array('EGT',strtotime($register_time1));
		}
		
		if(!$register_time1 && $register_time2){
			 $where['register_time'] = array('ELT',strtotime($register_time2));
		}
		
		
		if($register_time1 && $register_time2){
			$where['register_time'] = array('BETWEEN',[strtotime($register_time1),strtotime($register_time2)]);
		}
		
		
		if($last_time1 && !$last_time2){
			$where['last_time'] = array('EGT',strtotime($last_time1));
		}
		
		if(!$last_time1 && $last_time2){
			 $where['last_time'] = array('ELT',strtotime($last_time2));
		}
		
		
		if($last_time1 && $last_time2){
			$where['last_time'] = array('BETWEEN',[strtotime($last_time1),strtotime($last_time2)]);
		}  
		  
	
	 
	  $count = M('user')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('user')->where($where)->limit($page->firstRow,$page->listRows)->order('user_id DESC')->select(); 
	  foreach($logs as $k=>$v){
		 $logs[$k]['register_time']=date('Y-m-d H:i:s',$v['register_time']);
		 $logs[$k]['last_time']=date('Y-m-d H:i:s',$v['last_time']);
		 
	  }
	 
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
    }
	
	public function add()
    {  
		
		
	    if (Request::post()){
			$param = I('post.');
		  if($param){
			
			
			
			if(empty($param['password'])){
				unset($param['password']);
			}else{
				$param['password'] =encrypt($param['password']);
			}
			 $raw = M('user')->where('mobile',$param['mobile'])->find();
			 if($raw){
				 $res=array('code'=>1,'msg'=>'手机号已存在'); 
                 $this->ajaxReturn($res);
			 }
			 $request = Request::instance();
			 $param['register_ip'] =$request->ip();
			 $param['register_time']=time();
			 $param['last_time']=time();
			 
			 M('user')->data($param)->insert();
			 $res=array('code'=>0,'msg'=>'添加成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'添加失败'); 
            $this->ajaxReturn($res);
			 
		  }
		}
	    
		
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
			 M('user')->update($param);
			 
			M('admin')->where('user_name',$param['user_id'])->update(['password' => $param['password']]);
			 
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
			 
		  }
		}
	    $id = I('get.id/d',0);
	    $info = M('user')->where('user_id',$id)->find();
		$this->assign('info',$info);
		
        return $this->fetch();
    }
	
	
	public function see()
    {  
	 
	    $id = I('get.id/d',0);
	    $info = M('user')->where('user_id',$id)->find();
		$info['register_time']=date('Y-m-d H:i:s',$info['register_time']);
		$info['last_time']=date('Y-m-d H:i:s',$info['last_time']);
			
		$this->assign('info',$info);
		
        return $this->fetch();
    }
    
}
