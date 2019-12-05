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

class Search extends Base {
	
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


 	public function searchall(){
		//顶部搜索
//		  $text=I('post.');
//		  if($text){
//			$data['nameall']=$text['nameall'];
//		 }
		 if(Request::post()){
		  $key_word=I('post.nameall','');
		  
//		  print_r($key_word);
//		  exit();
		  
		  $where = new Where;
		  $where['is_delete']=array('eq',0);
		  if($key_word){
			 $where['name']=array('like','%'.$key_word.'%');  
		  }
		  $count = M('article')->where($where)->count();
		  $logs = M('article')->where($where)->select(); 
		  
		  foreach($logs as $k=>$v){
			 $logs[$k]['add_time']=date('Y-m-d',$v['add_time']);
			 $logs[$k]['start_time']=date('Y年m月d日',$v['start_time']);
			 $logs[$k]['end_time']=date('-d日',$v['end_time']);
			 $logs[$k]['content']= str_replace("&nbsp;","",$v['content']);
			 $logs[$k]['content']= strip_tags($logs[$k]['content']); 
		  }
		 $this->assign('logs',$logs);
		 
		  $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
		  }
		
	}


    public function search(){  
	
		$key = I('get.key','');
		$this->assign('key',$key);
		
		
		
		$map = new Where;
		$map['is_delete']=0;
		$map['status']=1;
		if($key){
			$map['name']=array('like','%'.$key.'%');
	    }
		$count = M("article")->where($map)->count();
	    $page  = new Page($count,10);
		$list = M("article")->where($map)->limit($page->firstRow,$page->listRows)->select();
		
		
		foreach($list as $k=>$v){
			
			$list[$k]['add_time']=date('Y-m-d',$v['add_time']);
			$list[$k]['start_time']=date('Y年m月d日',$v['start_time']);
			$list[$k]['end_time']=date('-d日',$v['end_time']);
			$list[$k]['content']= str_replace("&nbsp;","",$v['content']);
			$list[$k]['content']= strip_tags($list[$k]['content']);
			
			
			$group_arr=[];
				//拆分字符串
			$group_arr=explode(",", $v['group_id']);
				
				
			foreach($group_arr as $kk=>$vv){
					
				$list[$k]['group_arr'][$kk]=getUsername($vv);
					
			}
				
			
				
		}
			
				$this->assign('list',$list);
				
				$show=$page->show();
				$this->assign('page',$show);
				
				return $this->fetch();
		
    }
	
	


	

}