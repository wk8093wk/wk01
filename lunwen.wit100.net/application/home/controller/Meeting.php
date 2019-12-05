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

class Meeting extends Base {
	
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
		  
		$osstoken = gettoken();
		$this->assign('osstoken',$osstoken);
		
        return $this->fetch();

    }
	
	
	

	public function ajax_form(){
			
		  $user_id = cookie('user_id');
		  $aaa = M('user')->where('user_id',$user_id)->find();
		  $text=I('get.');
		  
		  $spare=I('get.spare',2);
		  
		  $hotel_id=I('get.hotel_id',0);
		  $room_id=I('get.room_id',0);
		  $in_time=I('get.in_time',0);
		  $out_time=I('get.out_time',0);
		  
		  
			if($text){
				
				
				$data1['company']=$text['company'];
				$data1['name']=$text['name'];
				$data1['sex']=$text['sex'];
				$data1['title']=$text['title'];
				$data1['department']=$text['department'];
				
				
				$data['user_id']=$user_id;	
				$data['catid']=$text['catid'];
				$data['company']=$text['company'];
				$data['name']=$text['name'];
				$data['sex']=$text['sex'];
				$data['title']=$text['title'];
				$data['department']=$text['department'];
				$data['mobile']=$text['mobile'];
				$data['email']=$text['email'];
				
				
				$data['companyname']=$text['companyname'];
				$data['duty']=$text['duty'];
				$data['companyadd']=$text['companyadd'];
				$data['tel']=$text['tel'];
				$data['deposit']=$text['deposit'];
				$data['account']=$text['account'];
				
				$data['payment']=$text['payment'];
				$data['project']=$text['project'];
				
				$data['spare']=$spare; 
				$data['addressname']=$text['addressname'];
				$data['addresstel']=$text['addresstel']; 
				$data['addressadd']=$text['addressadd'];
				$data['hotel_id']=$hotel_id;
				$data['room_id']=$room_id;
				
				$data['s_province']=$text['s_province'];
				$data['s_city']=$text['s_city'];
				$data['s_county']=$text['s_county'];
				
				
				$data['in_time']=strtotime($in_time);
				$data['out_time']=strtotime($out_time);
				
				$data['add_time']=time();
				$data['status']=1;
				
				if($data['hotel_id']==0){
					$data['stay']=0;
				}else{
					$data['stay']=1;
					}
					
				$data['mobile000']=$aaa['mobile'] ;
				$data['email000']=$aaa['email'] ;	
			
				if($user_id==''){
					$this->ajaxReturn(array('code'=>'2','msg'=>'请先登录'));
					exit();
				}
				else{
					$userfind=M('registered')->where('catid',$data['catid'])->where('user_id',$user_id)->find();
					if($userfind){
						if($userfind['status']==1){
							$raw= M('registered')->where('catid',$data['catid'])->where('user_id',$user_id)->data($data)->update();
						}else{
							$raw= M('registered')->where('catid',$data['catid'])->where('user_id',$user_id)->data($data)->update();	
							M('article')->where('article_id',$data['catid'])->setInc('joiner'); 
							M('meeting')->where('meeting_id',$data['catid'])->setInc('joiner'); 
						}
						
						
					}else{
						$raw= M('registered')->data($data)->insert();
						M('article')->where('article_id',$data['catid'])->setInc('joiner'); 
						M('meeting')->where('meeting_id',$data['catid'])->setInc('joiner'); 
					}
					
					
					
				if($text['xiugai']==0){
					M('user')->where('user_id',$user_id)->update($data1);
				}
							
					 $res=array('code'=>0,'msg'=>'添加成功'); 
					 $this->ajaxReturn($res); 
				}
			
			}else{
				$res=array('code'=>1,'msg'=>'添加失败'); 
				$this->ajaxReturn($res);
				
				
		}
		// $this->ajaxReturn(array('text'=> $text1,'msg'=>'传输成功','status'=>1));
//		 
    	 exit();
	 }
	 
	 
	 
	 
	 public function ajax_form000(){
			
		  $user_id = cookie('user_id');
		  $aaa = M('user')->where('user_id',$user_id)->find();
		  $text=I('get.');
		  
		  $spare=I('get.spare',2);
		  
		  $hotel_id=I('get.hotel_id',0);
		  $room_id=I('get.room_id',0);
		  $in_time=I('get.in_time',0);
		  $out_time=I('get.out_time',0);
		  
		  
			if($text){
				
				
				$data1['company']=$text['company'];
				$data1['name']=$text['name'];
				$data1['sex']=$text['sex'];
				$data1['title']=$text['title'];
				$data1['department']=$text['department'];
				
				
				$data['user_id']=$user_id;	
				$data['catid']=$text['catid'];
				$data['company']=$text['company'];
				$data['name']=$text['name'];
				$data['sex']=$text['sex'];
				$data['title']=$text['title'];
				$data['department']=$text['department'];
				$data['mobile']=$text['mobile'];
				$data['email']=$text['email'];
				
				
				$data['companyname']=$text['companyname'];
				$data['duty']=$text['duty'];
				$data['companyadd']=$text['companyadd'];
				$data['tel']=$text['tel'];
				$data['deposit']=$text['deposit'];
				$data['account']=$text['account'];
				
				$data['payment']=$text['payment'];
				$data['project']=$text['project'];
				
				$data['spare']=$spare; 
				$data['addressname']=$text['addressname'];
				$data['addresstel']=$text['addresstel']; 
				$data['addressadd']=$text['addressadd'];
				$data['hotel_id']=$hotel_id;
				$data['room_id']=$room_id;
				
				$data['s_province']=$text['s_province'];
				$data['s_city']=$text['s_city'];
				$data['s_county']=$text['s_county'];
				
				
				$data['in_time']=strtotime($in_time);
				$data['out_time']=strtotime($out_time);
				
				$data['add_time']=time();
				$data['status']=1;
				
				if($data['hotel_id']==0){
					$data['stay']=0;
				}else{
					$data['stay']=1;
					}
					
				$data['mobile000']=$aaa['mobile'] ;
				$data['email000']=$aaa['email'] ;	
			
				if($user_id==''){
					$this->ajaxReturn(array('code'=>'2','msg'=>'请先登录'));
					exit();
				}
				else{
					$userfind=M('registered')->where('catid',$data['catid'])->where('user_id',$user_id)->find();
					if($userfind){
						if($userfind['status']==1){
							$raw= M('registered')->where('catid',$data['catid'])->where('user_id',$user_id)->data($data)->update();
						}else{
							$raw= M('registered')->where('catid',$data['catid'])->where('user_id',$user_id)->data($data)->update();	
							M('article')->where('article_id',$data['catid'])->setInc('joiner'); 
							M('meeting')->where('meeting_id',$data['catid'])->setInc('joiner'); 
						}
						
						
					}else{
						$raw= M('registered')->data($data)->insert();
						M('article')->where('article_id',$data['catid'])->setInc('joiner'); 
						M('meeting')->where('meeting_id',$data['catid'])->setInc('joiner'); 
					}
					
							
					 $res=array('code'=>0,'msg'=>'添加成功'); 
					 $this->ajaxReturn($res); 
				}
			
			}else{
				$res=array('code'=>1,'msg'=>'添加失败'); 
				$this->ajaxReturn($res);
				
				
		}
		// $this->ajaxReturn(array('text'=> $text1,'msg'=>'传输成功','status'=>1));
//		 
    	 exit();
	 }
	
	
	
	
	
	
		public function quxiao(){
			
		  $user_id = cookie('user_id');
		  $text=I('post.');
		  
			if($text){
				
				$data['status']=0;
			
				if($user_id==''){
					$this->ajaxReturn(array('code'=>'2','msg'=>'请先登录'));
					exit();
				}
				else{
					$userfind=M('registered')->where('catid',$text['catid'])->where('user_id',$user_id)->find();
					if($userfind){
						$raw= M('registered')->where('catid',$text['catid'])->where('user_id',$user_id)->data($data)->update();
						M('article')->where('article_id',$text['catid'])->setDec('joiner'); 
						M('meeting')->where('meeting_id',$text['catid'])->setDec('joiner'); 
						
						$res=array('code'=>0,'msg'=>'取消成功'); 
						$this->ajaxReturn($res);
					}
				
				}
				 
			
			}else{
				$res=array('code'=>1,'msg'=>'取消失败'); 
				$this->ajaxReturn($res);
				
				
		}
		// $this->ajaxReturn(array('text'=> $text1,'msg'=>'传输成功','status'=>1));
//		 
    	 exit();
	 }
	
	
		public function upload(){
			 exit();
		}
	
	
	
	public function ajax_form2(){
		
	  $user_id = cookie('user_id');	
	  
	  $id = I('get.meeting_id','');
	    $tijiao =M('registered')->where('user_id',$user_id)->where('catid',$id)->find();
	  
	  $text=I('post.');
	 
		if($text){
			
			$data['meeting_id']=$text['meeting_id'];
			// $text1=I('post.text1');
			$data['user_id']= $user_id;
			
			$data['name']=$text['name'];
			$data['annex']=$text['annex'];
			
			$data['add_time']=time();
			
			if($user_id==''){
					$this->ajaxReturn(array('code'=>'2','msg'=>'请先登录'));
					exit();
				}else if($tijiao['status']!= 1){
					
					$this->ajaxReturn(array('code'=>'3','msg'=>'请先报名'));
					exit();
				}
			
			$raw= M('paper')->data($data)->insert();
			 
			M('registered')->where('user_id',$user_id)->where('catid',$data['meeting_id'])->setInc('paper'); 
			
			if($raw){
			 $res=array('code'=>0,'msg'=>'添加成功'); 
			 $this->ajaxReturn($res); 
			
			}else{
				$res=array('code'=>1,'msg'=>'添加失败'); 
				$this->ajaxReturn($res);
			}
		}else{
			$res=array('code'=>1,'msg'=>'添加失败'); 
			$this->ajaxReturn($res);
		
			 	
			
		}
		
		 
			
	 
	 exit();
	 }
	
	
	
	public function del(){
		
		$text=I('post.');
	 		
		if($text){
			
			$row=M('paper')->update(array('paper_id'=>$text['paper_id'],'is_delete'=>1));
			if($row){
			  $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
			}
			
			
			}
		
		
		
		
	}
	
	
	
	
	
    public function meeting(){  
		$id = I('get.id',0);
		$this->assign('id',$id);
		
		$list2 = M("registered")->where('registered_id')->select();
		
		
		$map = new Where;
		$count = M("meeting")->where($map)->where('is_delete',0)->where('status',1)->count();
	    $page  = new Page($count,10);
		$list = M("meeting")->where($map)->limit($page->firstRow,$page->listRows)->where('is_delete',0)->where('status',1)->order("add_time desc")->select();
		
		foreach($list as $k=>$v){
			
			$list[$k]['add_time']=date('Y-m-d',$v['add_time']);
			$list[$k]['content']= str_replace("&nbsp;","",$v['content']);
			$list[$k]['content']= strip_tags($list[$k]['content']);
			
			$list[$k]['start_time']=date('Y年m月d日',$v['start_time']);
			$list[$k]['end_time']=date('-d日',$v['end_time']);
			
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
	
	
	
	
	
    public function meeting_detail(){ 
	
		$user_id = cookie('user_id');
		
		$id = I('get.id');
		$this->assign('id',$id);
		
		$osstoken = gettoken();
		$this->assign('osstoken',$osstoken);
		
		//登录用户个人资料
		$userform = M('user')->where('user_id',$user_id)->find(); 
		$this->assign('userform',$userform);
		
		//最近报名表
		$lastform2 = M('registered')->where('user_id',$user_id)->where('catid',$id)->find(); 
		
	
		
		if($lastform2){ 
				
				$this->assign('lastform2',$lastform2);
			}
			
		else{
				
				$lastform2 = M('registered')->where('user_id',$user_id)->order("add_time desc")->find();
				$this->assign('lastform2',$lastform2);
			}
		
		
		
		//查找登录用户
		$infor = M('registered')->where('user_id',$user_id)->where('catid',$id)->find(); 
		if($infor){
			$infor['in_time']=date('Y-m-d',$infor['in_time']);
			$infor['out_time']=date('Y-m-d',$infor['out_time']);
		}
		$this->assign('infor',$infor);

		
		
		
		
		$infom = M('meeting')->where('meeting_id',$id)->find(); 
		$info3 = M('hotel')->where('catid',$infom['meeting_id'])->find();
		
		
		$infom['add_time']=date('Y-m-d',$infom['add_time']);
		$infom['baoming_time1']=date('Y年m月d日',$infom['baoming_time1']);
		$infom['baoming_time2']=date('-m月d日',$infom['baoming_time2']);
		$infom['baodao_time']=date('Y年m月d日',$infom['baodao_time']);
		$infom['start_time']=date('Y年m月d日',$infom['start_time']);
		$infom['end_time']=date('-m月d日',$infom['end_time']);
			
		$infom['content']=htmlspecialchars_decode($infom['content']);
		
			$group_arr=[];
			//拆分字符串
			$group_arr=explode(",", $infom['group_id']);
			
			
			foreach($group_arr as $k=>$v){
				
				$infom['group_arr'][$k]=getUsername($v);
				
			}
		
		$this->assign('infom',$infom);
		
		
		
		$info2 = M('meeting_annex')->where('catid',$infom['meeting_id'])->where('is_delete',0)->select(); 
		$this->assign('info2',$info2);
		
		
        //浏览次数+1   
        $click = M('meeting')->where("meeting_id",$id)->setInc('click');
        $this->assign('click',$click);  
		
		$www = M('meeting')->where('meeting_id',$id)->find();
		$data1['click']=$www['click'];
		M('article')->where('article_id',$id)->update($data1);
			 
		
        
		
		
		
		//酒店，房间
		$list = M("hotel")->where('is_delete',0)->where('catid',$id)->order("add_time desc")->select();
		foreach($list as $k=>$v){
			$list2 = M('room')->where('is_delete',0)->where('catid',$v['hotel_id'])->select();
			$list[$k]['data'] = $list2;
		}
		
		$this->assign('list',$list);
		
		
		//论文列表
		$count2 = M("paper")->where('is_delete',0)->where('meeting_id',$id)->where('user_id',$user_id)->count();
		$list2 = M("paper")->where('is_delete',0)->where('meeting_id',$id)->where('user_id',$user_id)->order("add_time desc")->select();
		foreach($list2 as $k=>$v){
		}
		$this->assign('count2',$count2);
		$this->assign('list2',$list2);
		
		//查询地区
		$province = M('region')->where('region_type',1)->select();
		$this->assign('province',$province);
		//查询下级地区
		
		
		
		$city=M('region')->where('parent_id',$infor['s_province'])->select();
		$this->assign('city',$city);
		
		
		$county=M('region')->where('parent_id',$infor['s_city'])->select();
		$this->assign('county',$county);
		
		
	    
        return $this->fetch();

    } 
	
	
	public function ajax_address(){
		$region_id = I('post.region_id');
		
		$data=M('region')->where('parent_id',$region_id)->select();

		$this->ajaxReturn($data);
   		exit();
	}
	
	public function getRegion(){
		$id = I('get.pid',1);
		$s_city = M('region')->where('parent_id',$id)->select();
		return $s_city;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	   public function meeting_detail2(){ 
	
		$user_id = cookie('user_id');
		
		$id = I('get.id');
		$this->assign('id',$id);
		
		$osstoken = gettoken();
		$this->assign('osstoken',$osstoken);
		
		//登录用户个人资料
		$userform = M('user')->where('user_id',$user_id)->find(); 
		$this->assign('userform',$userform);
		
		//最近报名表
		$lastform2 = M('registered')->where('user_id',$user_id)->where('catid',$id)->find(); 
		
	
		
		if($lastform2){ 
				
				$this->assign('lastform2',$lastform2);
			}
			
		else{
				
				$lastform2 = M('registered')->where('user_id',$user_id)->order("add_time desc")->find();
				$this->assign('lastform2',$lastform2);
			}
		
		
		
		//查找登录用户
		$infor = M('registered')->where('user_id',$user_id)->where('catid',$id)->find(); 
		if($infor){
			$infor['in_time']=date('Y-m-d',$infor['in_time']);
			$infor['out_time']=date('Y-m-d',$infor['out_time']);
		}
		$this->assign('infor',$infor);

		
		
		
		
		$infom = M('meeting')->where('meeting_id',$id)->find(); 
		$info3 = M('hotel')->where('catid',$infom['meeting_id'])->find();
		
		
		$infom['add_time']=date('Y-m-d',$infom['add_time']);
		$infom['baoming_time1']=date('Y年m月d日',$infom['baoming_time1']);
		$infom['baoming_time2']=date('-m月d日',$infom['baoming_time2']);
		$infom['baodao_time']=date('Y年m月d日',$infom['baodao_time']);
		$infom['start_time']=date('Y年m月d日',$infom['start_time']);
		$infom['end_time']=date('-m月d日',$infom['end_time']);
			
		$infom['content']=htmlspecialchars_decode($infom['content']);
		
			$group_arr=[];
			//拆分字符串
			$group_arr=explode(",", $infom['group_id']);
			
			
			foreach($group_arr as $k=>$v){
				
				$infom['group_arr'][$k]=getUsername($v);
				
			}
		
		$this->assign('infom',$infom);
		
		
		
		$info2 = M('meeting_annex')->where('catid',$infom['meeting_id'])->where('is_delete',0)->select(); 
		$this->assign('info2',$info2);
		
		
        //浏览次数+1   
        $click = M('meeting')->where("meeting_id",$id)->setInc('click');
        $this->assign('click',$click);  
		
		$www = M('meeting')->where('meeting_id',$id)->find();
		$data1['click']=$www['click'];
		M('article')->where('article_id',$id)->update($data1);
			 
		
        
		
		
		
		//酒店，房间
		$list = M("hotel")->where('is_delete',0)->where('catid',$id)->order("add_time desc")->select();
		foreach($list as $k=>$v){
			$list2 = M('room')->where('is_delete',0)->where('catid',$v['hotel_id'])->select();
			$list[$k]['data'] = $list2;
		}
		
		$this->assign('list',$list);
		
		
		//论文列表
		$count2 = M("paper")->where('is_delete',0)->where('meeting_id',$id)->where('user_id',$user_id)->count();
		$list2 = M("paper")->where('is_delete',0)->where('meeting_id',$id)->where('user_id',$user_id)->order("add_time desc")->select();
		foreach($list2 as $k=>$v){
		}
		$this->assign('count2',$count2);
		$this->assign('list2',$list2);
		
		//查询地区
		$province = M('region')->where('region_type',1)->select();
		$this->assign('province',$province);
		//查询下级地区
		
		
		
		$city=M('region')->where('parent_id',$infor['s_province'])->select();
		$this->assign('city',$city);
		
		
		$county=M('region')->where('parent_id',$infor['s_city'])->select();
		$this->assign('county',$county);
		
		
	    
        return $this->fetch();

    } 
	
	
	
	
	
	
	
	
	
	
	
	
	 
	

}