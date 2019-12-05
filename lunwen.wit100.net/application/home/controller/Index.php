<?php
namespace app\home\controller;

use think\controller;
use think\Page;
use think\Image;
use think\Db;
use think\db\Where;
use think\facade\Session;
use think\facade\Cookie;
use think\facade\Request;

class Index extends Base {
	
	public function initialize(){
        parent::initialize();
		$sys_setting=array();
		$system = M('config')->cache(true)->select();
		foreach ($system as $k => $v) {       
		   $sys_setting[$v['name']]=$v['value'];
		}
		$this->sys_setting=$sys_setting;
		$this->assign('sys',$sys_setting);
    }


	
	//添加阅读量
	public function ajax_num(){
		$banner_id = I('post.banner_id',0);
		
		$res=M('banner')->where('banner_id',$banner_id)->setInc('click'); 
		
		if($res){
			$this->ajaxReturn(array('status'=>1));
		}else{
			$this->ajaxReturn(array('status'=>0));
		}
	}


    public function index(){  
	    
		$id = I('get.id',0);
		$this->assign('id',$id);
		
		
		
		$banner = M("banner")->where('is_delete',0)->where('hide',1)->select();
		foreach($banner as $k=>$v){
			
		}
		$this->assign('banner',$banner);
		
		
		
		
		$map = new Where;
		$count = M("news")->where($map)->where('is_delete',0)->count();
	    $page  = new Page($count,5);
		$list = M("news")->where($map)->limit($page->firstRow,$page->listRows)->where('is_delete',0)->where('status',1)->order("turnon desc")->order("add_time desc")->select();
		
		foreach($list as $k=>$v){
			
			$list[$k]['add_time']=date('Y-m-d',$v['add_time']);
			$list[$k]['content']= str_replace("&nbsp;","",$v['content']);
			$list[$k]['content']= strip_tags($list[$k]['content']);
			
			$group_arr=[];
			//拆分字符串
			$group_arr=explode(",", $v['group_id']);
			
			
			foreach($group_arr as $kk=>$vv){
				
				$list[$k]['group_arr'][$kk]=getUsername($vv);
				
			}
		
		}
		
		//$this->assign('group_str',$group_str);
		//print_r($group_str);
		//exit();
		
		$this->assign('list',$list);
		
		
		
	    $show=$page->show();
	    $this->assign('page',$show);
		

	
	  

		
		
		$map2 = new Where;
		$count2 = M("meeting")->where($map2)->where('is_delete',0)->count();
	    $page2  = new Page($count2,2);
		$list2 = M("meeting")->where($map2)->limit($page2->firstRow,$page2->listRows)->where('is_delete',0)->where('status',1)->order("add_time desc")->select();
		foreach($list2 as $k=>$v){
		$list2[$k]['add_time']=date('Y-m-d',$v['add_time']);
		
		$list2[$k]['content']= str_replace("&nbsp;","",$v['content']);
		$list2[$k]['content']= strip_tags($list2[$k]['content']);
		
		$list2[$k]['start_time']=date('Y年m月d日',$v['start_time']);
		$list2[$k]['end_time']=date('-d日',$v['end_time']);
		
		$group_arr2=[];
			//拆分字符串
			$group_arr2=explode(",", $v['group_id']);
			
			
			foreach($group_arr2 as $kk=>$vv){
				
				$list2[$k]['group_arr2'][$kk]=getUsername($vv);
				
			}
		
		}
		$this->assign('list2',$list2);
	    $show2=$page2->show();
	    $this->assign('page2',$show2);
		
		
		
		
		
		
//		
//		$id = I('get.id',0);
//		$this->assign('id',$id);
//		$meeting = M('meeting')->where('meeting_id',$id)->order('meeting_id','desc')->limit(0,5)->find();
//		$this->assign('meeting',$meeting);
		
		
        return $this->fetch();

    }
	
	 
	

}