<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\facade\Env;
use think\facade\Cookie;
use think\facade\Session;
use think\facade\Request;
class System extends Common
{
	public function initialize(){
        parent::initialize();
		
    }
    public function index()
    {  
	    $inc_type =  'global';
		 if (Request::post()) {
            $param = I('post.');
			//print_r($param);
			//exit();
           
            tpCache($inc_type, $param);
            //write_global_params(); // 写入全局内置参数
            $this->success('操作成功', U('System/index'));
            exit;
        }
		
		$config = tpCache($inc_type);
		$this->assign('config',$config);//当前配置项
        return $this->fetch();
    }
	
	public function email(){
        
        return $this->fetch();
    }
	
	public function wechat(){
         $inc_type =  'global';
		 if (Request::post()) {
            $param = I('post.');
			//print_r($param);
			//exit();
           
            tpCache($inc_type, $param);
            //write_global_params(); // 写入全局内置参数
            $this->success('操作成功', U('System/index'));
            exit;
        }
		
		$config = tpCache($inc_type);
		$this->assign('config',$config);//当前配置项
        return $this->fetch();
    }
	
	
    
}
