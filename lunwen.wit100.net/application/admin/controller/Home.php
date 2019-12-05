<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\facade\Env;
use think\facade\Cookie;
use think\facade\Session;
class Home extends Common
{
	public function initialize(){
        parent::initialize();
		
    }
    
	public function console(){
		
		
	   $news = M('news')->where('is_delete',0)->count();
	 //  print_r($news);
	 //  exit;
	   $this->assign('news',$news);
	   
	   $meeting = M('meeting')->where('is_delete',0)->count();
	   $this->assign('meeting',$meeting);
	   
	   $user = M('user')->where('is_delete',0)->count();
	   $this->assign('user',$user);
	   
	   $paper = M('paper')->where('is_delete',0)->count();
	   $this->assign('paper',$paper);
	   
	   
        
        return $this->fetch();
    }
	
	
}
