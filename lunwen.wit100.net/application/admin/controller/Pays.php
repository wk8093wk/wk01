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
use think\Loader;
class Pays extends Controller
{
	public function initialize(){
        parent::initialize();
		$sys_setting=array();
		$system = M('config')->cache(true)->select();
		foreach ($system as $k => $v) {       
		   $sys_setting[$v['name']]=$v['value'];
		}
		$this->sys_setting=$sys_setting;
		$this->pub_key=$this->sys_setting['public_key'];
		$this->merchantNo=$this->sys_setting['merid'];
		$this->pri_key=$this->sys_setting['private_key'];
		$this->req_url='https://alipay.3c-buy.com';
		
    }
	//用户分账
	 public function index()
    { 
	    $order_id = I('get.order_id');
	    return $order_id;
		
		
	}
	
	  public function querymanual_notice()
    { 
	     if (Request::post()){
            $content = I('post.');
            
        }
		
	}

}
