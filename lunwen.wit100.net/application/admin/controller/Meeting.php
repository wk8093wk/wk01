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

class Meeting extends Common
{
	public function initialize(){
        parent::initialize();
		
    }
    public function index(){
		$admin_id=session('admin_id');
		$raw = M('admin')->where('admin_id',$admin_id)->find();
		$this->assign('raw',$raw);
		
		$id = I('get.id/d',0);
	    $info = M('meeting')->where('meeting_id',$id)->find();
		$this->assign('info',$info);
		$admin_list = M('admin')->field('admin_id,user_name')->select();
		$this->assign('admin_list',$admin_list);
		$group_list = M('group')->where('is_delete', 0)->select();
		$this->assign('group_list',$group_list);
		
//		
//		
//		//查询出所有的类目
//		
//		$group_id=I('get.group_id');
//		
//		$group=I('get.group');
//		
//		if(!$group_id){
//			$group_id=1;
//		}
//		$this->assign('group_id',$group_id);
//		//查询所有的大类别
//		$this->assign('group',$group);
//		
//		$group_res=M('group')->select();
//		
//		
//		$this->assign('group_res',$group_res);
//		
//		
//		
//		
     	return $this->fetch();
    }
	
	
	
	public function index_json()
    { 
	  $admin_id=session('admin_id');
	  $raw = M('admin')->where('admin_id',$admin_id)->find();
	  
	  
	  
	  
	  
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  
	  $sort_by=I('post.sort_by','meeting_id');
	  $sort_order=I('post.sort_order','desc');
	  $where = new Where;
	  $where['is_delete']=array('eq',0);
	  if($key_word){
		 $where['name']=array('like','%'.$key_word.'%');  
	  }
	 
	  if( $raw['role_id'] == 3 ){
		 
			
	  $count = M('meeting')->where($where)->where('administrators',$admin_id)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('meeting')->where($where)->where('administrators',$admin_id)->limit($page->firstRow,$page->listRows)->order($sort_by.' '.$sort_order)->select(); 
	  foreach($logs as $k=>$v){
		  
		$logs[$k]['administrators']= getadministrators($v['administrators']);
		  
		 $logs[$k]['add_time']=date('Y-m-d H:i:s',$v['add_time']);
		 //$raw = M('admin')->where('admin_id',$v['admin_id'])->find();
//		 $logs[$k]['admin_name']=$raw['user_name']; 
		 if($v['status']==0){
			 $logs[$k]['status'] = '已关闭';
		 }elseif($v['status']==1){
			 $logs[$k]['status'] = '已发布';
		 }else{
			 $logs[$k]['status'] = '未发布';
		 }
		 
		 
		 /* $rows=M('users')->where("user_id",$id)->find();
		 return $rows['user_name'];*/
		$group_arr=[];
		//拆分字符串
		$group_arr=explode(",", $v['group_id']);
		
		$group_str="";
		
		foreach($group_arr as $kk=>$vv){
			
			$group_str=$group_str.getUsername($vv).'&ensp;&ensp;';
		}
		
		$logs[$k]['group_id']=$group_str;

		 //print_r($group);
		// exit();
		
	  }
	  
	  
	  }else{
			
	  $count = M('meeting')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('meeting')->where($where)->limit($page->firstRow,$page->listRows)->order($sort_by.' '.$sort_order)->select(); 
	  foreach($logs as $k=>$v){
		  
		$logs[$k]['administrators']= getadministrators($v['administrators']);
		  
		 $logs[$k]['add_time']=date('Y-m-d H:i:s',$v['add_time']);
		 //$raw = M('admin')->where('admin_id',$v['admin_id'])->find();
//		 $logs[$k]['admin_name']=$raw['user_name']; 
		 if($v['status']==0){
			 $logs[$k]['status'] = '已关闭';
		 }elseif($v['status']==1){
			 $logs[$k]['status'] = '已发布';
		 }else{
			 $logs[$k]['status'] = '未发布';
		 }
		 
		 
		 /* $rows=M('users')->where("user_id",$id)->find();
		 return $rows['user_name'];*/
		$group_arr=[];
		//拆分字符串
		$group_arr=explode(",", $v['group_id']);
		
		$group_str="";
		
		foreach($group_arr as $kk=>$vv){
			
			$group_str=$group_str.getUsername($vv).'&ensp;&ensp;';
		}
		
		$logs[$k]['group_id']=$group_str;

		 //print_r($group);
		// exit();
		
	  }
	   }
	   
	   
	
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
	  
	  $group_list = M('group')->where('is_delete', 0)->select();
		$this->assign('group_list',$group_list);
        return $this->fetch();
    }
	
	public function art_del(){
		$admin_id=session('admin_id');
	  	$raw = M('admin')->where('admin_id',$admin_id)->find();
		if( $raw['role_id'] == 3 ){
			 $this->ajaxReturn(['code'=>0,'msg'=>'没有权限，删除失败！']);
		}else{
		
			$id = I('post.id',0);
			$row=M('meeting')->update(array('meeting_id'=>$id,'is_delete'=>1));
			$row2=M('article')->update(array('article_id'=>$id,'is_delete'=>1));
			if($row){
			  $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
			}
		}
			
			
	}
	
	public function art_dels(){
		$admin_id=session('admin_id');
	  	$raw = M('admin')->where('admin_id',$admin_id)->find();
		if( $raw['role_id'] == 3 ){
			 $this->ajaxReturn(['code'=>0,'msg'=>'没有权限，删除失败！']);
		}else{	
			
			$ids = I('post.ids');
			//$ids=implode(",", $id);
			$row=M('meeting')->where('meeting_id','in',$ids)->update(array('is_delete'=>1));
			$row2=M('article')->where('article_id','in',$ids)->update(array('is_delete'=>1));
			if($row){
			  $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
			}
		}
		
	}
	
	
		public function index_listorder(){
		
		$info['sort'] = I('get.sort');
	 
		
		$info['meeting_id'] = I('get.id');
		$row=M('meeting')->data($info)->update();
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['list'=>$info]);
		}
	}
	
	public function edit(){
		$admin_id=session('admin_id');
		$raw = M('admin')->where('admin_id',$admin_id)->find();
		$this->assign('raw',$raw);
		
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['name']=$param['name'];
			 $data['thumb']=$param['thumb'];
			 $data['content']=$param['content'];
			 $data['company']=$param['company'];
			 $data['address']=$param['address'];
			 $data['attendancefee']=$param['attendancefee'];
			
			 $data['status']=$param['status'];
			 
			 $data['baoming_time1']=strtotime($param['baoming_time1']);
			 $data['baoming_time2']=strtotime($param['baoming_time2']);
			 $data['baodao_time']=strtotime($param['baodao_time']);
			 $data['start_time']=strtotime($param['start_time']);
			 $data['end_time']=strtotime($param['end_time']);
			/* if(!empty($param['group_id'])){
				 $data['group_id']=implode(',',$param['group_id']);
			 }else{
				 $data['group_id']='';
				 }*/
			 $data['group_id']=$param['group_id'];
			 
			 
			 
			 
			
			if( $raw['role_id'] == 3 ){
				 
			}else{
			 $data['administrators']=$param['administrators'];	
			}
			 
			 
			 
			 
			 
			 $data['meeting_id']=$param['meeting_id'];
			 
			 M('meeting')->update($data);
			 
			 
			 
			 
			 
			 $data1['name']=$param['name'];
			 $data1['thumb']=$param['thumb'];
			 $data1['content']=$param['content'];
			 $data1['address']=$param['address'];
			 $data1['status']=$param['status'];
			/* if(!empty($param['group_id'])){
				 $data1['group_id']=implode(',',$param['group_id']);
			 }else{
				 $data1['group_id']='';
				 }*/
			 $data1['start_time']=strtotime($param['start_time']);
			 $data1['end_time']=strtotime($param['end_time']);
			
			$new=array();
			
			$group_arr=explode(",",$param['group_id']);
			
			foreach($group_arr as $k=>$v){
				
				$ress = M('group')->where('group_id',$v)->find();
				
				if($ress['catid'] != 0){
				    $new[]=$v;
					$new[]=$ress['catid'];
				}else{
					
					$new[] =$v;

				}
		
				
			}
			
			$new=array_unique($new);
			
			$new=implode(",",$new);
			
			 $data1['group_id_new']=$new;
			 
			 
			
			
			 M('article')->where('article_id',$param['meeting_id'])->update($data1);
			 M('article')->update(['group_id' => $data['group_id'],'article_id'=>$data['meeting_id']]);
			 
			 
			 
			 
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
			 
		  }
		  
		}
	    $id = I('get.id/d',0);
	    $info = M('meeting')->where('meeting_id',$id)->find();
		$group=[];
		//拆分字符串
		$group=explode(",", $info['group_id']);
		//$info['group']=$group;
		
		
		
		
		
		
		
		$this->assign('info',$info);
		$admin_list = M('admin')->field('admin_id,user_name')->select();
		$this->assign('admin_list',$admin_list);
		$group_list = M('group')->where('is_delete', 0)->select();
		//判断group_id是否在数组中
		
		
		foreach($group_list as $k=>$v){
			$group_res=in_array($v['group_id'], $group) ;
			
			if($group_res){
				$group_list[$k]['group_res']=1;
			}else{
				$group_list[$k]['group_res']=0;
			}
		}
		
		$this->assign('group_list',$group_list);
		
		
		
		$group_list_res = M('group')->where('is_delete', 0)->where('catid',0)->select();
		
	
		
		
		foreach($group_list_res as $k=>$v){
			
			$group_list_res2=M('group')->where('catid',$v['group_id'])->where('is_delete', 0)->select();
			
			$group_list_res[$k]['data']=$group_list_res2;
			
		}
		
		$this->assign('group_list_res',$group_list_res);
		
		
		$administrators_list = M('admin')->where('role_id',3)->select();
		$this->assign('administrators_list',$administrators_list);
		
        return $this->fetch();
	}
	
	public function add(){
		$admin_id=session('admin_id');
	  	
		
		if (Request::post()){
			
			
			$raw = M('admin')->where('admin_id',$admin_id)->find();
			if( $raw['role_id'] == 3 ){
				 $res=array('code'=>1,'msg'=>'没有权限，无法添加！'); 
				 $this->ajaxReturn($res);
			}
			
			
			$param = I('post.');
			if($param){
				
			 $data1['mold']=2;	
			 $data1['name']=$param['name'];
			 $data1['thumb']=$param['thumb'];
			 $data1['content']=$param['content'];
			 $data1['address']=$param['address'];
			/* if(!empty($param['group_id'])){
				 $data1['group_id']=implode(',',$param['group_id']);
			 }else{
				 $data1['group_id']='';
				 }	*/
			
			 $data1['group_id']=$param['group_id']; 
			 $data1['add_time']=time();
			 $data1['start_time']=strtotime($param['start_time']);
			 $data1['end_time']=strtotime($param['end_time']);	
				
			 $new=array();
			
			$group_arr=explode(",",$param['group_id']);
			
			foreach($group_arr as $k=>$v){
				
				$ress = M('group')->where('group_id',$v)->find();
				
				if($ress['catid'] != 0){
				    $new[]=$v;
					$new[]=$ress['catid'];
				}else{
					
					$new[] =$v;

				}
		
				
			}
			
			$new=array_unique($new);
			
			$new=implode(",",$new);
			
			 $data1['group_id_new']=$new;	
				
				
			 $data['name']=$param['name'];
			 $data['thumb']=$param['thumb'];
			 $data['content']=$param['content'];
			 $data['company']=$param['company'];
			 $data['address']=$param['address'];
			 $data['attendancefee']=$param['attendancefee'];
			
		/*	 if(!empty($param['group_id'])){
				 $data['group_id']=implode(',',$param['group_id']);
			 }else{
				 $data['group_id']='';
				 }*/
			$data['administrators']=$param['administrators'];	 
				 
			$data['group_id']= $param['group_id'];
			 
			// $data['group_id'] = json_decode($request->post('group_id'),true);
			 $data['baoming_time1']=strtotime($param['baoming_time1']);
			 $data['baoming_time2']=strtotime($param['baoming_time2']);
			 $data['baodao_time']=strtotime($param['baodao_time']);
			 $data['start_time']=strtotime($param['start_time']);
			 $data['end_time']=strtotime($param['end_time']);
			
			 $data['add_time']=time();
			 
			 
			 
			 M('article')->insert($data1);

			 $userId = M('article')->getLastInsID();
 
			 $raw=M('meeting')->data($data)->data('meeting_id',$userId)->insert();
			
			 
			 
			
			 $res=array('code'=>0,'msg'=>'添加成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'添加失败'); 
            $this->ajaxReturn($res);
			 
		  }
		  
		}
	    
		$admin_list = M('admin')->field('admin_id,user_name')->select();
		$this->assign('admin_list',$admin_list);
		$group_list = M('group')->where('is_delete', 0)->select();
		$this->assign('group_list',$group_list);
		
		
		$group_list_res = M('group')->where('is_delete', 0)->where('catid',0)->select();
		
	
		
		
		foreach($group_list_res as $k=>$v){
			
			$group_list_res2=M('group')->where('catid',$v['group_id'])->where('is_delete', 0)->select();
			
			$group_list_res[$k]['data']=$group_list_res2;
			
		}
		
		$this->assign('group_list_res',$group_list_res);
		
		$administrators_list = M('admin')->where('role_id',3)->select();
		$this->assign('administrators_list',$administrators_list);
		
        return $this->fetch();
	}
	
	
	
	
		public function status(){
		$meeting_id = I('get.id',0);
		$status = I('get.status',0);
		
		$row=M('meeting')->data(array('meeting_id'=>$meeting_id,'status'=>$status))->update();
		if($row){
            $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['code'=>0,'msg'=>'更新失败！']);
		}
	}
	
		public function onlygroup(){
		$meeting_id = I('get.id',0);
		$onlygroup = I('get.onlygroup',0);
		
		$row=M('meeting')->data(array('meeting_id'=>$meeting_id,'onlygroup'=>$onlygroup))->update();
		if($row){
            $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['code'=>0,'msg'=>'更新失败！']);
		}
	}
	
		public function turnon(){
		$meeting_id = I('get.id',0);
		$turnon = I('get.turnon',0);
		
		$row=M('meeting')->data(array('meeting_id'=>$meeting_id,'turnon'=>$turnon))->update();
		if($row){
            $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['code'=>0,'msg'=>'更新失败！']);
		}
	}
	
	public function relevant(){
		$id = I('get.id',0);
		$this->assign('id',$id);
		$info = M('meeting')->where('meeting_id',$id)->field('name')->find();
		$this->assign('catname',$info['name']);
		return $this->fetch();
	}
	
	public function relevant_json(){
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  $sort_by=I('post.sort_by','meeting_id');
	  $sort_order=I('post.sort_order','desc');
	  $admin_id=session('admin_id');
	  $catid=I('get.catid','');
	  $where = new Where;
	  $where['is_delete']=array('eq',0);
	  if($key_word){
		 $where['name']=array('like','%'.$key_word.'%');  
	  }
	  if($catid){
		$where['catid']=array('eq',$catid);    
	  }
	 
	  $count = M('meeting')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('meeting')->where($where)->limit($page->firstRow,$page->listRows)->order($sort_by.' '.$sort_order)->select(); 
	  foreach($logs as $k=>$v){
		 $logs[$k]['add_time']=date('Y-m-d H:i:s',$v['add_time']);
		 
	  }
	 
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
	}
	
	public function relevant_edit(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['name']=$param['name'];
			 $data['litpic']=$param['litpic'];
			 $data['content']=$param['content'];
			 $data['meeting_id']=$param['meeting_id'];
			 M('meeting')->update($data);
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
			 
		  }
		  
		}
	    $id = I('get.id/d',0);
	    $info = M('meeting')->where('meeting_id',$id)->find();
		
		$this->assign('info',$info);
        return $this->fetch();
	}
	
	public function relevant_add(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['name']=$param['name'];
			 $data['litpic']=$param['litpic'];
			 $data['content']=$param['content'];
			 $data['catid']=$param['catid'];
			 $data['add_time']=time();
			 M('meeting')->data($data)->insert();
			 $res=array('code'=>0,'msg'=>'添加成功'); 
             $this->ajaxReturn($res); 
			
			}else{
				$res=array('code'=>1,'msg'=>'添加失败'); 
				$this->ajaxReturn($res);
				 
			}
		}
		$catid = I('get.catid',0);
		$this->assign('catid',$catid);
        return $this->fetch();
	}
	
	public function relevant_del(){
		$id = I('post.id',0);
		$row=M('meeting')->update(array('meeting_id'=>$id,'is_delete'=>1));
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	public function category()
    { 
	 $catid = I('get.catid');
	 $this->assign('catid',$catid); 
	 $info = M('meeting')->where('meeting_id',$catid)->field('name')->find();
	 $this->assign('catname',$info['name']);
     return $this->fetch();
    }
	
	public function category_json()
    { 
	  $catid = I('get.catid');
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  $admin_id=session('admin_id');
	 
	  $where = new Where;
	
	  if($key_word){
		 $where['name']=array('like','%'.$key_word.'%');  
	  }
	 
	  $count = M('category')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('category')->where($where)->limit($page->firstRow,$page->listRows)->order('id ASC')->select(); 
	  
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
    }
	
	public function page_edit(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 
			// $data['name']=$param['name'];
			 $data['content']=$param['content'];
			 
			 $data['id']=$param['id'];
			 
			 
			 M('single_content')->data($data)->update();
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
			 
		  }
		  
		}
	    $id = I('get.id/d',0);
		$catid = I('get.catid/d',0);
		$info = M("single_content")->alias('s')->join('category c ','s.typeid= c.id')->where('s.typeid',$id)->where('s.catid',$catid)->field('s.*,c.name')->find();
		
		$this->assign('info',$info);
        return $this->fetch();
	}
	
	public function vote(){
		$id = I('get.catid',0);
		$this->assign('id',$id);
		$info = M('room')->where('id',$id)->field('name')->find();
		$this->assign('catname',$info['name']);
		return $this->fetch();
	}
	
	public function guanzhu(){
		$id = I('get.id',0);
		$this->assign('id',$id);
		$info_name = M('meeting')->where('meeting_id',$id)->field('name')->find();
		$this->assign('catname',$info_name['name']);
		
		$info = M('user_label')->where('catid',$id)->select();
		$this->assign('info',$info);
		return $this->fetch();
	}
	public function guanzhu_json(){
	  $catid=I('get.catid','');
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  $sort_by=I('post.sort_by','id');
	  $sort_order=I('post.sort_order','desc');
	  $where = new Where;
	  $where['catid']=array('eq',$catid);
	  if($key_word){
		 $where['name']=array('like','%'.$key_word.'%');  
	  }
	 
	  $count = M('user_label')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('user_label')->where($where)->limit($page->firstRow,$page->listRows)->order($sort_by.' '.$sort_order)->select(); 
	  foreach($logs as $k=>$v){
		 $logs[$k]['addtime']=date('Y-m-d H:i:s',$v['addtime']);
		 
	  }
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
	}
	
	public function daochu(){
		$catid=I('get.catid','');
		$where = new Where;
	    $where['catid']=array('eq',$catid);
		$list = M("user_label")->where($where)->select();
		
		foreach($list as $k=>$v){
			$list[$k]['addtime']= date("Y-m-d H:i",$v['addtime']);
		}
		//2.加载PHPExcle类库
		//vendor('PHPExcel.PHPExcel');
		//3.实例化PHPExcel类
		$objPHPExcel = new \PHPExcel();
		//4.激活当前的sheet表
		$objPHPExcel->setActiveSheetIndex(0);
		//5.设置表格头（即excel表格的第一行）
		$objPHPExcel->setActiveSheetIndex(0)
				->setCellValue('A1', 'ID')
				->setCellValue('B1', '昵称')
				->setCellValue('C1', '关注时间');
			
		//设置A列水平居中
		//$objPHPExcel->setActiveSheetIndex(0)->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		//设置单元格宽度
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('A')->setWidth(10);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('B')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('C')->setWidth(20);

		//6.循环刚取出来的数组，将数据逐一添加到excel表格。
		for($i=0;$i<count($list);$i++){
			$objPHPExcel->getActiveSheet()->setCellValue('A'.($i+3),$list[$i]['id']);
			$objPHPExcel->getActiveSheet()->setCellValue('B'.($i+3),$list[$i]['name']);
			$objPHPExcel->getActiveSheet()->setCellValue('C'.($i+3),$list[$i]['addtime']);
		}
		//7.设置保存的Excel表格名称
		
		$filename = '关注列表'.date('ymdHis',time()).'.xls';
		
		//8.设置当前激活的sheet表格名称；
		$objPHPExcel->getActiveSheet()->setTitle('关注列表');
		//9.设置浏览器窗口下载表格
		header("Content-Type: application/force-download");  
		header("Content-Type: application/octet-stream");  
		header("Content-Type: application/download");  
		header('Content-Disposition:inline;filename="'.$filename.'"');  
		//生成excel文件
		$objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
		//下载文件在浏览器窗口
		$objWriter->save('php://output');
		exit;
    
	}
	
	
	public function vote_json(){
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  $sort_by=I('post.sort_by','id');
	  $sort_order=I('post.sort_order','desc');
	  $admin_id=session('admin_id');
	  $catid=I('get.catid','');
	  $where = new Where;
	  $where['is_delete']=array('eq',0);
	  if($key_word){
		 $where['name']=array('like','%'.$key_word.'%');  
	  }
	  if($catid){
		$where['catid']=array('eq',$catid);    
	  }
	 
	  $count = M('vote')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('vote')->where($where)->limit($page->firstRow,$page->listRows)->order($sort_by.' '.$sort_order)->select(); 
	  foreach($logs as $k=>$v){
		 $logs[$k]['update_time']=date('Y-m-d H:i:s',$v['update_time']);
		 
	  }
	 
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
	}
	
	public function vote_edit(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['name']=$param['name'];
			 $data['thumb']=$param['thumb'];
			
			 $data['update_time']=time();
			 $data['id']=$param['id'];
			 M('vote')->data($data)->update();
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
			 
		  }
		  
		}
	    $id = I('get.id/d',0);
	    $info = M('vote')->where('id',$id)->find();
		
		$this->assign('info',$info);
        return $this->fetch();
	}
	
	public function vote_add(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['name']=$param['name'];
			 $data['thumb']=$param['thumb'];
			 
			 $data['catid']=$param['catid'];
			 $data['add_time']=time();
			 $data['update_time']=time();
			 M('vote')->data($data)->insert();
			 $res=array('code'=>0,'msg'=>'添加成功'); 
             $this->ajaxReturn($res); 
			
			}else{
				$res=array('code'=>1,'msg'=>'添加失败'); 
				$this->ajaxReturn($res);
				 
			}
		}
		$catid = I('get.catid',0);
		$this->assign('catid',$catid);
        return $this->fetch();
	}
	
	public function vote_dels(){
		$id = I('post.id',0);
		$ids=implode(",", $id);
		$row=M('vote')->where('id','in',$ids)->update(array('is_delete'=>1));
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	public function vote_del(){
		$id = I('post.id',0);
		$row=M('vote')->update(array('id'=>$id,'is_delete'=>1));
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	public function vote_listorder(){
		$info = I('get.',0);
		
		$row=M('vote')->data($info)->update();
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['list'=>$info]);
		}
	}
	
	public function tousu(){
		$id = I('get.id',0);
		$this->assign('id',$id);
		$info2 = M('meeting')->where('meeting_id',$id)->field('name')->find();
		$this->assign('catname',$info2['name']);
		$info = M('user_level')->where('orderid',$id)->select();
				/*print_r($info);
		exit();*/

		$this->assign('info',$info);
		return $this->fetch();
	}
	public function tousu_json(){
	  $catid=I('get.catid','');
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  $sort_by=I('post.sort_by','id');
	  $sort_order=I('post.sort_order','desc');
	  $where = new Where;
	  if($key_word){
		 $where['name']=array('like','%'.$key_word.'%');  
	  }
	 
	  $count = M('user_level')->where($where)->where('orderid',$catid)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('user_level')->where($where)->where('orderid',$catid)->limit($page->firstRow,$page->listRows)->order($sort_by.' '.$sort_order)->select(); 
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
	}
	
	
	
	public function assistance(){
		$id = I('get.id',0);
		$this->assign('id',$id);
		$info = M('meeting')->where('meeting_id',$id)->field('name')->find();
		$this->assign('catname',$info['name']);
		return $this->fetch();
	}
	
	public function assistance_json(){
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  $sort_by=I('post.sort_by','id');
	  $sort_order=I('post.sort_order','desc');
	  $admin_id=session('admin_id');
	  $catid=I('get.catid','');
	  $where = new Where;
	  $where['is_delete']=array('eq',0);
	  if($key_word){
		 $where['name']=array('like','%'.$key_word.'%');  
	  }
	  if($catid){
		$where['catid']=array('eq',$catid);    
	  }
	 
	  $count = M('assistance')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('assistance')->where($where)->limit($page->firstRow,$page->listRows)->order($sort_by.' '.$sort_order)->select(); 
	  foreach($logs as $k=>$v){
		 $logs[$k]['add_time']=date('Y-m-d H:i:s',$v['add_time']);
		 
	  }
	 
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
	}
	
	public function assistance_edit(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['name']=$param['name'];
			 $data['thumb']=$param['thumb'];
			 $data['number']=$param['number'];
			 $data['helper']=$param['helper'];
			 $data['id']=$param['id'];
			 M('assistance')->data($data)->update();
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
			 
		  }
		  
		}
	    $id = I('get.id/d',0);
	    $info = M('assistance')->where('id',$id)->find();
		
		$this->assign('info',$info);
        return $this->fetch();
	}
	
	public function assistance_add(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['name']=$param['name'];
			 $data['thumb']=$param['thumb'];
			 $data['number']=$param['number'];
			 $data['helper']=$param['helper'];
			 $data['catid']=$param['catid'];
			 $data['add_time']=time();
			 M('assistance')->data($data)->insert();
			 $res=array('code'=>0,'msg'=>'添加成功'); 
             $this->ajaxReturn($res); 
			
			}else{
				$res=array('code'=>1,'msg'=>'添加失败'); 
				$this->ajaxReturn($res);
				 
			}
		}
		$catid = I('get.catid',0);
		$this->assign('catid',$catid);
        return $this->fetch();
	}
	
	public function assistance_del(){
		$id = I('post.id',0);
		$ids=implode(",", $id);
		$row=M('assistance')->where('id','in',$ids)->update(array('is_delete'=>1));
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	public function assistance_listorder(){
		$info = I('get.',0);
		
		$row=M('assistance')->data($info)->update();
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['list'=>$info]);
		}
	}
	
	
	
		
	public function meeting_annex(){
		$id = I('get.catid',0);
		$this->assign('id',$id);
		$info = M('meeting')->where('meeting_id',$id)->field('name')->find();
		$this->assign('catname',$info['name']);
		
		$res = M('config')->where('is_del',0)->select();
		foreach($res as $k=>$val){
			$config[$val['name']] = $val['value'];
        }
		
		$osstoken = gettoken();
		$this->assign('osstoken',$osstoken);
		
		
		return $this->fetch();
	}
	
	public function meeting_annex_json(){
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  $sort_by=I('post.sort_by','id');
	  $sort_order=I('post.sort_order','desc');
	  $admin_id=session('admin_id');
	  $catid=I('get.catid','');
	  $where = new Where;
	  $where['is_delete']=array('eq',0);
	  if($key_word){
		 $where['name']=array('like','%'.$key_word.'%');  
	  }
	  if($catid){
		$where['catid']=array('eq',$catid);    
	  }
	 
	  $count = M('meeting_annex')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('meeting_annex')->where($where)->limit($page->firstRow,$page->listRows)->order($sort_by.' '.$sort_order)->select(); 
	  foreach($logs as $k=>$v){
		 $logs[$k]['add_time']=date('Y-m-d H:i:s',$v['add_time']);
		 
	  }
	 
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
	}
	
	public function meeting_annex_edit(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['name']=$param['name'];
			 $data['annex']=$param['response'];
			
			 $data['id']=$param['id'];
			 M('meeting_annex')->data($data)->update();
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
			 
		  }
		  
		}
	    $id = I('get.id/d',0);
	    $info = M('meeting_annex')->where('id',$id)->find();
		
		$this->assign('info',$info);
		
		$osstoken = gettoken();
		$this->assign('osstoken',$osstoken);
		
		
		$annex= getossname($info['annex']);
		$this->assign('annex',$annex);
		
        return $this->fetch();
	}
	
	public function meeting_annex_add(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['name']=$param['name'];
			 $data['annex']=$param['response'];
			
			 $data['catid']=$param['catid'];
			 $data['add_time']=time();
			
			 M('meeting_annex')->data($data)->insert();
			 $res=array('code'=>0,'msg'=>'添加成功'); 
             $this->ajaxReturn($res); 
			
			}else{
				$res=array('code'=>1,'msg'=>'添加失败'); 
				$this->ajaxReturn($res);
				 
			}
		}
		$catid = I('get.catid',0);
		$this->assign('catid',$catid);
		
		$osstoken = gettoken();
		$this->assign('osstoken',$osstoken);
        return $this->fetch();
	}
	
	public function meeting_annex_dels(){
		$id = I('post.id',0);
		$ids=implode(",", $id);
		$row=M('meeting_annex')->where('id','in',$ids)->update(array('is_delete'=>1));
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	
	public function meeting_annex_del(){
		$id = I('post.id',0);
		$row=M('meeting_annex')->update(array('id'=>$id,'is_delete'=>1));
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	
	public function meeting_annex_listorder(){
		$info = I('get.',0);
		
		$row=M('meeting_annex')->data($info)->update();
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['list'=>$info]);
		}
	}
	

	public function room(){
		$room_id = I('get.catid',0);
		$this->assign('room_id',$room_id);
		$info = M('hotel')->where('hotel_id',$room_id)->field('name')->find();
		$this->assign('catname',$info['name']);
		return $this->fetch();
	}
	
	
	public function room_json(){
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  $sort_by=I('post.sort_by','room_id');
	  $sort_order=I('post.sort_order','desc');
	  $admin_id=session('admin_id');
	  $catid=I('get.catid','');
	  $where = new Where;
	  $where['is_delete']=array('eq',0);
	  if($key_word){
		 $where['name']=array('like','%'.$key_word.'%');  
	  }
	  if($catid){
		$where['catid']=array('eq',$catid);    
	  }
	 
	  $count = M('room')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('room')->where($where)->limit($page->firstRow,$page->listRows)->order($sort_by.' '.$sort_order)->select(); 
	  foreach($logs as $k=>$v){
		 $logs[$k]['add_time']=date('Y-m-d H:i:s',$v['add_time']);
		 
	  }
	 
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
	}
	
	public function room_edit(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['name']=$param['name'];
			
			 $data['room_id']=$param['room_id'];
			 M('room')->data($data)->update();
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
			 
		  }
		  
		}
	    $room_id = I('get.room_id/d',0);
	    $info = M('room')->where('room_id',$room_id)->find();
		
		$this->assign('info',$info);
		
		$catid = I('get.catid',0);
		$this->assign('catid',$catid);
        return $this->fetch();
	}
	
	public function room_add(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['name']=$param['name'];
			
			
			 $data['catid']=$param['catid'];
			 $data['add_time']=time();
			
			 M('room')->data($data)->insert();
			 $res=array('code'=>0,'msg'=>'添加成功'); 
             $this->ajaxReturn($res); 
			
			}else{
				$res=array('code'=>1,'msg'=>'添加失败'); 
				$this->ajaxReturn($res);
				 
			}
		}
		$catid = I('get.catid',0);
		$this->assign('catid',$catid);
        return $this->fetch();
	}
	
	
	public function room_dels(){
		$ids = I('post.ids');
		//$ids=implode(",", $id);
		$row=M('room')->where('room_id','in',$ids)->update(array('is_delete'=>1));
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	
	public function room_del(){
		$id = I('post.id',0);
		$row=M('room')->update(array('room_id'=>$id,'is_delete'=>1));
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	
	public function room_listorder(){
		$info = I('get.',0);
		
		$row=M('room')->data($info)->update();
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['list'=>$info]);
		}
	}
    
	
	
	public function hotel(){
		$hotel_id = I('get.hotel_id',0);
		$this->assign('hotel_id',$hotel_id);
		$info = M('meeting')->where('meeting_id',$hotel_id)->field('name')->find();
		$this->assign('catname',$info['name']);
		return $this->fetch();
	}
	
	public function hotel_json(){
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  $sort_by=I('post.sort_by','hotel_id');
	  $sort_order=I('post.sort_order','desc');
	  $admin_id=session('admin_id');
	  $catid=I('get.catid','');
	  $where = new Where;
	  $where['is_delete']=array('eq',0);
	  if($key_word){
		 $where['name']=array('like','%'.$key_word.'%');  
	  }
	  if($catid){
		$where['catid']=array('eq',$catid);    
	  }
	 
	  $count = M('hotel')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('hotel')->where($where)->limit($page->firstRow,$page->listRows)->order($sort_by.' '.$sort_order)->select(); 
	  foreach($logs as $k=>$v){
		 $logs[$k]['add_time']=date('Y-m-d H:i:s',$v['add_time']);
		 
	  }
	 
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
	}
	
	public function hotel_edit(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['name']=$param['name'];
			 $data['address']=$param['address'];
			 $data['content']=$param['content'];
			
			 $data['hotel_id']=$param['hotel_id'];
			 M('hotel')->data($data)->update();
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
			 
		  }
		  
		}
	    $hotel_id = I('get.hotel_id/d',0);
	    $info = M('hotel')->where('hotel_id',$hotel_id)->find();
		
		$this->assign('info',$info);
		
		$catid = I('get.catid',0);
		$this->assign('catid',$catid);
        return $this->fetch();
	}
	
	public function hotel_add(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['name']=$param['name'];
			 $data['address']=$param['address'];
			 $data['content']=$param['content'];
			
			 $data['catid']=$param['catid'];
			 $data['add_time']=time();
			
			 M('hotel')->data($data)->insert();
			 $res=array('code'=>0,'msg'=>'添加成功'); 
             $this->ajaxReturn($res); 
			
			}else{
				$res=array('code'=>1,'msg'=>'添加失败'); 
				$this->ajaxReturn($res);
				 
			}
		}
		$catid = I('get.catid',0);
		$this->assign('catid',$catid);
        return $this->fetch();
	}
	
	
	public function hotel_dels(){
		$ids = I('post.ids');
		//$ids=implode(",", $id);
		$row=M('hotel')->where('hotel_id','in',$ids)->update(array('is_delete'=>1));
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	
	public function hotel_del(){
		$id = I('post.id',0);
		$row=M('hotel')->update(array('hotel_id'=>$id,'is_delete'=>1));
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	
	public function hotel_listorder(){
		$info = I('get.',0);
		
		$row=M('hotel')->data($info)->update();
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['list'=>$info]);
		}
	}
	
	
	
	
	
	public function registered(){
		//$registered_id = I('get.registered_id',0);
//		$this->assign('registered_id',$registered_id);
		$catid = I('get.catid',0);
		$this->assign('catid',$catid);
		$info = M('meeting')->where('meeting_id',$catid)->field('name')->find();
		$this->assign('catname',$info['name']);
		return $this->fetch();
	}
	
	public function registered_json(){
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  $sort_by=I('post.sort_by','registered_id');
	  $sort_order=I('post.sort_order','desc');
	  $admin_id=session('admin_id');
	  $catid=I('get.catid','');
	  $where = new Where;
	  $where['is_delete']=array('eq',0);
	  if($key_word){
		 $where['name']=array('like','%'.$key_word.'%');  
	  }
	  if($catid){
		$where['catid']=array('eq',$catid);    
	  }
	 
	  $count = M('registered')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('registered')->where($where)->limit($page->firstRow,$page->listRows)->order($sort_by.' '.$sort_order)->select(); 
	  foreach($logs as $k=>$v){
		 $logs[$k]['add_time']=date('Y-m-d H:i:s',$v['add_time']);
		 
	  }
	 
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
	}
	
	public function registered_edit(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['user_id']=$param['user_id'];
			 $data['mobile']=$param['mobile'];
			 $data['email']=$param['email'];
			 $data['company']=$param['company'];
			 $data['name']=$param['name'];
			 $data['sex']=$param['sex'];
			 $data['title']=$param['title'];
			 $data['department']=$param['department'];
			 $data['weixin']=$param['weixin'];
			 $data['payment']=$param['payment'];
			 $data['companyname']=$param['companyname'];
			 $data['duty']=$param['duty'];
			 $data['companyadd']=$param['companyadd'];
			 $data['tel']=$param['tel'];
			 $data['deposit']=$param['deposit'];
			 $data['account']=$param['account'];
			 $data['project']=$param['project'];
			 $data['addressname']=$param['addressname'];
			 $data['addresstel']=$param['addresstel'];
			 $data['addressadd']=$param['addressadd'];
			 $data['hotel_id']=$param['hotel_id'];
			 $data['room_id']=$param['room_id'];
			 $data['in_time']=$param['in_time'];
			 $data['out_time']=$param['out_time'];
			 $data['spare']=$param['spare'];
			 $data['add_time']=$param['add_time'];
			 
			 $data['registered_id']=$param['registered_id'];
			 M('registered')->data($data)->update();
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
		  }
		}
		
		
	    $id = I('get.id/d',0);
	    $info = M('registered')->where('registered_id',$id)->find();
		$room_name = M('room')->where('room_id',$info['room_id'])->find();
		$info['room_id'] = $room_name['name'];
		$info['add_time'] = date('Y-m-d H:i:s',$info['add_time']);
		
		$this->assign('info',$info);
		
		$catid = I('get.id',0);
		$this->assign('catid',$catid);
		
		
		
		$hotel_list = M('hotel')->where('is_delete',0)->where('catid',$info['catid'])->select();
		$info2 = M('hotel')->where('is_delete',0)->find();
		$this->assign('hotel_list',$hotel_list);
		
		$room_list = M('room')->where('is_delete',0)->where('catid',$info['hotel_id'])->select();
		$info3 = M('room')->where('is_delete',0)->find();
		$this->assign('room_list',$room_list);
		
		
		$paper = M('paper')->where('user_id',$info['user_id'])->where('meeting_id',$info['catid'])->select();
		$this->assign('paper',$paper);
		
		
		
		
		
        return $this->fetch();
	}
	
	
	
	
	public function registered_see(){
			    $id = I('get.id/d',0);
	    $info = M('registered')->where('registered_id',$id)->find();
		$room_name = M('room')->where('room_id',$info['room_id'])->find();
		$info['room_id'] = $room_name['name'];
		$info['add_time'] = date('Y-m-d H:i:s',$info['add_time']);
		
		$info['room_id'] = getroomname($info['room_id']);
		$info['hotel_id'] = gethotelname($info['hotel_id']);
		
		$info['in_time'] = date('Y-m-d',$info['in_time']);
		
		$info['out_time'] = date('Y-m-d',$info['out_time']);
		
		
		
		$this->assign('info',$info);
		
		$catid = I('get.id',0);
		$this->assign('catid',$catid);
		
		
		
		$hotel_list = M('hotel')->where('is_delete',0)->where('catid',$info['catid'])->select();
		$info2 = M('hotel')->where('is_delete',0)->find();
		$this->assign('hotel_list',$hotel_list);
		
		$room_list = M('room')->where('is_delete',0)->where('catid',$info['hotel_id'])->select();
		$info3 = M('room')->where('is_delete',0)->find();
		$this->assign('room_list',$room_list);
		
		
		$paper = M('paper')->where('user_id',$info['user_id'])->where('meeting_id',$info['catid'])->select();
		$this->assign('paper',$paper);
		return $this->fetch();
	}
	
	
	
	
	
	public function paper_see(){
		$catid = I('get.catid',0);
		$this->assign('catid',$catid);
		
		
		return $this->fetch();
		
			
		}
	
	
	
	public function paper_see_json(){
		
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  $sort_by=I('post.sort_by','paper_id');
	  $sort_order=I('post.sort_order','desc');
	  $admin_id=session('admin_id');
	  $catid = I('get.catid');
	
	  $where = new Where;
	  $where['is_delete']=array('eq',0);
	  
	
		$where['meeting_id']=array('eq',$catid);    
	
	     
		 if($key_word){
				 $where['name|user_id']=array('like','%'.$key_word.'%');  
			  }
	 
	  $count = M('paper')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('paper')->where($where)->limit($page->firstRow,$page->listRows)->select(); 
	  foreach($logs as $k=>$v){
		 $logs[$k]['add_time']=date('Y-m-d H:i:s',$v['add_time']);
		 
		 $logs[$k]['user_id']= getlunwenname($v['user_id']);
		 
	  }
	 
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
	
	  
//		$count = M('paper')->where('meeting_id',$catid)->count();
//		
//		$paper_list = M('paper')->where('meeting_id',$catid)->select();
//		$this->assign('paper_list',$paper_list);
//		$this->assign('count',$count);
//		




//	    $info = M('registered')->where('registered_id',$id)->find();
//		$room_name = M('room')->where('room_id',$info['room_id'])->find();
//		$info['room_id'] = $room_name['name'];
//		
//		$this->assign('info',$info);
//		
//		$catid = I('get.id',0);
//		$this->assign('catid',$catid);
//		
//		
//		
//		$hotel_list = M('hotel')->where('is_delete',0)->where('catid',$info['catid'])->select();
//		$info2 = M('hotel')->where('is_delete',0)->find();
//		$this->assign('hotel_list',$hotel_list);
//		
//		$room_list = M('room')->where('is_delete',0)->where('catid',$info['hotel_id'])->select();
//		$info3 = M('room')->where('is_delete',0)->find();
//		$this->assign('room_list',$room_list);
//		
//		
//		$paper_list = M('paper')->where('meeting_id',$info['catid'])->select();
//		$this->assign('paper_list',$paper_list);
		
		//print_r($info['user_id']);
		//exit();
	
	}
	
	
	
	
	
	
	

	public function getRegion()
    {  
     $pid = I('get.pid',1);
  
     $room=M('room')->where('catid',$pid)->order('room_id asc')->where('is_delete',0)->select();
  
        return $room;
    }

	
	public function registered_listorder(){
		$info = I('get.',0);
		
		$row=M('hotel')->data($info)->update();
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['list'=>$info]);
		}
	}
	
	
	public function status2(){
		$registered_id = I('get.id',0);
		$status = I('get.status',0);
		
		$row=M('registered')->data(array('registered_id'=>$registered_id,'status'=>$status))->update();
		if($row){
            $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['code'=>0,'msg'=>'更新失败！']);
		}
	}
	public function stay(){
		$registered_id = I('get.id',0);
		$stay = I('get.stay',0);
		
		$row=M('registered')->data(array('registered_id'=>$registered_id,'stay'=>$stay))->update();
		if($row){
            $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['code'=>0,'msg'=>'更新失败！']);
		}
	}
	public function invoice(){
		$registered_id = I('get.id',0);
		$invoice = I('get.invoice',0);
		
		$row=M('registered')->data(array('registered_id'=>$registered_id,'invoice'=>$invoice))->update();
		if($row){
            $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['code'=>0,'msg'=>'更新失败！']);
		}
	}
	
	
//	导出
//	public function dc_effective_ticket(){
//		$catid = I('get.catid',0);
//		$ids = I('post.ids');
//		$id_all=implode(",",$ids);
//		
//		print_r($ids);
//		exit();
//		$list = M("registered")->where('catid',$catid)->where('registered_id','in',$id_all)->where('is_delete',0)->order("registered_id desc")->select();
//		
//		foreach($list as $k=>$v){
//			
//			 
//			 $list[$k]['user_id']= $v['user_id'];
//			 $list[$k]['mobile']= $v['mobile'];
//			 $list[$k]['email']= $v['email']; 
//			 $list[$k]['add_time']= date("Y-m-d H:i",$v['add_time']);
//			 $list[$k]['company']= $v['company'];
//			 $list[$k]['name']= $v['name'];
//			 $list[$k]['sex']= $v['sex'];
//			 $list[$k]['title']= $v['title'];
//			 $list[$k]['department']= $v['department'];
//			 $list[$k]['weixin']= $v['weixin'];
//			 $list[$k]['payment']= $v['payment'];
//			 $list[$k]['companyname']= $v['companyname'];
//			 $list[$k]['duty']= $v['duty'];
//			 $list[$k]['companyadd']= $v['companyadd'];
//			 $list[$k]['tel']= $v['tel'];
//			 $list[$k]['deposit']= $v['deposit'];
//			 $list[$k]['account']= $v['account'];
//			 $list[$k]['project']= $v['project'];
//			 $list[$k]['addressname']= $v['addressname'];
//			 $list[$k]['addresstel']= $v['addresstel'];
//			 $list[$k]['addressadd']= $v['addressadd'];
//			 $list[$k]['hotel_id']= $v['hotel_id'];
//			 $list[$k]['room_id']= $v['room_id'];
//			 $list[$k]['in_time']= $v['in_time'];
//			 $list[$k]['out_time']= $v['out_time'];
//			 $list[$k]['spare']= $v['spare'];
//			 $list[$k]['status']= $v['status'];
//			 $list[$k]['invoice']= $v['invoice'];
//			 $list[$k]['stay']= $v['stay'];
//			 $list[$k]['paper']= $v['paper'];
//			 
//			
//			 
//			 
//		}
//		
//		//2.加载PHPExcle类库
//		//vendor('PHPExcel.PHPExcel');
//		//3.实例化PHPExcel类
//		$objPHPExcel = new \PHPExcel();
//		//4.激活当前的sheet表
//		$objPHPExcel->setActiveSheetIndex(0);
//		//5.设置表格头（即excel表格的第一行）
//		$objPHPExcel->setActiveSheetIndex(0)
//				->setCellValue('A1', '用户ID')
//				->setCellValue('B1', '用户关联的手机号')
//				->setCellValue('C1', '用户关联的邮箱')
//				->setCellValue('D1', '提交报名时间')
//				->setCellValue('E1', '单位')
//				->setCellValue('F1', '姓名')
//				->setCellValue('G1', '性别')
//				->setCellValue('H1', '职称')
//				->setCellValue('I1', '部门及职务')
//				->setCellValue('J1', '邮箱')
//				->setCellValue('K1', '手机')
//				->setCellValue('L1', '微信号')
//				->setCellValue('M1', '参会费缴纳')
//				->setCellValue('N1', '公司名称')
//				->setCellValue('O1', '税号')
//				->setCellValue('P1', '单位地址')
//				->setCellValue('Q1', '电话号码')
//				->setCellValue('R1', '开户银行')
//				->setCellValue('S1', '银行账户')
//				->setCellValue('T1', '发票项目')
//				->setCellValue('U1', '收件人姓名')
//				->setCellValue('V1', '收件人电话')
//				->setCellValue('W1', '收件地址')
//				->setCellValue('X1', '酒店')
//				->setCellValue('Y1', '房间规格')
//				->setCellValue('Z1', '入住时间')
//				->setCellValue('AA1', '离店时间')
//				->setCellValue('AB1', '是否同意拼房')
//				->setCellValue('AC1', '报名状态')
//				->setCellValue('AD1', '是否住宿')
//				->setCellValue('AE1', '发票状态')
//				->setCellValue('AF1', '提交论文数量');
//			
//		//设置A列水平居中
//		//$objPHPExcel->setActiveSheetIndex(0)->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
//		//设置单元格宽度
//		$objPHPExcel->getActiveSheet()->getStyle('B')->getNumberFormat()->setFormatCode(\PHPExcel_Style_NumberFormat::FORMAT_TEXT);
//		
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('A')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('B')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('C')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('D')->setWidth(20); 
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('E')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('F')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('G')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('H')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('I')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('J')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('K')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('L')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('M')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('N')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('O')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('P')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('Q')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('R')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('S')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('T')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('U')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('V')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('W')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('X')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('Y')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('Z')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('AA')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('AB')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('AC')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('AD')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('AE')->setWidth(20);
//		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('AF')->setWidth(20);
//		
//		
//
//		//6.循环刚取出来的数组，将数据逐一添加到excel表格。
//		for($i=0;$i<count($list);$i++){
//			$objPHPExcel->getActiveSheet()->setCellValue('A'.($i+3),$list[$i]['user_id']);
//			$objPHPExcel->getActiveSheet()->setCellValue('B'.($i+3),$list[$i]['mobile']);
//			$objPHPExcel->getActiveSheet()->setCellValue('C'.($i+3),$list[$i]['email']);
//			$objPHPExcel->getActiveSheet()->setCellValue('D'.($i+3),$list[$i]['add_time']);
//			$objPHPExcel->getActiveSheet()->setCellValue('E'.($i+3),$list[$i]['company']);
//			$objPHPExcel->getActiveSheet()->setCellValue('F'.($i+3),$list[$i]['name']);
//			$objPHPExcel->getActiveSheet()->setCellValue('G'.($i+3),$list[$i]['sex']);
//			$objPHPExcel->getActiveSheet()->setCellValue('H'.($i+3),$list[$i]['title']);
//			$objPHPExcel->getActiveSheet()->setCellValue('I'.($i+3),$list[$i]['department']);
//			$objPHPExcel->getActiveSheet()->setCellValue('J'.($i+3),$list[$i]['mobile']);
//			$objPHPExcel->getActiveSheet()->setCellValue('K'.($i+3),$list[$i]['email']);
//			$objPHPExcel->getActiveSheet()->setCellValue('L'.($i+3),$list[$i]['weixin']);
//			$objPHPExcel->getActiveSheet()->setCellValue('M'.($i+3),$list[$i]['payment']);
//			$objPHPExcel->getActiveSheet()->setCellValue('N'.($i+3),$list[$i]['companyname']);
//			$objPHPExcel->getActiveSheet()->setCellValue('O'.($i+3),$list[$i]['duty']);
//			$objPHPExcel->getActiveSheet()->setCellValue('P'.($i+3),$list[$i]['companyadd']);
//			$objPHPExcel->getActiveSheet()->setCellValue('Q'.($i+3),$list[$i]['tel']);
//			$objPHPExcel->getActiveSheet()->setCellValue('R'.($i+3),$list[$i]['deposit']);
//			$objPHPExcel->getActiveSheet()->setCellValue('S'.($i+3),$list[$i]['account']);
//			$objPHPExcel->getActiveSheet()->setCellValue('T'.($i+3),$list[$i]['project']);
//			$objPHPExcel->getActiveSheet()->setCellValue('U'.($i+3),$list[$i]['addressname']);
//			$objPHPExcel->getActiveSheet()->setCellValue('V'.($i+3),$list[$i]['addresstel']);
//			$objPHPExcel->getActiveSheet()->setCellValue('W'.($i+3),$list[$i]['addressadd']);
//			$objPHPExcel->getActiveSheet()->setCellValue('X'.($i+3),$list[$i]['hotel_id']);
//			$objPHPExcel->getActiveSheet()->setCellValue('Y'.($i+3),$list[$i]['room_id']);
//			$objPHPExcel->getActiveSheet()->setCellValue('Z'.($i+3),$list[$i]['in_time']);
//			$objPHPExcel->getActiveSheet()->setCellValue('AA'.($i+3),$list[$i]['out_time']);
//			$objPHPExcel->getActiveSheet()->setCellValue('AB'.($i+3),$list[$i]['spare']);
//			$objPHPExcel->getActiveSheet()->setCellValue('AC'.($i+3),$list[$i]['status']);
//			$objPHPExcel->getActiveSheet()->setCellValue('AD'.($i+3),$list[$i]['invoice']);
//			$objPHPExcel->getActiveSheet()->setCellValue('AE'.($i+3),$list[$i]['stay']);
//			$objPHPExcel->getActiveSheet()->setCellValue('AF'.($i+3),$list[$i]['paper']);
//			
//			
//		}
//		
//		//$objPHPExcel->getActiveSheet()->getStyle('E')->getNumberFormat()->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_TEXT);
//		
//		//7.设置保存的Excel表格名称
//		
//		$filename = '参会人员信息列表'.date('ymdHis',time()).'.xls';
//		
//		//8.设置当前激活的sheet表格名称；
//		$objPHPExcel->getActiveSheet()->setTitle('参会人员信息列表');
//		//9.设置浏览器窗口下载表格
//		header("Content-Type: application/force-download");  
//		header("Content-Type: application/octet-stream");  
//		header("Content-Type: application/download");  
//		header('Content-Disposition:inline;filename="'.$filename.'"');  
//		//生成excel文件
//		$objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
//		//下载文件在浏览器窗口
//		$objWriter->save('php://output');
//		exit;
//		
//	}
	
	
	//一键导出
	public function dc_effective_tickets(){
		
		$catid = I('get.catid',0);
		
		$list = M("registered")->where('catid',$catid)->where('is_delete',0)->order("registered_id desc")->select();
		
		foreach($list as $k=>$v){
			
			 $list[$k]['user_id']= $v['user_id'];
			 $list[$k]['mobile000']= $v['mobile000'];
			 $list[$k]['email000']= $v['email000'];
			 $list[$k]['mobile']= $v['mobile'];
			 $list[$k]['email']= $v['email'];
			 $list[$k]['add_time']= date("Y-m-d H:i",$v['add_time']);
			 $list[$k]['company']= $v['company'];
			 $list[$k]['name']= $v['name'];
			 
			  if($v['sex']==1){
				 $list[$k]['sex'] = '男';
			 }elseif($v['sex']==2){
				 $list[$k]['sex'] = '女';
			 }else{
				 $list[$k]['sex'] = '保密';
			 }
	 
			 $list[$k]['title']= $v['title'];
			 $list[$k]['department']= $v['department'];
			 $list[$k]['weixin']= $v['weixin'];
			
			 if($v['payment']==0){
				 $list[$k]['payment'] = '转账汇款';
			 }else{
				 $list[$k]['payment'] = '现场缴费';
			 }
			 
			 $list[$k]['companyname']= $v['companyname'];
			 $list[$k]['duty']= $v['duty'];
			 $list[$k]['companyadd']= $v['companyadd'];
			 $list[$k]['tel']= $v['tel'];
			 $list[$k]['deposit']= $v['deposit'];
			 $list[$k]['account']= $v['account'];
			
			  if($v['project']==0){
				 $list[$k]['project'] = '会议费';
			 }else{
				 $list[$k]['project'] = '会务费';
			 }
			 
			 $list[$k]['addressname']= $v['addressname'];
			 $list[$k]['addresstel']= $v['addresstel'];
			 $list[$k]['addressadd']= $v['addressadd'];
			
			 $list[$k]['hotel_id']= gethotelname($v['hotel_id']);
			 $list[$k]['room_id']= getroomname($v['room_id']);

			 $list[$k]['in_time']= date("Y-m-d H:i",$v['in_time']);
			 $list[$k]['out_time']= date("Y-m-d H:i",$v['out_time']);
			 
			  if($v['spare']==0){
				 $list[$k]['spare'] = '是';
			 }else{
				 $list[$k]['spare'] = '否';
			 }
			 
			 
			   if($v['status']==0){
				 $list[$k]['status'] = '已取消';
			 }else{
				 $list[$k]['status'] = '已报名';
			 }
			 
			   if($v['invoice']==0){
				 $list[$k]['invoice'] = '未开';
			 }else{
				 $list[$k]['invoice'] = '已开';
			 }
			 
			 
			   if($v['stay']==0){
				 $list[$k]['stay'] = '否';
			 }else{
				 $list[$k]['stay'] = '是';
			 }
			 
			 $list[$k]['paper']= $v['paper'];
			
		}
		
		
		//2.加载PHPExcle类库
		//vendor('PHPExcel.PHPExcel');
		//3.实例化PHPExcel类
		$objPHPExcel = new \PHPExcel();
		//4.激活当前的sheet表
		$objPHPExcel->setActiveSheetIndex(0);
		//5.设置表格头（即excel表格的第一行）
		$objPHPExcel->setActiveSheetIndex(0)
				->setCellValue('E1', '用户信息')
				->setCellValue('M1', '报名信息')
				->setCellValue('A2', '用户ID')
				->setCellValue('B2', '用户关联的手机号')
				->setCellValue('C2', '用户关联的邮箱')
				->setCellValue('D2', '提交报名时间')
				->setCellValue('E2', '单位')
				->setCellValue('F2', '姓名')
				->setCellValue('G2', '性别')
				->setCellValue('H2', '职称')
				->setCellValue('I2', '部门及职务')
				->setCellValue('J2', '手机')
				->setCellValue('K2', '邮箱')
				->setCellValue('L2', '微信号')
				->setCellValue('M2', '参会费缴纳')
				->setCellValue('N2', '公司名称')
				->setCellValue('O2', '税号')
				->setCellValue('P2', '单位地址')
				->setCellValue('Q2', '电话号码')
				->setCellValue('R2', '开户银行')
				->setCellValue('S2', '银行账户')
				->setCellValue('T2', '发票项目')
				->setCellValue('U2', '收件人姓名')
				->setCellValue('V2', '收件人电话')
				->setCellValue('W2', '收件地址')
				->setCellValue('X2', '酒店')
				->setCellValue('Y2', '房间规格')
				->setCellValue('Z2', '入住时间')
				->setCellValue('AA2', '离店时间')
				->setCellValue('AB2', '是否同意拼房')
				->setCellValue('AC2', '报名状态')
				->setCellValue('AD2', '是否住宿')
				->setCellValue('AE2', '发票状态')
				->setCellValue('AF2', '提交论文数量');
			
		//设置A列水平居中
		//$objPHPExcel->setActiveSheetIndex(0)->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		//设置单元格宽度
		$objPHPExcel->getActiveSheet()->getStyle('B')->getNumberFormat()->setFormatCode(\PHPExcel_Style_NumberFormat::FORMAT_TEXT);
		
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('A')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('B')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('C')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('D')->setWidth(20); 
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('E')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('F')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('G')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('H')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('I')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('J')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('K')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('L')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('M')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('N')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('O')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('P')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('Q')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('R')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('S')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('T')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('U')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('V')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('W')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('X')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('Y')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('Z')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('AA')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('AB')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('AC')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('AD')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('AE')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('AF')->setWidth(20);
		
		
		
		// 合并
            $objPHPExcel->getActiveSheet()->mergeCells('E1:L1');
			$objPHPExcel->getActiveSheet()->mergeCells('M1:AF1');
		// 设置水平居中
		//	 $objPHPExcel->getActiveSheet()->getStyle('E1:L1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
         //    $objPHPExcel->getActiveSheet()->getStyle('M1:AF1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('E1:L1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('M1:AF1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		
		
		$objPHPExcel->getActiveSheet()->getRowDimension('1')->setRowHeight(30);    //第一行行高
		$objPHPExcel->getActiveSheet()->getStyle('E1:L1')->getFont()->setSize(16);         //第一行字体大小
		$objPHPExcel->getActiveSheet()->getStyle('M1:AF1')->getFont()->setSize(16); 
           
		//6.循环刚取出来的数组，将数据逐一添加到excel表格。
		for($i=0;$i<count($list);$i++){
			$objPHPExcel->getActiveSheet()->setCellValue('A'.($i+3),$list[$i]['user_id']);
			$objPHPExcel->getActiveSheet()->setCellValue('B'.($i+3),$list[$i]['mobile000']);
			$objPHPExcel->getActiveSheet()->setCellValue('C'.($i+3),$list[$i]['email000']);
			$objPHPExcel->getActiveSheet()->setCellValue('D'.($i+3),$list[$i]['add_time']);
			$objPHPExcel->getActiveSheet()->setCellValue('E'.($i+3),$list[$i]['company']);
			$objPHPExcel->getActiveSheet()->setCellValue('F'.($i+3),$list[$i]['name']);
			$objPHPExcel->getActiveSheet()->setCellValue('G'.($i+3),$list[$i]['sex']);
			$objPHPExcel->getActiveSheet()->setCellValue('H'.($i+3),$list[$i]['title']);
			$objPHPExcel->getActiveSheet()->setCellValue('I'.($i+3),$list[$i]['department']);
			$objPHPExcel->getActiveSheet()->setCellValue('J'.($i+3),$list[$i]['mobile']);
			$objPHPExcel->getActiveSheet()->setCellValue('K'.($i+3),$list[$i]['email']);
			$objPHPExcel->getActiveSheet()->setCellValue('L'.($i+3),$list[$i]['weixin']);
			$objPHPExcel->getActiveSheet()->setCellValue('M'.($i+3),$list[$i]['payment']);
			$objPHPExcel->getActiveSheet()->setCellValue('N'.($i+3),$list[$i]['companyname']);
			$objPHPExcel->getActiveSheet()->setCellValue('O'.($i+3),$list[$i]['duty']);
			$objPHPExcel->getActiveSheet()->setCellValue('P'.($i+3),$list[$i]['companyadd']);
			$objPHPExcel->getActiveSheet()->setCellValue('Q'.($i+3),$list[$i]['tel']);
			$objPHPExcel->getActiveSheet()->setCellValue('R'.($i+3),$list[$i]['deposit']);
			$objPHPExcel->getActiveSheet()->setCellValue('S'.($i+3),$list[$i]['account']);
			$objPHPExcel->getActiveSheet()->setCellValue('T'.($i+3),$list[$i]['project']);
			$objPHPExcel->getActiveSheet()->setCellValue('U'.($i+3),$list[$i]['addressname']);
			$objPHPExcel->getActiveSheet()->setCellValue('V'.($i+3),$list[$i]['addresstel']);
			$objPHPExcel->getActiveSheet()->setCellValue('W'.($i+3),$list[$i]['addressadd']);
			$objPHPExcel->getActiveSheet()->setCellValue('X'.($i+3),$list[$i]['hotel_id']);
			$objPHPExcel->getActiveSheet()->setCellValue('Y'.($i+3),$list[$i]['room_id']);
			$objPHPExcel->getActiveSheet()->setCellValue('Z'.($i+3),$list[$i]['in_time']);
			$objPHPExcel->getActiveSheet()->setCellValue('AA'.($i+3),$list[$i]['out_time']);
			$objPHPExcel->getActiveSheet()->setCellValue('AB'.($i+3),$list[$i]['spare']);
			$objPHPExcel->getActiveSheet()->setCellValue('AC'.($i+3),$list[$i]['status']);
			$objPHPExcel->getActiveSheet()->setCellValue('AD'.($i+3),$list[$i]['stay']);
			$objPHPExcel->getActiveSheet()->setCellValue('AE'.($i+3),$list[$i]['invoice']);
			$objPHPExcel->getActiveSheet()->setCellValue('AF'.($i+3),$list[$i]['paper']);
			
			
		}
		
		//$objPHPExcel->getActiveSheet()->getStyle('E')->getNumberFormat()->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_TEXT);
		
		//7.设置保存的Excel表格名称
		
		$filename = '参会人员信息列表'.date('ymdHis',time()).'.xls';
		
		//8.设置当前激活的sheet表格名称；
		$objPHPExcel->getActiveSheet()->setTitle('参会人员信息列表');
		//9.设置浏览器窗口下载表格
		header("Content-Type: application/force-download");  
		header("Content-Type: application/octet-stream");  
		header("Content-Type: application/download");  
		header('Content-Disposition:inline;filename="'.$filename.'"');  
		//生成excel文件
		$objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
		//下载文件在浏览器窗口
		$objWriter->save('php://output');
		exit;
		
	}
	
	
}


	
