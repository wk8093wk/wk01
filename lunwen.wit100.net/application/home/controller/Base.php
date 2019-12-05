<?php

namespace app\home\controller;
use think\Controller;
use think\Db;
use think\db\Where;
use think\facade\Session;
use think\facade\Request;



use think\Page3;

class Base extends Controller {
    public $session_id;
    public $config = array();
    /*
     * 初始化操作
     */
    public function initialize(){
		
        parent::initialize();
		$user = Session::get('user');
		
		if($user){
			
			$this->assign('user',$user);
			
			//购物车数量
		
			$res = M('cart')->where('user_id',$user['user_id'])->cache(true)->select();
			
			
			$this->assign('cartnum',count($res));
			
			
			
		}else{
			$this->assign('user','');
			
			$this->assign('cartnum',0);
		}
		
		
		
        $res = M('config')->where('is_del',0)->select();
		foreach($res as $k=>$val){
                    $config[$val['name']] = $val['value'];
        }
		$this->assign('config',$config);
		
		
		
		//用户登录状态
		$user_id = cookie('user_id');
		$info = M('user')->where('user_id',$user_id)->find();
		$this->assign('info',$info);
		$this->assign('user_id',$user_id);

		
		
		//友情链接
		$link = M('link')->where('is_delete',0)->select();
		
		$this->assign('link',$link);
		
		
		
		//会议日历->whereTime('start_time', 'between', ['2019-10-1', '2019-10-30'])->whereTime('end_time', 'between', ['2019-10-1', '2019-10-30'])
		$map3 = new Where;
		$map3['is_delete']=0;
		$map3['status']=1;
		$count3 = M("meeting")->where($map3)->count();
//		print_r($count3);
//		exit();
	    $page3  = new Page3($count3,5);
		$list7 = M("meeting")->where($map3)->limit($page3->firstRow,$page3->listRows)->order("start_time asc")->select();
		foreach($list7 as $k=>$v){
			$list7[$k]['start_time']=date('Y/m/d-',$v['start_time']);
			$list7[$k]['end_time']=date('Y/m/d',$v['end_time']);
			
		}
		
		$this->assign('list7',$list7);
		$show3=$page3->show3();
	    $this->assign('page3',$show3);
		
		
		//获取当前年份
		
		$now_year=date("Y",time());
		$this->assign('now_year',$now_year);
		
		$start_time=strtotime($now_year.'-01-01 00:00:00');
		$end_time=strtotime($now_year.'-12-31 23:59:59');
		
		$wheres = new Where;
		
		$wheres['is_delete']=0;
		$wheres['status']=1;
		$wheres['start_time']=array('EGT',$start_time);
		$wheres['start_time']=array('LT',$end_time);
		
		
		$list_meeting=M("meeting")->where($wheres)->order("start_time asc")->limit(0,5)->select();
		
		foreach($list_meeting as $k=>$v){
			$list_meeting[$k]['start_time']=date('Y/m/d-',$v['start_time']);
			$list_meeting[$k]['end_time']=date('Y/m/d',$v['end_time']);
			
		}
		
		
		$this->assign('list_meeting',$list_meeting);
		
		
		
		
		
		
		
		//右侧工作组
		$countg = M("group")->where('is_delete',0)->where('catid',0)->count();
		
		$this->assign('countg',$countg);
		$list6 = M("group")->where('is_delete',0)->where('catid',0)->order("sort asc")->select();
		foreach($list6 as $k=>$v){
			$group1 = M('group')->where('is_delete',0)->where('catid',$v['group_id'])->order("sort asc")->select();
			$list6[$k]['data'] = $group1;
		}
		
		$this->assign('list6',$list6);
	//	print_r($list6);
	//	exit();
//


		//右侧广告
		$now=time();
		
		$adv = M("adv")->where('is_delete',0)->where('start_time','<= time',$now)->where('end_time','> time',$now)->order("add_time desc")->select();
		foreach($adv as $k=>$v){
			$adv[$k]['start_time']=date('Y年m月d日',$v['start_time']);
			$adv[$k]['end_time']=date('-m月d日',$v['end_time']);
			
		}
		
		$this->assign('adv',$adv);
		
		
	

			
			
			
			
		

		$authRule = M('arctype')->where('is_hidden=1')->cache(true)->order('listorder','asc')->select();
		$menus = array();
        foreach ($authRule as $key=>$val){
            //$authRule[$key]['url'] = url($val['url']);
            if($val['parent_id']==0){
               
                    $menus[] = $val;
               
            }
        }
		foreach ($menus as $k=>$v){
            foreach ($authRule as $kk=>$vv){
                if($v['id']==$vv['parent_id']){
                        $menus[$k]['children'][] = $vv;
						
                }
            }
        }
		$allcats = array();
		foreach ($authRule as $key=>$val){
                    $allcats[$val['id']] = $val;
        }
		$this->assign('allcats',$allcats);
		$this->assign('menus',$menus);
    }
    /**
     * 保存公告变量到 smarty中 比如 导航 
     */
    public function public_assign()
    {
       
    }

    /*
     * 
     */
    public function ajaxReturn($data)
    {
        exit(json_encode($data));
    }
	
	
	//用户退出登录
	public function out(){
		cookie('user_id' , null);
		$this->redirect('/');
		return $this->fetch();
	}
	
	
	//
//	public function out(){
//		
//	  $map = new Where;
//	  $map['a.name'] = array('between',);
//	  $map['a.news_id'] = array('eq',$id);
//	  $row=M('news')->alias('a')->join('meeting b', 'o.shop_id = s.id', 'LEFT')->field('COUNT(*) AS count,o.cat')->group('o.cat')->where($map)->select();
//	
//	}

  public function ajax_now_year(){
  	$now_year=I('post.year');
	$start_time=strtotime($now_year.'-01-01 00:00:00');
	$end_time=strtotime($now_year.'-12-31 23:59:59');
	
	$wheres = new Where;
	
	$wheres['is_delete']=0;
	$wheres['status']=1;
	$wheres['start_time']=array('EGT',$start_time);
	$wheres['end_time']=array('LT',$end_time);
	
	
	$list_meeting=M("meeting")->where($wheres)->order("start_time asc")->limit(0,5)->select();
	
	foreach($list_meeting as $k=>$v){
		$list_meeting[$k]['start_time']=date('Y/m/d-',$v['start_time']);
		$list_meeting[$k]['end_time']=date('Y/m/d',$v['end_time']);
	}
	
	$this->ajaxReturn(array('status'=>1,'list'=>$list_meeting));
  
  
  }
		
	public function ajax_year_details(){
		$now_year=I('post.now_year');
		$p=I('post.p');
		
		
		
		
		$start_time=strtotime($now_year.'-01-01 00:00:00');
		$end_time=strtotime($now_year.'-12-31 23:59:59');
		
		$wheres = new Where;
	
		$wheres['is_delete']=0;
		$wheres['status']=1;
		$wheres['start_time']=array('EGT',$start_time);
		$wheres['end_time']=array('LT',$end_time);
		
		$count=M("meeting")->where($wheres)->order("start_time asc")->count();
		
		$ps=ceil($count/5)-1;
		
		if($p > $ps){
			$this->ajaxReturn(array('status'=>-1,'msg'=>'当前为最后一页'));
		}
		
		if($p < 0){
			$this->ajaxReturn(array('status'=>-1,'msg'=>'当前为第一页'));
		}
		
		$list_meeting=M("meeting")->where($wheres)->order("start_time asc")->limit($p*5,5)->select();
		foreach($list_meeting as $k=>$v){
				$list_meeting[$k]['start_time']=date('Y/m/d-',$v['start_time']);
				$list_meeting[$k]['end_time']=date('Y/m/d',$v['end_time']);
		}

		$this->ajaxReturn(array('status'=>1,'list'=>$list_meeting));

	}
		
		
	
}