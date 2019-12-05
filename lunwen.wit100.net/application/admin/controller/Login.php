<?php
namespace app\admin\controller;
use think\Controller;
use think\captcha\Captcha;
use think\facade\Cookie;
use think\facade\Session;
use think\facade\Request;
use think\Db;
use app\common\logic\StoreLogic;
class Login extends Controller
{
    private $cache_model,$system;
    public function initialize(){
		
        if (Session::get('admin_id')) {
            $this->redirect('index/index'); 
			
        }
        
    }
    public function index(){
        if (request()->isPost()) {
            $code = I('post.vercode');
            $username = I('post.username/s');
            $password = I('post.password/s');
            
            if (!captcha_check($code)) {
                return json(['status' => 0, 'msg' => '验证码错误']);
            }
            
            $supplierLogic = new StoreLogic;
			
            $return = $supplierLogic->login($username, $password);
			
            return json($return);
        }
      
        if (session('admin_id') && session('admin_id') > 0) {
            $this->error("您已登录", U('Index/index'));
        }
		

        return $this->fetch();
    }
    public function verify(){
        $config =    [
            // 验证码字体大小
            'fontSize'    =>    25,
			
			'codeSet'  => '123456789',
			
			'useCurve' =>false,

            'useNoise' => false,
			
			'imageH'   => '',
       
            'imageW'   => '',
            // 验证码位数
            'length'      =>    4,
            // 关闭验证码杂点
            'useNoise'    =>    false,
            'bg'          =>    [255,255,255],
        ];
        $captcha = new Captcha($config);
        return $captcha->entry();
    }
	
	
}