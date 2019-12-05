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

class News extends Base {
	
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


    public function news(){  
		$id = I('get.id',0);
		$this->assign('id',$id);
		
		$page = I('post.page',1);
		$map = new Where;
		
		$map['is_delete']=0;
		
		$map['onlygroup']=0;
		
		$map['status']=1;
		
		
		$count = M("news")->where($map)->count();
	    $page  = new Page($count,10);
		$list = M("news")->where($map)->limit($page->firstRow,$page->listRows)->order("turnon desc")->order("add_time desc")->select();
		
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
		$shu = ceil($count/10);
		$this->assign('shu',$shu);
		
		$this->assign('list',$list);
		
	    $show=$page->show();
	    $this->assign('page',$show);
	    
        return $this->fetch();

    }
	
	
    public function news_detail(){ 
		$id = I('get.id');
		$this->assign('id',$id);
		$infon = M('news')->where('news_id',$id)->find(); 
		
		$infon['add_time']=date('Y-m-d H:i:s',$infon['add_time']);
		$infon['content']=htmlspecialchars_decode($infon['content']);
		
		
			
			$group_arr=[];
			//拆分字符串
			$group_arr=explode(",", $infon['group_id']);
			
			
			foreach($group_arr as $k=>$v){
				
				$infon['group_arr'][$k]=getUsername($v);
				
			}
		
		
		$this->assign('infon',$infon);
		
		
		
		$info2 = M('news_annex')->where('catid',$infon['news_id'])->where('is_delete',0)->select(); 
	
		$this->assign('info2',$info2);
		
		
        //浏览次数   
        $click = M('news')->where("news_id",$id)->setInc('click');
        $this->assign('click',$click); 
		
		$www = M('news')->where('news_id',$id)->find();
		$data1['click']=$www['click'];
		M('article')->where('article_id',$id)->update($data1); 
        
		
		$osstoken = gettoken();
		$this->assign('osstoken',$osstoken);
	    
        return $this->fetch();

    } 
	
	
	
	

}