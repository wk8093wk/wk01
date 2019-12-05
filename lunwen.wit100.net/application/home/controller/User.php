<?php
namespace app\home\controller;

use think\controller;
use think\Page;
use think\Image;
use think\Db;
use think\db\Where;
use think\facade\Session;
use think\facade\Cookie;
use think\facade\Request;

class User extends Base {
	
	public function initialize(){
        parent::initialize();
		$sys_setting=array();
		$system = M('config')->select();
		foreach ($system as $k => $v) {       
		   $sys_setting[$v['name']]=$v['value'];
		}
		$this->sys_setting=$sys_setting;
		$this->assign('sys',$sys_setting);
    }

	
	



//用户注册
	public function zhuce(){
		
		
	  $text=I('post.');
	 
		if($text){
			
			
			// $text1=I('post.text1');
			
			$data['mobile']=$text['mobile'];
			$data['password'] =encrypt($text['password']);
			
			$data['register_time']=time();
			$data['last_time']=time();
			$request = Request::instance();
			$data['register_ip'] = $request->ip();
			
			$raw2 = M('user')->where('mobile',$data['mobile'])->find();
				 if($raw2){
					 $res=array('code'=>1,'msg'=>'手机号已存在'); 
                	 $this->ajaxReturn($res);
				 }
				 
			$raw= M('user')->data($data)->insert();
				if($raw){
					if(!$text['mobile']){
						$res=array('code'=>0,'msg'=>'注册成功'); 
						$this->ajaxReturn($res); 
					}else{
						$res=array('code'=>3,'msg'=>'注册成功'); 
						$this->ajaxReturn($res); 
						}
				}else{
					$res=array('code'=>1,'msg'=>'注册失败'); 
					$this->ajaxReturn($res);
				}
			}else{
				$res=array('code'=>1,'msg'=>'注册失败'); 
				$this->ajaxReturn($res);
			}
		
			
		 exit();
	 }
	 
	 
	 
	 
	 //个人资料设置
	 public function geren(){
	  $user_id = cookie('user_id');
	  $text=I('post.');
	 
		if($text){
			
			//$data['user_id']=$text['user_id'];
			$data['head']=$text['head'];
			$data['company']=$text['company'];
			$data['name']=$text['name'];
			$data['sex']=$text['sex'];
			$data['title']=$text['title'];
			$data['department']=$text['department'];
			
			
			$raw= M('user')->where('user_id',$user_id)->update($data);
			 
			$res=array('code'=>0,'msg'=>'修改成功'); 
            $this->ajaxReturn($res); 
			
			}else{
				$res=array('code'=>1,'msg'=>'修改失败'); 
				$this->ajaxReturn($res);
			}
		
			
	 exit();
	 }
	 
	 
	 
	 
	 //找回密码,验证 
	public function find1(){
		
		
	  $text=I('post.');
	 
		if($text){
			
			$data['mobile']=$text['mobile'];
			
			$raw= M('user')->update($data);
			 
			$res=array('code'=>0,'msg'=>'修改成功'); 
            $this->ajaxReturn($res); 
			
			}else{
				$res=array('code'=>1,'msg'=>'修改失败'); 
				$this->ajaxReturn($res);
			}
		return $this->fetch();
			
	 }

	 
	 //找回，填写新密码
	 public function find2(){
		
	  
	  $text=I('post.');
	 
		if($text){
			
			$data['mobile'] = $text['mobile'];
			$data['password'] =encrypt($text['password']);
			
			
			
			$raw= M('user')->where('mobile|email',$data['mobile'])->update($data);
				if($raw){
					$res=array('code'=>0,'msg'=>'修改成功'); 
					$this->ajaxReturn($res); 
				}else{
					$res=array('code'=>1,'msg'=>'修改失败'); 
					$this->ajaxReturn($res);
				}
			}else{
				$res=array('code'=>1,'msg'=>'修改失败'); 
				$this->ajaxReturn($res);
			}
		
			
	 		return $this->fetch();
	 }
	 
	 
	 public function login_in(){
		 
		
		 
	    $login_writer = I('post.');
		$res = M('user')->where(array('email|mobile'=>$login_writer['names'],'password'=>encrypt($login_writer['passwords'])))->find();
	
			if($res){
				//$this->success('注册成功，请登录！', $url, ['status'=>2]);
				$res['last_time'] = time();
				
				$request = Request::instance();
				$res['last_ip'] = $request->ip();
				
				M('user')->where('user_id', $res['user_id'])->data('last_time',$res['last_time'])->data('last_ip',$res['last_ip'])->update();
				Cookie::set('user_id',$res['user_id'],864000);
				
				if(!$login_writer['id']){
					$this->ajaxReturn(array('msg'=>'登录成功！', 'status'=>1));	
				}else{
					$this->ajaxReturn(array('msg'=>'登录成功！', 'status'=>3));		
				}
					
				
				
			}else{
				$this->ajaxReturn(array('msg'=>'账号或密码错误！', 'status'=>2));
			}
			
			
	}
	public function login_code(){
		
		$mobile = I('post.mobile');
		$id=I('post.id');
		
		$res = M('user')->where('mobile', $mobile)->find();
		$res['last_time'] = time();
				
		$request = Request::instance();
		$res['last_ip'] = $request->ip();
		
		M('user')->where('mobile', $mobile)->data('last_time',$res['last_time'])->data('last_ip',$res['last_ip'])->update();
		Cookie::set('user_id',$res['user_id'],864000);
		
			if(!$id){
				$this->ajaxReturn(array('msg'=>'登录成功！', 'status'=>1));	
			}else{
				$this->ajaxReturn(array('msg'=>'登录成功！', 'status'=>3));		
			}
				
	}
	
	
	public function out(){
		cookie('user_id' , null);
		$this->redirect('/');
		return $this->fetch();
	}
	//获取token
	public function token(){
		$res = M('config')->where('is_del',0)->select();
		foreach($res as $k=>$val){
			$config[$val['name']] = $val['value'];
        }		
		
		$userId = $config['userid'];
		$secret = $config['secret'];
		$sign = base64_encode($secret.time());
	    $url = $config['ipaddress']."/token/create?userId=".$userId."&sign=".$sign;
		$return = getUrl($url);
		$json = json_decode($return, true);
		return $json['token'];
	}



    public function register(){
		$id = I('get.id');
		$this->assign('id',$id);
		
		return $this->fetch();
    }
	public function sendmobile(){
		$res = M('config')->where('is_del',0)->select();
		foreach($res as $k=>$val){
			$config[$val['name']] = $val['value'];
        }
		$this->assign('config',$config);
		
		$mobile=I('post.mobile');
		$raw2 = M('user')->where('mobile',$mobile)->find();
		 if($raw2){
			 $res=array('code'=>2,'msg'=>'手机号已存在'); 
			 $this->ajaxReturn($res);
		 }
		$token = $this->token();
		
		$arr = array();
		$arr['phone'] = $mobile;
		$arr['type'] = 1;
		$arr['code'] = GetRandStr(6);
		
		$arr1['mobile']=$arr['phone'];
		$arr1['type']=$arr['type'];
		$arr1['code']=$arr['code'];
		M('user_yzm')->insert($arr1);
		
		$posturl = $config['ipaddress']."/sms?token=".$token;
		$return = postUrl($posturl,$arr);
		
		$json = json_decode($return, true);
		if($json['code'] == 0){
			$res=array('code'=>0,'msg'=>'发送成功'); 
            $this->ajaxReturn($res); 
			
		}else{
			$res=array('code'=>1,'msg'=>'发送失败'); 
			$this->ajaxReturn($res);
		}
	}
	
	public function checkmobile(){
		$res = M('config')->where('is_del',0)->select();
		foreach($res as $k=>$val){
			$config[$val['name']] = $val['value'];
        }
		$this->assign('config',$config);
		
		$mobile=I('post.mobile');
		$verification = I('post.verification');
		$token = $this->token();
		
/*		$arr = array();
		$arr['phone'] = $mobile;
		$arr['code'] = $verification;
		$arr['type'] = 1;
		$posturl = $config['ipaddress']."/smscheck?token=".$token;
		$return = postUrl($posturl,$arr);
		$json = json_decode($return, true);*/
		
		$bi=M('user_yzm')->where('mobile',$mobile)->where('type',1)->order('id', 'desc')->find();
		
		if($bi['code'] == $verification){
			$res=array('code'=>0,'msg'=>'验证成功'); 
            $this->ajaxReturn($res); 
			
		}else{
			$res=array('code'=>1,'msg'=>'验证失败'); 
			$this->ajaxReturn($res);
		}
	}
	
	//登录发送验证码
	public function sendlogin(){
		$res = M('config')->where('is_del',0)->select();
		foreach($res as $k=>$val){
			$config[$val['name']] = $val['value'];
        }
		$this->assign('config',$config);
		
		$mobile=I('post.mobile');
		$raw2 = M('user')->where('mobile',$mobile)->find();
		 if(!$raw2){
			 $res=array('code'=>2,'msg'=>'手机号不存在，请注册'); 
			 $this->ajaxReturn($res);
		 }
		$token = $this->token();
		
		$arr = array();
		$arr['phone'] = $mobile;
		$arr['type'] = 5;
		$arr['code'] = GetRandStr(6);
		
		$arr1['mobile']=$arr['phone'];
		$arr1['type']=$arr['type'];
		$arr1['code']=$arr['code'];
		M('user_yzm')->insert($arr1);
		
		
		
		$posturl = $config['ipaddress']."/sms?token=".$token;
		$return = postUrl($posturl,$arr);
		
		$json = json_decode($return, true);
		if($json['code'] == 0){
			$res=array('code'=>0,'msg'=>'发送成功'); 
            $this->ajaxReturn($res); 
			
		}else{
			$res=array('code'=>1,'msg'=>'发送失败'); 
			$this->ajaxReturn($res);
		}
	}
	
	public function checkcode(){
		$res = M('config')->where('is_del',0)->select();
		foreach($res as $k=>$val){
			$config[$val['name']] = $val['value'];
        }
		$this->assign('config',$config);
		
		
		$mobile=I('post.mobile');
		$verification = I('post.verification');
		$token = $this->token();
		
/*		$arr = array();
		$arr['phone'] = $mobile;
		$arr['code'] = $verification;
		$arr['type'] = 5;
		$posturl = $config['ipaddress']."/smscheck?token=".$token;
		$return = postUrl($posturl,$arr);
		$json = json_decode($return, true);*/
		$bi=M('user_yzm')->where('mobile',$mobile)->where('type',5)->order('id', 'desc')->find();
		
		if($bi['code'] == $verification){
			$res=array('code'=>0,'msg'=>'验证成功'); 
            $this->ajaxReturn($res); 
			
		}else{
			$res=array('code'=>1,'msg'=>'验证失败'); 
			$this->ajaxReturn($res);
		}
	}
	//找回密码验证短信
	public function findcode(){
		$res = M('config')->where('is_del',0)->select();
		foreach($res as $k=>$val){
			$config[$val['name']] = $val['value'];
        }
		$this->assign('config',$config);
		
		$mobile=I('post.mobile');
		$raw2 = M('user')->where('mobile',$mobile)->find();
		 if(!$raw2){
			 $res=array('code'=>2,'msg'=>'手机号不存在，请注册'); 
			 $this->ajaxReturn($res);
		 }
		$token = $this->token();
		
		$arr = array();
		$arr['phone'] = $mobile;
		$arr['type'] = 2;
		$arr['code'] = GetRandStr(6);
		
		$arr1['mobile']=$arr['phone'];
		$arr1['type']=$arr['type'];
		$arr1['code']=$arr['code'];
		M('user_yzm')->insert($arr1);
		
		$posturl = $config['ipaddress']."/sms?token=".$token;
		$return = postUrl($posturl,$arr);
		
		$json = json_decode($return, true);
		if($json['code'] == 0){
			$res=array('code'=>0,'msg'=>'发送成功'); 
            $this->ajaxReturn($res); 
			
		}else{
			$res=array('code'=>1,'msg'=>'发送失败'); 
			$this->ajaxReturn($res);
		}
	}
	public function checkfindcode(){
		$res = M('config')->where('is_del',0)->select();
		foreach($res as $k=>$val){
			$config[$val['name']] = $val['value'];
        }
		$this->assign('config',$config);
		
		$mobile=I('post.mobile');
		$verification = I('post.verification');
		$token = $this->token();
/*		
		$arr = array();
		$arr['phone'] = $mobile;
		$arr['code'] = $verification;
		$arr['type'] = 2;
		$posturl = $config['ipaddress']."/smscheck?token=".$token;
		$return = postUrl($posturl,$arr);
		$json = json_decode($return, true);*/
		
		$bi=M('user_yzm')->where('mobile',$mobile)->where('type',2)->order('id', 'desc')->find();

		if($bi['code'] == $verification){
			$res=array('code'=>0,'msg'=>'验证成功'); 
            $this->ajaxReturn($res); 
			
		}else{
			$res=array('code'=>1,'msg'=>'验证失败'); 
			$this->ajaxReturn($res);
		}
	}
	
	
	
	//手机验证
		public function anquanmobile2(){
		
		$res = M('config')->where('is_del',0)->select();
		foreach($res as $k=>$val){
			$config[$val['name']] = $val['value'];
        }
		$this->assign('config',$config);
		
		$mobile=I('post.mobile');
		$type=I('post.type');
		$token = $this->token();
		
		$mob = M('user')->where('mobile',$mobile)->find();
	
		
		$arr = array();
		$arr['phone'] = $mobile;
		$arr['type'] = $type;
		$arr['code'] = GetRandStr(6);
		
		$arr1['mobile']=$arr['phone'];
		$arr1['type']=$arr['type'];
		$arr1['code']=$arr['code'];
		M('user_yzm')->insert($arr1);
		
		
		$posturl = $config['ipaddress']."/sms?token=".$token;
		$return = postUrl($posturl,$arr);
		
		$json = json_decode($return, true);
		if($json['code'] == 0){
			$res=array('code'=>0,'msg'=>'发送成功'); 
            $this->ajaxReturn($res); 
			
		}else{
			$res=array('code'=>1,'msg'=>'发送失败'); 
			$this->ajaxReturn($res);
		}
	}
	
	
	
	//安全验证
	public function anquanmobile(){
		
		$res = M('config')->where('is_del',0)->select();
		foreach($res as $k=>$val){
			$config[$val['name']] = $val['value'];
        }
		$this->assign('config',$config);
		
		$mobile=I('post.mobile');
		$type=I('post.type');
		$token = $this->token();
		
		$mob = M('user')->where('mobile',$mobile)->find();
		if($mob){
			$res=array('code'=>2,'msg'=>'手机号已存在'); 
            $this->ajaxReturn($res); 
			}
		
		$arr = array();
		$arr['phone'] = $mobile;
		$arr['type'] = $type;
		$arr['code'] = GetRandStr(6);
		
		$arr1['mobile']=$arr['phone'];
		$arr1['type']=$arr['type'];
		$arr1['code']=$arr['code'];
		M('user_yzm')->insert($arr1);
		
		$posturl = $config['ipaddress']."/sms?token=".$token;
		$return = postUrl($posturl,$arr);
		
		$json = json_decode($return, true);
		if($json['code'] == 0){
			$res=array('code'=>0,'msg'=>'发送成功'); 
            $this->ajaxReturn($res); 
			
		}else{
			$res=array('code'=>1,'msg'=>'发送失败'); 
			$this->ajaxReturn($res);
		}
	}
	public function anquancheck(){
		$res = M('config')->where('is_del',0)->select();
		foreach($res as $k=>$val){
			$config[$val['name']] = $val['value'];
        }
		$this->assign('config',$config);
		
		$mobile=I('post.mobile');
		$verification = I('post.verification');
		$type=I('post.type');
		$token = $this->token();
		
		/*$arr = array();
		$arr['phone'] = $mobile;
		$arr['code'] = $verification;
		$arr['type'] = $type;
		$posturl = $config['ipaddress']."/smscheck?token=".$token;
		$return = postUrl($posturl,$arr);
		$json = json_decode($return, true);*/
		$bi=M('user_yzm')->where('mobile',$mobile)->where('type',$type)->order('id', 'desc')->find();
		
		if($bi['code'] == $verification){
			$res=array('code'=>0,'msg'=>'验证成功'); 
            $this->ajaxReturn($res); 
			
		}else{
			$res=array('code'=>1,'msg'=>'验证失败'); 
			$this->ajaxReturn($res);
		}
	}
	//更换新的手机号
	public function altermobile(){
		$mobile=I('post.mobile');
		$user_id=I('post.user_id');
		$res = M('user')->where('user_id',$user_id)->update(array('mobile'=>$mobile));
		if($res){
			$res=array('code'=>0,'msg'=>'修改成功'); 
            $this->ajaxReturn($res); 
		}else{
			$res=array('code'=>1,'msg'=>'验证失败'); 
            $this->ajaxReturn($res); 
		}
	}
	
	
	

    public function anquanshezhi(){ 
		
		$user_id = cookie('user_id');
		
		$this->assign('user_id',$user_id);
		
		$rawaq = M('user')->where('user_id',$user_id)->find();
		$str = substr_replace($rawaq['mobile'],'****',3,4);
		$this->assign('rawaq',$rawaq);
		$this->assign('str',$str);
	    
        return $this->fetch();

    }
	
	
	  public function gai(){ 
		
		$user_id = cookie('user_id');
	    $text=I('post.');
	 
		if($text){
			
			//$data['user_id']=$text['user_id'];
			$data['user_id']=$text['user_id'];
			$data['password']=encrypt($text['password']);
			
			$raw= M('user')->where('user_id',$user_id)->update($data);
				if($raw){
					$res=array('code'=>0,'msg'=>'修改成功'); 
					$this->ajaxReturn($res); 
				}else{
					$res=array('code'=>2,'msg'=>'修改失败'); 
					$this->ajaxReturn($res);
				}
			}else{
				$res=array('code'=>1,'msg'=>'修改失败'); 
				$this->ajaxReturn($res);
			}
		
			
	 exit();

    }
	
	 
	 
    public function gerenshezhi(){ 
		
		$id = I('get.id',0);
		$this->assign('id',$id);
		
		$user_id = cookie('user_id');
		$this->assign('user_id',$user_id);
		
		$raw = M('user')->where('user_id',$user_id)->find();
		$this->assign('raw',$raw);
		
	    
        return $this->fetch();

    }
	
	
	 public function login(){  
	 
	 	$id = I('get.id');
		$this->assign('id',$id);
	    
        return $this->fetch();

    }
	public function zhaohui(){  
	    
        return $this->fetch();

    }
	public function zhaohui2(){  
	    $mobile=I('get.mobile');
		$this->assign('mobile',$mobile);
        return $this->fetch();

    }
	
	
	
	public function yuanpassword(){ 
		
		$user_id = cookie('user_id');
	    $text=I('post.');
	 	$rawpass= M('user')->where('user_id',$user_id)->find();
		
		if($text){
			
			//$data['user_id']=$text['user_id'];
			$data['user_id']=$text['user_id'];
			$data['password']=encrypt($text['password']);
			
			
			
			if($data['password'] == $rawpass['password']){
			
				$res=array('code'=>0,'msg'=>'原密码验证成功'); 
				$this->ajaxReturn($res); 
				
			}else{

				$res=array('code'=>1,'msg'=>'原密码不正确'); 
				$this->ajaxReturn($res);
				}
		}
			
	 exit();

    }
	
	
	public function yuanpassword2(){ 
		
		$user_id = cookie('user_id');
	    $text=I('post.');
	 	$rawpass= M('user')->where('user_id',$user_id)->find();
		
		if($text){
			
			//$data['user_id']=$text['user_id'];
			$data['user_id']=$text['user_id'];
			$data['password']=encrypt($text['password']);
			
			
			
			if($data['password'] == $rawpass['password']){
			
				$res=array('code'=>0,'msg'=>'原密码验证成功'); 
				$this->ajaxReturn($res); 
			}else{
				$res=array('code'=>1,'msg'=>'原密码不正确'); 
				$this->ajaxReturn($res);
			}
	
	 exit();
	 }

    }
	
	
	
	public function emailsend0() {
		$user_id = cookie('user_id');
	    $text=I('post.');
	 	$rawpass= M('user')->where('user_id',$user_id)->find();
		
		if($text){
			
			//$data['user_id']=$text['user_id'];
			$data['user_id']=$text['user_id'];
			$data['email']=$text['email'];
			
			
				$code0=GetRandStr(6);
				
				M('user')->update(['code' => $code0,'user_id'=>$user_id]);
				M('user')->update(['email_temporary' => $data['email'],'user_id'=>$user_id]);
				$raw= M('user')->where('user_id',$user_id)->find();
				
				
				$code=$raw['code'];
				$toemail=$data['email'];
				$raw = send_mail($toemail,$code);
				if($raw){
					$res=array('code'=>0,'msg'=>'验证码发送成功'); 
					$this->ajaxReturn($res); 
				}else{
					$res=array('code'=>1,'msg'=>'验证码发送失败'); 
					$this->ajaxReturn($res); 
				}
		}else{
				$res=array('code'=>1,'msg'=>'验证码发送失败'); 
				$this->ajaxReturn($res); 
			}
      
    }
	
	
	
	public function emailsend1() {
		$user_id = cookie('user_id');
	    $text=I('post.');
	 	$rawpass= M('user')->where('user_id',$user_id)->find();
		
		if($text){
			
			//$data['user_id']=$text['user_id'];
			$data['user_id']=$text['user_id'];
			$data['email']=$text['email'];
			
			
			if($data['email'] == $rawpass['email']){
			
				$code0=GetRandStr(6);
				
				
				M('user')->update(['code' => $code0,'user_id'=>$user_id]);
				$raw= M('user')->where('user_id',$user_id)->find();
				
				
				$code=$raw['code'];
				$toemail=$data['email'];
				$raw=send_mail($toemail,$code);
				if($raw){
					$res=array('code'=>0,'msg'=>'邮箱验证成功'); 
					$this->ajaxReturn($res);
				}else{
					$res=array('code'=>1,'msg'=>'邮箱验证失败'); 
					$this->ajaxReturn($res); 
				}
			}else{
				
				$res=array('code'=>1,'msg'=>'邮箱验证失败'); 
				$this->ajaxReturn($res);
						
			}
		}
      
    }
	
	
	
	public function emailsend2() {
        $user_id = cookie('user_id');
	    $text=I('post.');
	 	$rawpass= M('user')->where('user_id',$user_id)->find();
		
		if($text){
			
			//$data['user_id']=$text['user_id'];
			$data['user_id']=$text['user_id'];
			$data['email']=$text['email'];
			
			
			if($data['email'] == $rawpass['email']){
			
				
				$code0=GetRandStr(6);
				
					
				M('user')->update(['code' => $code0,'user_id'=>$user_id]);
				$raw= M('user')->where('user_id',$user_id)->find();
				
				
				$code=$raw['code'];
				$toemail=$data['email'];
				$raw= send_mail($toemail,$code);
				if($raw){
					$res=array('code'=>0,'msg'=>'邮箱验证成功'); 
					$this->ajaxReturn($res); 
				}else{
					$res=array('code'=>1,'msg'=>'邮箱验证失败'); 
					$this->ajaxReturn($res); 
				}
			}else{
				
				$res=array('code'=>1,'msg'=>'邮箱验证失败'); 
				$this->ajaxReturn($res);
						
			}
		}
    }
	
	
	
		public function emailcode0() {
		$user_id = cookie('user_id');
	    $text=I('post.');
	 	
		
		if($text){
			
			//$data['user_id']=$text['user_id'];
			$data['user_id']=$text['user_id'];
			$data['code']=$text['code'];
			//$data1['email']=$text['email'];
			$data1['email_validated'] = 0;
 			
			$rawpass= M('user')->where('user_id',$data['user_id'])->find();
			
			if($data['code'] == $rawpass['code']){
				
				M('user')->where('user_id',$data['user_id'])->update($data1);
				$raw = M('user')->update(['email' => $rawpass['email_temporary'],'user_id'=>$user_id]);
				
				if($raw){
					$res=array('code'=>0,'msg'=>'绑定成功'); 
					$this->ajaxReturn($res); 
				}else{
				
					$res=array('code'=>1,'msg'=>'绑定失败'); 
					$this->ajaxReturn($res);		
				}
			
			}else{
				
				$res=array('code'=>1,'msg'=>'绑定失败'); 
				$this->ajaxReturn($res);
						
			}
		}
      
    }
	
	
	public function emailcode1() {
		$user_id = cookie('user_id');
	    $text=I('post.');
	 	$rawpass= M('user')->where('user_id',$user_id)->find();
		
		if($text){
			
			//$data['user_id']=$text['user_id'];
			$data['user_id']=$text['user_id'];
			$data['code']=$text['code'];
			
			
			if($data['code'] == $rawpass['code']){
			
				$res=array('code'=>0,'msg'=>'验证成功'); 
				$this->ajaxReturn($res); 
			}else{
				
				$res=array('code'=>1,'msg'=>'验证失败'); 
				$this->ajaxReturn($res);
						
			}
		}
      
    }
	
	
	
		public function emailcode2() {
		$user_id = cookie('user_id');
	    $text=I('post.');
	 	$rawpass= M('user')->where('user_id',$user_id)->find();
		
		if($text){
			
			//$data['user_id']=$text['user_id'];
			$data['user_id']=$text['user_id'];
			$data['code']=$text['code'];
			
			
			if($data['code'] == $rawpass['code']){
			
				$res=array('code'=>0,'msg'=>'验证成功'); 
				$this->ajaxReturn($res); 
			}else{
				
				$res=array('code'=>1,'msg'=>'验证失败'); 
				$this->ajaxReturn($res);
						
			}
		}
      
    }
	
	
	
	
	
	
	
	
	
	
	

}