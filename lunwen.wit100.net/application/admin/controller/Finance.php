<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\facade\Env;
use think\facade\Cookie;
use think\facade\Session;
class Finance extends Common
{
	public function initialize(){
        parent::initialize();
		
    }
    public function index()
    {  
	   
     return $this->fetch();
    }
	
	 public function details()
    {  
	   
     return $this->fetch();
    }
	
    
}
