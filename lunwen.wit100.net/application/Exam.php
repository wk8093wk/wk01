<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\db\Where;
use think\facade\Env;
use think\facade\Cookie;
use think\facade\Session;
use think\facade\Request;
use think\facade\Config;
use think\Page;
use app\common\model\Withdrawals;
use app\common\model\exam as user;

class Exam extends Common
{
	public function initialize(){
        parent::initialize();
    }
	
	//题库列表
	
	public function index(){
		if(I('get.is_ajax')==1){
			header("Location:".U('exam/index_json')."?".$_SERVER['QUERY_STRING']);
			exit();
		}
		$where="id >=0";
		if (Request::post()){
			$param = I('post.');
			

			if($param['type_id']){
				$where=$where." and type_id=".$param['type_id'];
			}
			if($param['keyword']){
				$where=$where." and title like '%".$param['keyword']."%'";
			}
		}
		
		
		//查询所有的科目
		$type = M("exam_type")->where('hide','1')->order('id asc')->select();
		$this->assign('type',$type);
		$f_model = Config::get('FEEDBACK_MODEL');
        $count = M("exam")->where($where)->count();
        $page_size=10;
		$page  = new Page($count,$page_size);
        $list = M("exam")->where($where)->limit($page->firstRow,$page->listRows)->order("id desc")->select();
         $show = $page->show2();
        $this->assign('list',$list);
        $this->assign('page',$show);// 赋值分页输出
		$this->assign('count',$count);
		$this->assign('typelist',$f_model);
		$this->assign('full_page',1);
		$this->assign('page_size',$page_size);
        return $this->fetch();
    }
	
	public function add_exam(){
		if (Request::post()) {
			$param = I('post.');
			if($param['id']){
				$exam_id=$param['id'];
				unset($param['id']);
				M('exam')->where('id',$exam_id)->update($param);
				
			}else{
				M('exam')->data($param)->insert();
			}
			$this->success('操作成功',U('exam/index'));
            exit;
		}
		$option_name = Config::get('OPTION_NAME');
		 $this->assign('option_name',$option_name);
		 
		
		//查询科目
		$type = M("exam_type")->where('hide','1')->order('id asc')->select();
		
		$this->assign('type',$type);
		
		return $this->fetch();
	}
	
	
	public function edit_exam(){
		if (Request::post()) {
			$param = I('post.');
			if($param['id']){
				$exam_id=$param['id'];
				unset($param['id']);
				M('exam')->where('id',$exam_id)->update($param);
				
			}else{
				M('exam')->data($param)->insert();
			}
			$this->success('操作成功',U('exam/index'));
            exit;
		}
		 $id=I('get.id');
		 $this->assign('id',$id);
		
		$res=M('exam')->where('id',$id)->find();
		$this->assign('res',$res);
		
		$option_name = Config::get('OPTION_NAME');
		 $this->assign('option_name',$option_name);
		//查询科目
		$type = M("exam_type")->order('id asc')->select();
		
		$this->assign('type',$type);
		
		return $this->fetch();
	}
	
	
	
	
	
	//删除
	public function del_exam(){
	   $id=I('get.id');
       $row=M('exam')->where('id',$id)->delete();
	   $res = Db::name("exam")->delete($id);
	   
	    if($res !== false){
            $return_arr = ['status' => 1,'msg' => '操作成功','data'  =>''];
        }else{
            $return_arr = ['status' => -1,'msg' => '删除失败','data'  =>''];
        }
        $this->ajaxReturn($return_arr);
	}
	
	
	
	public function index_json(){
	   // $seller_list=I('get.seller_list');
		//$seller_list=!empty($seller_list)? $seller_list : 0;
		$f_model = Config::get('FEEDBACK_MODEL');
		$sort_by=I('get.sort_by');
		$sort_order=I('get.sort_order');
		$page_now=I('get.page');
		
		
		$page_size=I('get.page_size',15);
		$firstRow=($page_now-1)*$page_size;
		$where = new Where;
		/*if($seller_list>0){
			if($seller_list==2)$w=0;
			if($seller_list==1)$w=1;
			$where['is_on_sale']=['eq', $w];
			
		}
*/		
		$where['hide']=['eq',1];
		$count = M("exam")->where($where)->count();
		$order=$sort_by.' '.$sort_order;
		$page  = new Page($count,$page_size);
		$list = M("exam")->where($where)->limit($firstRow,$page_size)->order($order)->select();
        $show = $page->show2();
		
		$filter=array();
		$filter['sort_by']=$sort_by;
		$filter['sort_order']=$sort_order;
		$filter['record_count']=$count;
		$filter['page_size']=$page_size;
		$filter['page']=$page_now;
        $filter['page_count']=$show['totalPages'];
		
		//$this->assign('seller_list',$seller_list);
        $this->assign('list',$list);
		$this->assign('count',$count);
        $this->assign('page',$show);// 赋值分页输出
		$this->assign('full_page','');
		$this->assign('page_size',$page_size);
		$this->assign('typelist',$f_model);
        make_json_result($this->fetch('index'), '', array('filter' => $filter,'page_count' => $show['totalPages']));
    }
	
	
	
	//导出数据
	public function yorder_excel_down(){
		
		
		$list = M("exam")->order("id desc")->select();
		
		foreach($list as $k=>$v){
			
			$list[$k]['type_id']= $v['type_id'];
			
			$list[$k]['title']= $v['title'];
			
			$list[$k]['option_a']= $v['option_a'];
			
			$list[$k]['option_b']= $v['option_b'];
			
			$list[$k]['option_c']=$v['option_c'];
			
			$list[$k]['option_d']=$v['option_d'];
			
			$list[$k]['answer']=$v['answer'];
			
		}
		//2.加载PHPExcle类库
				//vendor('PHPExcel.PHPExcel');
				//3.实例化PHPExcel类
				$objPHPExcel = new \PHPExcel();
				//4.激活当前的sheet表
				$objPHPExcel->setActiveSheetIndex(0);
				//5.设置表格头（即excel表格的第一行）
				$objPHPExcel->setActiveSheetIndex(0)
						->setCellValue('A1', '科类')
						->setCellValue('B1', '标题')
						->setCellValue('C1', '选项A')
						->setCellValue('D1', '选项B')
						->setCellValue('E1', '选项C')
						->setCellValue('F1', '选项D')
						->setCellValue('G1', '答案')
				;
					
				//设置A列水平居中
				//$objPHPExcel->setActiveSheetIndex(0)->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
				//设置单元格宽度
				$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('A')->setWidth(10);
				$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('B')->setWidth(20);
				$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('C')->setWidth(10);
				$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('D')->setWidth(12); 
				$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('E')->setWidth(12);
				$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('F')->setWidth(30);
				$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('G')->setWidth(18);


				//6.循环刚取出来的数组，将数据逐一添加到excel表格。
				for($i=0;$i<count($list);$i++){
					$objPHPExcel->getActiveSheet()->setCellValue('A'.($i+2),$list[$i]['type_id']);
					$objPHPExcel->getActiveSheet()->setCellValue('B'.($i+2),$list[$i]['title']);
					$objPHPExcel->getActiveSheet()->setCellValue('C'.($i+2),$list[$i]['option_a']);
					$objPHPExcel->getActiveSheet()->setCellValue('D'.($i+2),$list[$i]['option_b']);
					$objPHPExcel->getActiveSheet()->setCellValue('E'.($i+2),$list[$i]['option_c']);
					$objPHPExcel->getActiveSheet()->setCellValue('F'.($i+2),$list[$i]['option_d']);
					$objPHPExcel->getActiveSheet()->setCellValue('G'.($i+2),$list[$i]['answer']);

				}
				//7.设置保存的Excel表格名称
				
				$filename = '题库'.date('ymdHis',time()).'.xls';
				
				//8.设置当前激活的sheet表格名称；
				$objPHPExcel->getActiveSheet()->setTitle('题库');
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
	
	
	public function yorder_excel_add(){
		if (IS_POST) {
			
			$root_path=Env::get('root_path').'public';
			$file = request()->file('files');      //获取上传的文件
            $info = $file->move($root_path . '/upload/excel/');
			if($info){            
            //获取文件名称
            $exclePath = $info->getSaveName();  //获取文件名
            $file_name = $root_path . '/upload/excel/'. $exclePath;   //上传文件的地址
	 
				//实例化PHPExcel类
				$PHPExcel = new \PHPExcel();
				$objReader =\PHPExcel_IOFactory::createReader('Excel5');
				$obj_PHPExcel =$objReader->load($file_name, $encode = 'utf-8');  //加载文件内容,编码utf-8
				$excel_array=$obj_PHPExcel->getsheet(0)->toArray();   //转换为数组格式
				array_shift($excel_array);  //删除第一个数组(标题)
				$data = array(); //准备一个数组容器用来根据数据库字段重构数组
				foreach ($excel_array as $key => $value) {                
					$data[$key]['type_id'] = preg_replace('/\s+/', '', $value['0']);
					$data[$key]['title'] = preg_replace('/\s+/', '', $value['1']);
					$data[$key]['option_a'] = preg_replace('/\s+/', '', $value['2']);
					$data[$key]['option_b'] = preg_replace('/\s+/', '', $value['3']);
					$data[$key]['option_c'] = preg_replace('/\s+/', '', $value['4']);
					$data[$key]['option_d'] = preg_replace('/\s+/', '', $value['5']);
					$data[$key]['answer'] = preg_replace('/\s+/', '', $value['6']);

				}
				
				
				
		
				foreach ($data as $k => $v) { 
							M('exam')->data($v)->insert();

				}
				
				$this->error('导入成功',U('exam/index'));
			}else{
				$this->error('新增失败');
			}
			
			exit;
		}
		return $this->fetch();
	}
	
	public function typeindex(){
		
		$keyword = I('post.keyword');
		
		
		if($keyword<>''){
			$count = M("exam_type")->where('typename','like','%'.$keyword.'%')->count();
			$page  = new Page($count,15);
			$list = M("exam_type")->where('typename','like','%'.$keyword.'%')->limit($page->firstRow,$page->listRows)->order("id desc")->select();
			$this->assign('keyword',$keyword);
		}else{
			$count = M("exam_type")->count();
			$page  = new Page($count,15);
			$list = M("exam_type")->limit($page->firstRow,$page->listRows)->order("id desc")->select();
			$this->assign('keyword','');
		}
        $show = $page->show();
		
		
        $this->assign('list',$list);
		
        $this->assign('page',$show);// 赋值分页输出
        return $this->fetch();
    }
	
    //添加新闻
	
	public function add_type(){

		if (Request::post()) {
			$param = I('post.');
			if(!array_key_exists("hide",$param)){
			  $param['hide']=0;
			}

			M('exam_type')->data($param)->insert();
			
			$this->success('操作成功',U('exam/typeindex'));
			
            exit;
		}

	
		return $this->fetch();
	}
	
	public function edit_type(){
		$id=I('get.id');
		if (Request::post()) {
			$param = I('post.');
			if(!array_key_exists("hide",$param)){
			  $param['hide']=0;
			}
			
			
			M('exam_type')->update($param);
			$this->success('操作成功',U('exam/typeindex'));
            exit;
		}
		$info = M('exam_type')->where("id",$id)->find();
		
		$this->assign("info", $info);
		
		
		
		
	
		$this->assign("id", $id);
		return $this->fetch();
	}
	
	public function del_type(){
		
	   $id=I('get.id');
	   
       $row = M('exam_type')->delete(intval($id));
	   
       $return_arr = array();
       if ($row){
		   
           $return_arr = array('status' => 1,'msg' => '删除成功','data'  =>'',);   //$return_arr = array('status' => -1,'msg' => '删除失败','data'  =>'',);
       }else{
           $return_arr = array('status' => -1,'msg' => '删除失败','data'  =>'',);  
       } 
       return $this->ajaxReturn($return_arr);
		
	}
	
	public function batch(){
		$checkboxes = I('post.checkboxes');
		if(!$checkboxes){
			$this->error('请选择对应的商品');
		}
		$types = I('post.sel_action');
		
	
		
		foreach ($checkboxes as  $v){
			if($types=='remove'){
				
			  $rows=M('exam')->where('id',$v)->delete();

			}else if($types=='allow'){
				
			  $rows=M('exam')->where('id',$v)->data(['hide' => 1])->update();
				
			}else if($types=='deny'){
				
			  $rows=M('exam')->where('id',$v)->data(['hide' => 0])->update();
			
			}
			
		}
		$this->success('操作成功',U('exam/index'));
		
	}
	//题库设置
	public function score(){
		if (Request::post()){
			$param = I('post.');
			if($param['id1']){
				$rows=M('exam_score')->where('id',1)->update(array('score'=>$param['id1']));
				$rows=M('exam_score')->where('id',2)->update(array('score'=>$param['id2']));
			}
			$this->success('操作成功',U('exam/score'));
		}
		$res1 = M("exam_score")->where('id',1)->find();
		$res2 = M("exam_score")->where('id',2)->find();
		$this->assign("res1", $res1);
		$this->assign("res2", $res2);
		return $this->fetch();
	}
	
	//时间段列表
	public function settime(){
		if(I('get.is_ajax')==1){
			header("Location:".U('Exam/settime_json')."?".$_SERVER['QUERY_STRING']);
			exit();
		}
		$count = M("settime")->count();
		$page_size=10;
		$page  = new Page($count,$page_size);
		$row =M("settime")->limit($page->firstRow,$page->listRows)->order("id desc")->select();
        $show = $page->show2();
		
        $this->assign('list',$row);
		$this->assign('full_page',1);
        $this->assign('page',$show);// 赋值分页输出
		$this->assign('page_size',$page_size);
		return $this->fetch();
    }

	//限时秒杀json
	public function  settime_json(){
		
		$sort_by=I('get.sort_by');
		$sort_order=I('get.sort_order');
		$page_now=I('get.page');
		
		$page_size=I('get.page_size',10);
		$firstRow=($page_now-1)*$page_size;
		
		$count = M("seckill")->count();

		$order=$sort_by.' '.$sort_order;
		$page  = new Page($count,$page_size);
		$row =M("settime")->limit($firstRow,$page_size)->order($order)->select();
		foreach ($row as $key => $val) {
			$time = time();
			$row[$key]['begin_time'] = date('Y-m-d', $val['begin_time']);
			$row[$key]['acti_time'] = date('Y-m-d', $val['acti_time']);
			$start_time = strtotime($row[$key]['begin_time']);
			$end_time = strtotime($row[$key]['acti_time']);
	
			if ($end_time < $time) {
				$row[$key]['time'] = '活动结束';
			}
			else {
				if ($time < $end_time && $start_time < $time) {
					$row[$key]['time'] = '活动进行中';
				}
				else {
					$row[$key]['time'] = '活动未开始';
				}
			}
	
			$row[$key]['ru_name'] = '自营';
		}
        $show = $page->show2();
		
		$filter=array();
		$filter['sort_by']=$sort_by;
		$filter['sort_order']=$sort_order;
		$filter['record_count']=$count;
		$filter['page_size']=$page_size;
		$filter['page']=$page_now;
        $filter['page_count']=$show['totalPages'];
		
        $this->assign('list',$row);
		$this->assign('full_page','');
        $this->assign('page',$show);// 赋值分页输出
		$this->assign('page_size',$page_size);
	
		make_json_result($this->fetch('seckill'), '', array('filter' => $filter,'page_count' => $show['totalPages']));
	}
	

	
	//添加时间段
	public function add_settime(){
		if(Request::post()){
			$param = I('post.');
			$param['begin_time']=$param['begin_hour'].":".$param['begin_minute'].":".$param['begin_second'];
			$param['end_time']=$param['end_hour'].":".$param['end_minute'].":".$param['end_second'];
			unset($param['begin_hour']);
			unset($param['begin_minute']);
			unset($param['begin_second']);
			unset($param['end_hour']);
			unset($param['end_minute']);
			unset($param['end_second']);
			
			$row=M('seckill_time_bucket')->data($param)->insert();
			if($row){
				$this->success('操作成功',U('exam/all_settime'));
			}
            exit;
		}
		
		$row =M("seckill_time_bucket")->field('MAX(end_time) as times')->order("id desc")->find();
		$begin_time= $row['times'];
		$tb_arr['begin_time '] = explode(':', $begin_time);
			$tb_arr['begin_hour'] = '00';
			$tb_arr['begin_minute'] = '00';
			$tb_arr['begin_second'] = '00';
		if ($begin_time) {
			$tb_arr['begin_hour'] = $tb_arr['begin_time '][0];
			$tb_arr['begin_minute'] = $tb_arr['begin_time '][1];
			$tb_arr['begin_second'] = $tb_arr['begin_time '][2] + 1;
		}
		$this->assign('tb_arr',$tb_arr);
		return $this->fetch();
	}
	public function all_settime(){
		
		$row =M("seckill_time_bucket")->order("id asc")->select();
		
        $this->assign('list',$row);
		
		return $this->fetch();
	}
	
	//限时秒杀添加时间段
	public function edit_settime(){
		 $id=I('get.id');
		if(Request::post()){
			$param = I('post.');
			$param['begin_time']=$param['begin_hour'].":".$param['begin_minute'].":".$param['begin_second'];
			$param['end_time']=$param['end_hour'].":".$param['end_minute'].":".$param['end_second'];
			unset($param['begin_hour']);
			unset($param['begin_minute']);
			unset($param['begin_second']);
			unset($param['end_hour']);
			unset($param['end_minute']);
			unset($param['end_second']);
			
			$row=M('seckill_time_bucket')->data($param)->update();
			if($row){
			$this->success('操作成功',U('exam/all_settime'));
			}else{
			$this->success('字段未发生改变！',U('exam/all_settime'));
			}
            exit;
		}
		$info = M('seckill_time_bucket')->where("id",$id)->find();
		if ($info['begin_time']) {
			$begin_time = explode(':',$info['begin_time']);
			$info['begin_hour'] = $begin_time[0];
			$info['begin_minute'] = $begin_time[1];
			$info['begin_second'] = $begin_time[2];
		}
		if ($info['end_time']) {
			$end_time = explode(':',$info['end_time']);
			$info['end_hour'] = $end_time[0];
			$info['end_minute'] = $end_time[1];
			$info['end_second'] = $end_time[2];
		}
		$this->assign("info", $info);
		
		return $this->fetch();
	}
	/**
     * 删除时间段
     */
	 
	public function del_settime(){
	   $id=I('get.id');
       $row = M('seckill_time_bucket')->delete(intval($id));
       $return_arr = array();
       if ($row){
           $return_arr = array('status' => 1,'msg' => '删除成功','data'  =>'',);   //$return_arr = array('status' => -1,'msg' => '删除失败','data'  =>'',);
       }else{
          	 $return_arr = array('status' => -1,'msg' => '删除失败','data'  =>'',);  
       } 
       return $this->ajaxReturn($return_arr);
		
	}
	
	
	public	function examination(){
		$row =M("exam_record")->order("id asc")->select();
		
		foreach($row as $k=>$v){
			
			
			$row[$k]['add_time']=date("Y-m-d H:i",$v['add_time']);
			
			$res = explode(",",substr($v['exam_id'], 0, -1));
			
			$row[$k]['znum']=count($res);
			
			$res1 = explode(",",substr($v['exam_true'], 0, -1));
			
			$row[$k]['numtrue']=count($res1);
			
			$res2 = explode(",",substr($v['exam_false'], 0, -1));
			
			$row[$k]['numfalse']=count($res2);
		}
		
		
        $this->assign('list',$row);
		return $this->fetch();
	}
	
	public function exam_res(){
		$id=I('get.id');
		$aid=I('get.aid');
		$row =M("exam_record")->where('id',$id)->order("id asc")->find();
		$res = explode(",",substr($row['exam_id'], 0, -1));
		
		foreach($res as $k=>$v){
			$result[$k] =M("exam")->where('id',$v)->order("id asc")->find();
		}
		
		print_r($result);
	}
}
