<?php

namespace app\common\logic;

use think\Loader;

use think\Model;

use think\Page;

use think\Db;



/**

 * 分类逻辑定义

 * Class CatsLogic

 * @package Home\Logic

 */

class StoreLogic extends Model

{

    protected $user_id=0;



    /**

     * 设置用户ID

     * @param $user_id

     */

    public function setUserId($user_id)

    {

        $this->user_id = $user_id;

    }

    /*

     * 登陆

     */

    public function login($username,$password)

    {
	
        if (!$username || !$password) {

            return array('status' => 0, 'msg' => '请填写账号或密码');

        }



        $user = Db::name('admin')->where("user_name", $username)->find();
		
		

        if (!$user) {

            $result = array('status' => -1, 'msg' => '账号不存在!');

        } elseif (encrypt($password) != $user['password']) {
			
			

            $result = array('status' => -2, 'msg' => '密码错误!');

        } elseif ($user['is_delete'] == 1) {

            $result = array('status' => -3, 'msg' => '账号异常已被锁定！！！');

        } else {

           
            session('admin_id', $user['admin_id']);
			
			session('admin_name', $user['user_name']);
			
            session('last_login_time', time());
			
			$newArr = array('last_login'=>time());
			
			//print_r($user);
			
			//exit();
		
			
			 Db::name('admin')->where("admin_id", $user['admin_id'])->data($newArr)->update();



            $result = array('status' => 1, 'msg' => '登陆成功', 'result' => $user);

        }

        return $result;

    }



    /*

     * app端登陆

     */

    public function app_login($username, $password, $capache, $push_id=0)

    {

    	$result = array();

        if(!$username || !$password)

           $result= array('status'=>0,'msg'=>'请填写账号或密码');

        $user = M('users')->where("mobile|email","=",$username)->find();

        if(!$user){

           $result = array('status'=>-1,'msg'=>'账号不存在!');

        }elseif($password != $user['password']){

           $result = array('status'=>-2,'msg'=>'密码错误!');

        }elseif($user['is_lock'] == 1){

           $result = array('status'=>-3,'msg'=>'账号异常已被锁定！！！');

        }else{

            //是否清空积分           zengmm          2018/06/11

            $this->isEmptyingIntegral($user);

            //查询用户信息之后, 查询用户的登记昵称

            $levelId = $user['level'];

            $levelName = M("user_level")->where("level_id", $levelId)->getField("level_name");

            $user['level_name'] = $levelName;            

            $user['token'] = md5(time().mt_rand(1,999999999));

            $data = ['token' => $user['token'], 'last_login' => time()];

            $push_id && $data['push_id'] = $push_id;

            M('users')->where("user_id", $user['user_id'])->save($data);

            $result = array('status'=>1,'msg'=>'登陆成功','result'=>$user);

        }

        return $result;

    }



    /*

     * app端登出

     */

    public function app_logout($token = '')

    {

        if (empty($token)){

            ajaxReturn(['status'=>-100, 'msg'=>'已经退出账户']);

        }



        $user = M('users')->where("token", $token)->find();

        if (empty($user)) {

            ajaxReturn(['status'=>-101, 'msg'=>'用户不在登录状态']);

        }



        M('users')->where(["user_id" => $user['user_id']])->save(['token' => '']);

        session(null);



        return ['status'=>1, 'msg'=>'退出账户成功'];;

    }



   

    

     /*

      * 获取当前登录用户信息

      */

    public function get_info($user_id)

    {

        if (!$user_id) {

            return array('status'=>-1, 'msg'=>'缺少参数');

        }



        $user = M('users')->where('user_id', $user_id)->find();

        if (!$user) {

            return false;

        }



        return ['status' => 1, 'msg' => '获取成功', 'result' => $user];

     }

     

    /*

      * 获取当前登录用户信息

      */

    public function getApiUserInfo($user_id)

    {

        if (!$user_id) {

            return array('status'=>-1, 'msg'=>'账户未登陆');

        }



        $user = M('users')->where('user_id', $user_id)->find();

        if (!$user) {

            return false;

        }



        $activityLogic = new \app\common\logic\ActivityLogic;             //获取能使用优惠券个数

        $user['coupon_count'] = $activityLogic->getUserCouponNum($user_id, 0);

        

        $user['collect_count'] = Db::name('goods_collect')->where('user_id', $user_id)->count();//获取收藏数量

        $user['visit_count']   = M('goods_visit')->where('user_id', $user_id)->count();   //商品访问记录数

        $user['return_count'] = M('return_goods')->where("user_id=$user_id and status<2")->count();   //退换货数量

        $order_where = "deleted=0 AND order_status<>5 AND prom_type<5 AND user_id=$user_id ";

        $user['waitPay']     = M('order')->where($order_where.C('WAITPAY'))->count(); //待付款数量

        $user['waitSend']    = M('order')->where($order_where.C('WAITSEND'))->count(); //待发货数量

        $user['waitReceive'] = M('order')->where($order_where.C('WAITRECEIVE'))->count(); //待收货数量

        $user['order_count'] = $user['waitPay'] + $user['waitSend'] + $user['waitReceive'];

        

        $messageLogic = new \app\common\logic\Message();

        $user['message_count'] = $messageLogic->getUserMessageNoReadCount();

        

        $commentLogic = new CommentLogic;

        $user['uncomment_count'] = $commentLogic->getCommentNum($user_id, 0);; //待评论数

        $user['comment_count'] = $commentLogic->getCommentNum($user_id, 1); //已评论数

        $cartLogic = new CartLogic();

        $cartLogic->setUserId($user_id);

        $user['cart_goods_num'] = $cartLogic->getUserCartGoodsNum();

            

         return ['status' => 1, 'msg' => '获取成功', 'result' => $user];

     }

   

}