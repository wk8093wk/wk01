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

class Project extends Base {
	
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
	
//	
//	public function clickon(){
//		
//		  $text=I('post.');
//		 
//			if($text){
//			// $text1=I('post.text1');
//			$data['click1']=$text['click1'];
//			
//			
//			
//			$raw= M('project')->data($data)->insert();
//			 
//			
//			 $res=array('code'=>0,'msg'=>'添加成功'); 
//             $this->ajaxReturn($res); 
//			
//			}else{
//				$res=array('code'=>1,'msg'=>'添加失败'); 
//				$this->ajaxReturn($res);
//		}
//		// $this->ajaxReturn(array('text'=> $text1,'msg'=>'传输成功','status'=>1));
////		 
//    	 exit();
//	 }
	
	
	//添加阅读量
	public function ajax_num(){
		$project_id = I('post.project_id',0);
		
		$res=M('project')->where('project_id',$project_id)->setInc('click'); 
		
		if($res){
			$this->ajaxReturn(array('status'=>1));
		}else{
			$this->ajaxReturn(array('status'=>0));
		}
	}



    public function project(){  
	
		$id = I('get.id',0);
		$this->assign('id',$id);
		
		$info7 = M('project2')->where('project2_id',1)->find(); 
		$this->assign('info7',$info7);
		$info8 = M('project2')->where('project2_id',2)->find(); 
		$this->assign('info8',$info8);
		$info9 = M('project2')->where('project2_id',3)->find(); 
		$this->assign('info9',$info9);
		
		
		$info0 = M('project')->where('project_id',$id)->find(); 
		$this->assign('info0',$info0);
		
		$map = new Where;
		$count = M("project")->where($map)->where('is_delete',0)->count();
	    $page  = new Page($count,10);
		$list = M("project")->where($map)->limit($page->firstRow,$page->listRows)->where('is_delete',0)->order("add_time desc")->select();
		
		foreach($list as $k=>$v){
			
			$list[$k]['add_time']=date('Y-m-d',$v['add_time']);
			
			$list[$k]['content']= str_replace("&nbsp;","",$v['content']);
			$list[$k]['content']= strip_tags($list[$k]['content']);
			
			
		}
		
		$shu = ceil($count/10);
		$this->assign('shu',$shu);
		
		$this->assign('list',$list);
		
		
	    $show=$page->show();
	    $this->assign('page',$show);
		
//		$click1 = M('project')->where("project_id",$id)->find();
//        $this->assign('click1',$click1);  
//		$link = M('project')->where("project_id",$id)->find();
//        $this->assign('link',$link);  
	    
        return $this->fetch();

    }
	
	
	
	
	    public function project_detail(){ 
		$id = I('get.id');
		$this->assign('id',$id);
		$infon = M('project')->where('project_id',$id)->find(); 
		
		$infon['add_time']=date('Y-m-d H:i:s',$infon['add_time']);
		$infon['content']=htmlspecialchars_decode($infon['content']);
		
		
	
		$this->assign('infon',$infon);
		
		
		
		$info2 = M('project_annex')->where('catid',$infon['project_id'])->where('is_delete',0)->select(); 
		$this->assign('info2',$info2);
		
		
        //浏览次数   
        $click = M('project')->where("project_id",$id)->setInc('click');
        $this->assign('click',$click); 
		
		$www = M('project')->where('project_id',$id)->find();
		$data1['click']=$www['click'];
		M('article')->where('article_id',$id)->update($data1); 
        
		
		$osstoken = gettoken();
		$this->assign('osstoken',$osstoken);
		
	    
        return $this->fetch();

    } 
	
	
	
	
	 
	

}