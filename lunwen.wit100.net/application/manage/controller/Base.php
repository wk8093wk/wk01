<?php

namespace app\manage\controller;
use think\Controller;
use think\Db;
use think\facade\Session;

class Base extends Controller {
    public $session_id;
    public $config = array();
    /*
     * 初始化操作
     */
    public function initialize(){
        parent::initialize();
        $res = M('config')->where('is_del',0)->cache(true)->select();
		foreach($res as $k=>$val){
                    $config[$val['name']] = $val['value'];
        }
		$this->assign('config',$config);
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
}