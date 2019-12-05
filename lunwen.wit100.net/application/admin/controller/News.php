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

class News extends Common
{
	public function initialize(){
        parent::initialize();
		
    }
    public function index(){
		
		
		$id = I('get.id/d',0);
	    $info = M('news')->where('news_id',$id)->find();
		$this->assign('info',$info);
		$admin_list = M('admin')->field('admin_id,user_name')->select();
		$this->assign('admin_list',$admin_list);
		$group_list = M('group')->where('is_delete', 0)->select();
		$this->assign('group_list',$group_list);
		
		
		
		//查询出所有的类目
		
		$type_id=I('get.type_id');
		
		$big_type=I('get.big_type');
		
		
		
		if(!$type_id){
			$type_id=1;
		}
		$this->assign('type_id',$type_id);
		//查询所有的大类别
		$this->assign('big_type',$big_type);
		
		$big_type_res=M('group')->select();
		
		
		$this->assign('big_type_res',$big_type_res);
		
		
		
		return $this->fetch();
		
		
		
		
     	return $this->fetch();
    }
	
	
	
	public function index_json()
    { 
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  $admin_id=session('admin_id');
	  $sort_by=I('post.sort_by','news_id');
	  $sort_order=I('post.sort_order','desc');
	  $where = new Where;
	  $where['is_delete']=array('eq',0);
	  if($key_word){
		 $where['name']=array('like','%'.$key_word.'%');  
	  }
	 $type_id = I('get.type_id',0); 
	  
	  if($type_id>0){
	  	$where['group_id']=array('like', "%".$type_id."%");
	  }
	  
	  
	 
	  $count = M('news')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('news')->where($where)->limit($page->firstRow,$page->listRows)->order($sort_by.' '.$sort_order)->select(); 
	  foreach($logs as $k=>$v){
		
		 $logs[$k]['admin_id']= getAdminname($v['admin_id']);
		
		 $logs[$k]['add_time']=date('Y-m-d H:i:s',$v['add_time']);
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
	 
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
	  
	  $group_list = M('group')->where('is_delete', 0)->select();
		$this->assign('group_list',$group_list);
        return $this->fetch();
    }
	
	public function art_del(){
		$id = I('post.id',0);
		$row=M('news')->update(array('news_id'=>$id,'is_delete'=>1));
		$row2=M('article')->update(array('article_id'=>$id,'is_delete'=>1));
//		$row2= M('news')->where('news_id',$id)->find();
//		$row3=M('article')->update(array('article_id'=>$row2['catid'],'is_delete'=>1));
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
		public function art_dels(){
		$ids = I('post.ids');
		//$ids=implode(",", $id);
		$row=M('news')->where('news_id','in',$ids)->update(array('is_delete'=>1));
		$row2=M('article')->where('article_id','in',$ids)->update(array('is_delete'=>1));
//		$row2= M('news')->where('news_id','in',$ids)->select();
//		$row3=M('article')->update(array('article_id','in',$row2['catid'],'is_delete'=>1));
//	
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	
		public function index_listorder(){
		$info['sort'] = I('get.sort');
		$info['click'] = I('get.click');
		$info['turnon'] = I('get.turnon');
		$info['status'] = I('get.status');
		$info['onlygroup'] = I('get.onlygroup');
		$info['news_id'] = I('get.id');
		$row=M('news')->data($info)->update();
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['list'=>$info]);
		}
	}
	
	

	
	
	public function edit(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['name']=$param['name'];
			 $data['thumb']=$param['thumb'];
			 $data['status']=$param['status'];
			 $data['onlygroup']=$param['onlygroup'];
			 $data['turnon']=$param['turnon'];
				 
			 $data['group_id'] =$param['group_id'];
			
			 $data['content']=$param['content'];
			 
			 $data['news_id']=$param['news_id'];
			 
			 
			 $res_news = M('news')->update($data);
			 
			 
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
			 
			 $data1['name']=$param['name'];
			 $data1['thumb']=$param['thumb'];
			 $data1['status']=$param['status'];
			 $data1['onlygroup']=$param['onlygroup'];
			 $data1['turnon']=$param['turnon'];
				 
			
			 $data1['content']=$param['content'];
			
	         
		   
			
			
			 $res_article = M('article')->where('article_id',$param['news_id'])->data($data1)->update();
			 M('article')->update(['group_id' => $data['group_id'],'article_id'=>$data['news_id']]);
			 
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
			 $this->ajaxReturn($res); 
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
			 
		  }
		  
		}
	    $id = I('get.id/d',0);
	    $info = M('news')->where('news_id',$id)->find();

		
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
		
		
		//print_r($group_list_res);

		
        return $this->fetch();
	}
	
	public function add(){
		$admin_id = Session::get('admin_id');	
		
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['admin_id']=$admin_id;	
			 
			 $data1['mold']=1;	
			 $data1['name']=$param['name'];
			 $data1['add_time']=time();
			 $data1['content']=$param['content'];
			 $data1['thumb']=$param['thumb'];
			 
			 $data1['onlygroup']=$param['onlygroup'];
			 $data1['turnon']=$param['turnon'];
			 /*if(!empty($param['group_id'])){
				 $data1['group_id']=implode(',',$param['group_id']);
			 }else{
				 $data1['group_id']='';
				 }*/
				 
			$data1['group_id']=$param['group_id'];
			
			
			
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
			 
			 
	
			
			
			
			
			
				 
			
			// $data['group_id'] = json_decode($request->post('group_id'),true);
			 $data['content']=$param['content'];
//				
			 $data['name']=$param['name'];
			 $data['thumb']=$param['thumb'];
			// $data['author']=$param['author'];
			 
			 $data['onlygroup']=$param['onlygroup'];
			 $data['turnon']=$param['turnon'];
			/* if(!empty($param['group_id'])){
				 $data['group_id']=implode(',',$param['group_id']);
			 }else{
				 $data['group_id']='';
				 }*/
			
			// $data['group_id'] = json_decode($request->post('group_id'),true);
			 $data['group_id']=$param['group_id'];	 
			 
			
			 $data['content']=$param['content'];
			
			 $data['add_time']=time();
			 
			
			 
			 M('article')->insert($data1);

			 $userId = M('article')->getLastInsID();
 


			 $raw=M('news')->data($data)->data('news_id',$userId)->insert();
			
			 
			 
			 
			 
			 
			
			 $res=array('code'=>0,'msg'=>'添加成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'添加失败'); 
            $this->ajaxReturn($res);
			 
		  }
		  
		}
		
		$id = I('get.id/d',0);
	    $info = M('meeting')->where('meeting_id',$id)->find();
		$this->assign('info',$info);
		
	    
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
		
		
		
		
		
	
		
		//$this->assign('group_list',$group_list);
		
        return $this->fetch();
	}
	
	
	
	
		public function status(){
		$news_id = I('get.id',0);
		$status = I('get.status',0);
		
		$row=M('news')->data(array('news_id'=>$news_id,'status'=>$status))->update();
		if($row){
            $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['code'=>0,'msg'=>'更新失败！']);
		}
	}
	
		public function onlygroup(){
		$news_id = I('get.id',0);
		$onlygroup = I('get.onlygroup',0);
		
		$row=M('news')->data(array('news_id'=>$news_id,'onlygroup'=>$onlygroup))->update();
		if($row){
            $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['code'=>0,'msg'=>'更新失败！']);
		}
	}
	
		public function turnon(){
		$news_id = I('get.id',0);
		$turnon = I('get.turnon',0);
		
		$row=M('news')->data(array('news_id'=>$news_id,'turnon'=>$turnon))->update();
		if($row){
            $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['code'=>0,'msg'=>'更新失败！']);
		}
	}
	
	public function relevant(){
		$id = I('get.id',0);
		$this->assign('id',$id);
		$info = M('news')->where('news_id',$id)->field('name')->find();
		$this->assign('catname',$info['name']);
		return $this->fetch();
	}
	
	public function relevant_json(){
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  $sort_by=I('post.sort_by','news_id');
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
	 
	  $count = M('news')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('news')->where($where)->limit($page->firstRow,$page->listRows)->order($sort_by.' '.$sort_order)->select(); 
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
			 $data['news_id']=$param['news_id'];
			 M('news')->update($data);
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
			 
		  }
		  
		}
	    $id = I('get.id/d',0);
	    $info = M('news')->where('news_id',$id)->find();
		
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
			 M('news')->data($data)->insert();
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
		$row=M('news')->update(array('news_id'=>$id,'is_delete'=>1));
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	public function category()
    { 
	 $catid = I('get.catid');
	 $this->assign('catid',$catid); 
	 $info = M('news')->where('news_id',$catid)->field('name')->find();
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
		$info = M('news_annex')->where('id',$id)->field('name')->find();
		$this->assign('catname',$info['name']);
		return $this->fetch();
	}
	
	public function guanzhu(){
		$id = I('get.id',0);
		$this->assign('id',$id);
		$info_name = M('news')->where('news_id',$id)->field('name')->find();
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
			$objPHPExcel->getActiveSheet()->setCellValue('A'.($i+2),$list[$i]['id']);
			$objPHPExcel->getActiveSheet()->setCellValue('B'.($i+2),$list[$i]['name']);
			$objPHPExcel->getActiveSheet()->setCellValue('C'.($i+2),$list[$i]['addtime']);
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
		$info2 = M('news')->where('news_id',$id)->field('name')->find();
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
		$info = M('news')->where('news_id',$id)->field('name')->find();
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
	
	
	
	public function news_annex(){
		$id = I('get.catid',0);
		$this->assign('id',$id);
		$info = M('news')->where('news_id',$id)->field('name')->find();
		$this->assign('catname',$info['name']);
		
		$res = M('config')->where('is_del',0)->select();
		foreach($res as $k=>$val){
			$config[$val['name']] = $val['value'];
        }
		
		$osstoken = gettoken();
		$this->assign('osstoken',$osstoken);
		
		
		return $this->fetch();
	}
	
	public function news_annex_json(){
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
	 
	  $count = M('news_annex')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('news_annex')->where($where)->limit($page->firstRow,$page->listRows)->order($sort_by.' '.$sort_order)->select(); 
	  foreach($logs as $k=>$v){
		 $logs[$k]['add_time']=date('Y-m-d H:i:s',$v['add_time']);
		 
	  }
	 
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
	}
	
	public function news_annex_edit(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['name']=$param['name'];
			 $data['annex']=$param['response'];
			
			 $data['id']=$param['id'];
			 M('news_annex')->data($data)->update();
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
			 
		  }
		  
		}
	    $id = I('get.id/d',0);
	    $info = M('news_annex')->where('id',$id)->find();
		
		$this->assign('info',$info);
		
		$osstoken = gettoken();
		$this->assign('osstoken',$osstoken);
		
		
		$annex= getossname($info['annex']);
		$this->assign('annex',$annex);
		
		
        return $this->fetch();
	}
	
	public function news_annex_add(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['name']=$param['name'];
			 $data['annex']=$param['response'];
			
			 $data['catid']=$param['catid'];
			 $data['add_time']=time();
			
			 M('news_annex')->data($data)->insert();
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
	
	public function news_annex_dels(){
		$id = I('post.id',0);
		$ids=implode(",", $id);
		$row=M('news_annex')->where('id','in',$ids)->update(array('is_delete'=>1));
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	
	public function news_annex_del(){
		$id = I('post.id',0);
		$row=M('news_annex')->update(array('id'=>$id,'is_delete'=>1));
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	
	public function news_annex_listorder(){
		$info = I('get.',0);
		
		$row=M('news_annex')->data($info)->update();
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['list'=>$info]);
		}
	}
    
	
	

	
	
	
	
	
}


	
