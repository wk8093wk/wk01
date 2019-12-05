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

class Group extends Base {
	
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
	public function index(){
		$userId = 'dwjzw92f380f4ab24689e2';
		$secret = 'W8Wti7EGOl4k4V368YlgeYJ8A270v9G5';
		$sign = base64_encode($secret.time());
	    $url = "http://test.open.izhixue.cn/token/create?userId=".$userId."&sign=".$sign;
		$return = getUrl($url);
		$json = json_decode($return, true);
		$this->assign('token',$json['token']);
		return $this->fetch();
	}

    public function group(){
	
		$id = I('get.id',0);
		$this->assign('id',$id);
		
		$infog = M('group')->where('group_id',$id)->find(); 
		$this->assign('infog',$infog);
	//	if($infog['catid'] == 0){
//				$infogf = M('group')->where('catid',$infog['catid'])->select(); 
//		}else{
//				$infogf = M('group')->where('group_id',$id)->find(); 
//		}
		
		
		$article = M('article')->select();
		$this->assign('article',$article);
		
		


		$map = new Where;
		$map['is_delete']=0;
		$map['status']=1;
		$map['mold']=array('neq',3);
		if($id>0){
			//$map['group_id'] = ['','exp', Db::raw("FIND_IN_SET($id, group_id)")];
			//s$map[] = array('exp','FIND_IN_SET($id, group_id)');
			//$data = M('group')->where('exp','FIND_IN_SET($id,group_id)')->select();
//	  		$map['group_id']=array('like', "%".$id."%");
			//$map['catid']=array('like', "%".$id."%");
	    }
		$count = M("article")->where($map)->where('find_in_set('.$id.', group_id_new)')->count();
	    $page  = new Page($count,10);
		$list = M("article")->where($map)->where('find_in_set('.$id.', group_id_new)')->limit($page->firstRow,$page->listRows)->order('turnon desc')->select();
		
		
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
			
				$shu = ceil($count/10);
				$this->assign('shu',$shu);
			
				$this->assign('list',$list);
				
				$show=$page->show();
				$this->assign('page',$show);
				
				return $this->fetch();
		
    }
	





	


	

}