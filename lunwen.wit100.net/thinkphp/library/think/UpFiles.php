<?php
namespace app\home\controller;
use think\Controller;
use think\Db;
use think\db\Where;
use think\facade\Env;
use think\facade\Cookie;
use think\facade\Session;
use think\facade\Request;

use OSS\Core\OssException;

class UpFiles extends Base
{
	public function initialize(){
        parent::initialize();
		
    }
	
	
	
	
	
	
	

	
	
	
	
	
	
    public function upload(){
        // 获取上传文件表单字段名
        $fileKey = array_keys(request()->file());
        // 获取表单上传文件
        $file = request()->file($fileKey['0']);
        // 移动到框架应用根目录/public/uploads/ 目录下

        $info = $file->validate(['ext' => 'jpg,png,gif,jpeg'])->move('uploads','');
        if($info){
            $result['status'] = 0;
            $result['msg'] = '图片上传成功!';
            $path=str_replace('\\','/',$info->getSaveName());
            $result['url'] = '/uploads/'. $path;
            return $result;
        }else{
            // 上传失败获取错误信息

            $result['status'] =1;
            $result['msg'] =  $file->getError();
            $result['url'] = '';
            return $result;
        }
    }
	
	
	    public function annex(){
        // 获取上传文件表单字段名
        $fileKey = array_keys(request()->file());
        // 获取表单上传文件
        $file = request()->file($fileKey['0']);
        // 移动到框架应用根目录/public/uploads/ 目录下

        $info = $file->validate(['ext' => 'doc,docx,pdf,zip,rar,ppt,pptx'])->move('uploads','');
        if($info){
            $result['status'] = 0;
            $result['msg'] = '论文上传成功!';
            $path=str_replace('\\','/',$info->getSaveName());
            $result['url'] = '/uploads/'. $path;
            return $result;
        }else{
            // 上传失败获取错误信息

            $result['status'] =1;
            $result['msg'] =  $file->getError();
            $result['url'] = '';
            return $result;
        }
    }
	
	//zip,rar,pdf,swf,ppt,psd,ttf,txt,xls,doc,docx,mp3
	public function file(){
        $fileKey = array_keys(request()->file());
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file($fileKey['0']);
        // 移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->validate(['ext' => 'doc,docx,xls,xlsx,pdf,zip,rar,jpg,png'])->move('uploads','');
        if($info){
            $result['status'] = 0;
            $result['msg'] = '文件上传成功!';
            $path=str_replace('\\','/',$info->getSaveName());

            $result['url'] = '/uploads/'. $path;
            $result['ext'] = $info->getExtension();
       
            return $result;
        }else{
            // 上传失败获取错误信息
            $result['status'] =1;
            $result['msg'] = '文件上传失败!';
            $result['url'] = '';
            return $result;
        }
    }
	
	
	
	
		public function fileqt(){
        
		
		 $file = request()->file('file');  //获取到上传的文件
        $resResult = Image::open($file);
        // 尝试执行
        try {
            $config = Config::pull('aliyun_oss'); //获取Oss的配置
            //实例化对象 将配置传入
            $ossClient = new OssClient($config['KeyId'], $config['KeySecret'], $config['Endpoint']);
            //这里是有sha1加密 生成文件名 之后连接上后缀
            $fileName = sha1(date('YmdHis', time()) . uniqid()) . '.' . $resResult->type();
            //执行阿里云上传
            $result = $ossClient->uploadFile($config['Bucket'], $fileName, $file->getInfo()['tmp_name']);
            /**
             * 这个只是为了展示
             * 可以删除或者保留下做后面的操作
             */
            $arr = [
                '图片地址:' => $result['info']['url'],
                '数据库保存名称' => $fileName
            ];
        } catch (OssException $e) {
            return $e->getMessage();
        }
        //将结果输出
        dump($arr);
		
		
    }
	
    
}
