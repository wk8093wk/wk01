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

class Bunner extends Common
{
	public function initialize(){
        parent::initialize();
		
    }
    public function index()
    {  
     return $this->fetch();
    }
	
	public function index_json()
    { 
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  $admin_id=session('admin_id');
	  $sort_by=I('post.sort_by','bunner_id');
	  $sort_order=I('post.sort_order','desc');
	  $where = new Where;
	  $where['is_delete']=array('eq',0);
	  if($key_word){
		 $where['name']=array('like','%'.$key_word.'%');  
	  }
	 
	  $count = M('bunner')->where($where)->count();
	  $page  = new Page($count,$page_size);
	  $logs = M('bunner')->where($where)->limit($page->firstRow,$page->listRows)->order($sort_by.' '.$sort_order)->select(); 
	  foreach($logs as $k=>$v){
		 $logs[$k]['add_time']=date('Y-m-d H:i:s',$v['add_time']);
		 $raw = M('admin')->where('admin_id',$v['admin_id'])->find();
		 $logs[$k]['admin_name']=$raw['user_name']; 
	  }
	 
	  $res=array('code'=>0,'msg'=>'','count'=>$count,'data'=>$logs); 
      $this->ajaxReturn($res);
    }
	
	public function art_del(){
		$id = I('post.id',0);
		$row=M('bunner')->update(array('bunner_id'=>$id,'is_delete'=>1));
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	public function art_dels(){
		$ids = I('post.ids');
		//$ids=implode(",", $id);
		$row=M('program')->where('program_id','in',$ids)->update(array('is_delete'=>1));
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	public function edit(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['name']=$param['name'];
			 
			 $data['link']=$param['link'];
			 $data['thumb']=$param['thumb'];
			 $data['bunner_id']=$param['bunner_id'];
			
			 M('bunner')->update($data);
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
			 
		  }
		  
		}
	    $id = I('get.id/d',0);
	    $info = M('bunner')->where('bunner_id',$id)->find();
		$this->assign('info',$info);
		$admin_list = M('admin')->field('admin_id,user_name')->select();
		$this->assign('admin_list',$admin_list);
        return $this->fetch();
	}
	
	public function add(){
		if (Request::post()){
			$param = I('post.');
			if($param){
			 $data['name']=$param['name'];
			
			 $data['link']=$param['link'];
			 $data['thumb']=$param['thumb'];
			 $data['add_time']=time();
		
			
			 $raw=M('bunner')->data($data)->insert();
			 
			 if($raw){
				 
				 $catId = M('bunner')->getLastInsID();
			     $now=time();
			     M('single_content')->data(array('typeid'=>1,'add_time'=>$now,'update_time'=>$now,'catid'=>$catId))->insert();
			     M('single_content')->data(array('typeid'=>2,'add_time'=>$now,'update_time'=>$now,'catid'=>$catId))->insert();
			 }
			
			 $res=array('code'=>0,'msg'=>'添加成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'添加失败'); 
            $this->ajaxReturn($res);
			 
		  }
		  
		}
	    
		$admin_list = M('admin')->field('admin_id,user_name')->select();
		$this->assign('admin_list',$admin_list);
        return $this->fetch();
	}
	
	
		public function hide(){
		$bunner_id = I('get.id',0);
		$hide = I('get.hide',0);
		
		$row=M('bunner')->data(array('bunner_id'=>$bunner_id,'hide'=>$hide))->update();
		if($row){
            $this->ajaxReturn(['code'=>0,'msg'=>'更新成功！']);
		}else{
			$this->ajaxReturn(['code'=>0,'msg'=>'更新失败！']);
		}
	}
	
	public function relevant(){
		$id = I('get.id',0);
		$this->assign('id',$id);
		$info = M('bunner')->where('bunner_id',$id)->field('name')->find();
		$this->assign('catname',$info['name']);
		return $this->fetch();
	}
	
	public function relevant_json(){
	  $page = I('post.page',1);
	  $page_size=I('post.limit',10);
	  $key_word=I('post.key','');
	  $sort_by=I('post.sort_by','bunner_id');
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
			 $data['bunner_id']=$param['bunner_id'];
			 M('news')->update($data);
			 $res=array('code'=>0,'msg'=>'编辑成功'); 
             $this->ajaxReturn($res); 
			
		  }else{
			$res=array('code'=>1,'msg'=>'编辑失败'); 
            $this->ajaxReturn($res);
			 
		  }
		  
		}
	    $id = I('get.id/d',0);
	    $info = M('news')->where('bunner_id',$id)->find();
		
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
		$row=M('news')->update(array('bunner_id'=>$id,'is_delete'=>1));
		if($row){
          $this->ajaxReturn(['code'=>0,'msg'=>'删除成功！']);
		}
	}
	
	public function category()
    { 
	 $catid = I('get.catid');
	 $this->assign('catid',$catid); 
	 $info = M('bunner')->where('bunner_id',$catid)->field('name')->find();
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
		$id = I('get.id',0);
		$this->assign('id',$id);
		$info = M('bunner')->where('bunner_id',$id)->field('name')->find();
		$this->assign('catname',$info['name']);
		return $this->fetch();
	}
	
	public function guanzhu(){
		$id = I('get.id',0);
		$this->assign('id',$id);
		$info_name = M('bunner')->where('bunner_id',$id)->field('name')->find();
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
			 $data['number']=$param['number'];
			 $data['music']=$param['music'];
			 $data['detail']=$param['detail'];
			 $data['introduce']=$param['introduce'];
			 $data['declaration']=$param['declaration'];
			 $data['ewm_img']=$param['ewm_img'];
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
			 $data['number']=$param['number'];
			 $data['music']=$param['music'];
			 $data['detail']=$param['detail'];
			 $data['introduce']=$param['introduce'];
			 $data['declaration']=$param['declaration'];
			 $data['ewm_img']=$param['ewm_img'];
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
	
	public function vote_del(){
		$id = I('post.id',0);
		$ids=implode(",", $id);
		$row=M('vote')->where('id','in',$ids)->update(array('is_delete'=>1));
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
		$info2 = M('bunner')->where('bunner_id',$id)->field('name')->find();
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
		$info = M('bunner')->where('bunner_id',$id)->field('name')->find();
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
	
	
	
    
}
