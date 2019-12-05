<?php
/**
 * 易优CMS
 * ============================================================================
 * 版权所有 2016-2028 海南赞赞网络科技有限公司，并保留所有权利。
 * 网站地址: http://www.eyoucms.com
 * ----------------------------------------------------------------------------
 * 如果商业用途务必到官方购买正版授权, 以免引起不必要的法律纠纷.
 * ============================================================================
 * Author: 小虎哥 <1105415366@qq.com>
 * Date: 2018-4-3
 */
 
namespace app\admin\controller;

class Uploadify extends Common
{
    public $image_type = '';

    /**
     * 析构函数
     */
    function __construct() 
    {
        parent::__construct();
        $this->image_type = 'jpg,gif,png,bmp,jpeg,ico';
        $this->image_type = !empty($this->image_type) ? str_replace('|', ',', $this->image_type) : tpCache('global.image_type');
    }

    public function upload()
    {
        $func = I('func');
        $path = I('path','temp');
        $num = I('num/d', '1');
        $default_size = intval(tpCache('global.file_size') * 1024 * 1024); // 单位为b
        $size = I('size/d'); // 单位为kb
        $size = empty($size) ? $default_size : $size*1024;
        $info = array(
            'num'=> $num,
            'title' => '',          
            'upload' =>U('Ueditor/imageUp',array('savepath'=>$path,'pictitle'=>'banner','dir'=>'images')),
            'fileList'=>U('Uploadify/fileList',array('path'=>$path)),
            'size' => $size,
            'type' => $this->image_type,
            'input' => I('input'),
            'func' => empty($func) ? 'undefined' : $func,
        );
        $this->assign('info',$info);
        return $this->fetch();
    }
	
	
	

    /**
     * 在弹出窗里的上传图片
     */
    public function upload_frame()
    {
        $func = I('func');
        $path = I('path','temp');
        $num = I('num/d', '1');
        $default_size = intval(tpCache('global.file_size') * 1024 * 1024); // 单位为b
        $size = I('size/d'); // 单位为kb
        $size = empty($size) ? $default_size : $size*1024;
        $info = array(
            'num'=> $num,
            'title' => '',          
            'upload' =>U('Ueditor/imageUp',array('savepath'=>$path,'pictitle'=>'banner','dir'=>'images')),
            'fileList'=>U('Uploadify/fileList',array('path'=>$path)),
            'size' => $size,
            'type' => $this->image_type,
            'input' => I('input'),
            'func' => empty($func) ? 'undefined' : $func,
        );
        $this->assign('info',$info);
        return $this->fetch();
    }

    /**
     * 后台（产品）专用
     */
    public function upload_product()
    {
        $aid = I('aid/d');
        $func = I('func');
        $path = I('path','temp');
        $num = I('num/d', '1');
        $default_size = intval(tpCache('global.file_size') * 1024 * 1024); // 单位为b
        $size = I('size/d'); // 单位为kb
        $size = empty($size) ? $default_size : $size*1024;
        $field = array(
            'aid' => $aid,
            'num' => $num,
            'title' => '',          
            'upload' => U('Ueditor/imageUp',array('savepath'=>$path,'pictitle'=>'banner','dir'=>'images')),
            'fileList'=> U('Uploadify/fileList',array('path'=>$path)),
            'size' => $size,
            'type' => $this->image_type,
            'input' => I('input'),
            'func' => empty($func) ? 'undefined' : $func,
        );
        $this->assign('field',$field);
        return $this->fetch();
    }

    /**
     * 完整的上传模板展示
     */
    public function upload_full()
    {
        $func = I('func');
        $path = I('path','temp');
        $num = I('num/d', '1');
        $default_size = intval(tpCache('global.file_size') * 1024 * 1024); // 单位为b
        $size = I('size/d'); // 单位为kb
        $size = empty($size) ? $default_size : $size*1024;
        $info = array(
            'num'=> $num,
            'title' => '',          
            'upload' =>U('Ueditor/imageUp',array('savepath'=>$path,'pictitle'=>'banner','dir'=>'images')),
            'fileList'=>U('Uploadify/fileList',array('path'=>$path)),
            'size' => $size,
            'type' => $this->image_type,
            'input' => I('input'),
            'func' => empty($func) ? 'undefined' : $func,
        );
        $this->assign('info',$info);
        return $this->fetch();
    }
    
    /*
     * 删除上传的图片
     */
    public function delupload()
    {
        $action = I('action','del');                
        $filename= I('filename/s');
        $filename= empty($filename) ? I('url') : $filename;
        $filename= str_replace('../','',$filename);
        $filename= trim($filename,'.');
        $filename= trim($filename,'/');
        if(eyPreventShell($filename) && $action=='del' && !empty($filename) && file_exists($filename)){
            $filetype = preg_replace('/^(.*)\.(\w+)$/i', '$2', $filename);
            $phpfile = strtolower(strstr($filename,'.php'));  //排除PHP文件
            $size = getimagesize($filename);
            $fileInfo = explode('/',$size['mime']);
            if($fileInfo[0] != 'image' || $phpfile || !in_array($filetype, explode('|',tpCache('global.image_type')))){
               exit;
            }
            if(unlink($filename)){
                echo 1;
            }else{
                echo 0;
            }  
            exit;
        }
    }
    
    public function fileList(){
        /* 判断类型 */
        $type = I('type','Images');
        switch ($type){
            /* 列出图片 */
            case 'Images' : $allowFiles = str_replace(',', '|', $this->image_type);break;
        
            case 'Flash' : $allowFiles = 'flash|swf';break;
        
            /* 列出文件 */
            default : 
            {
                $file_type = tpCache('global.file_type');
                $media_type = tpCache('global.media_type');
                $allowFiles = $file_type.'|'.$media_type;
            }
        }

        $listSize = 102400000;
        
        $key = empty($_GET['key']) ? '' : $_GET['key'];
        
        /* 获取参数 */
        $size = isset($_GET['size']) ? htmlspecialchars($_GET['size']) : $listSize;
        $start = isset($_GET['start']) ? htmlspecialchars($_GET['start']) : 0;
        $end = $start + $size;
        
        $path = I('path','temp');
        if (1 == preg_match('#\.#', $path)) {
            echo json_encode(array(
                    "state" => "路径不符合规范",
                    "list" => array(),
                    "start" => $start,
                    "total" => 0
            ));
            exit;
        }
        if ('adminlogo' == $path) {
            $path = 'public/static/admin/logo';
        } else {
            $path = UPLOAD_PATH.$path;
        }

        /* 获取文件列表 */
        $files = $this->getfiles($path, $allowFiles, $key);
        if (empty($files)) {
            echo json_encode(array(
                    "state" => "没有相关文件",
                    "list" => array(),
                    "start" => $start,
                    "total" => count($files)
            ));
            exit;
        }
        
        /* 获取指定范围的列表 */
        $len = count($files);
        for ($i = min($end, $len) - 1, $list = array(); $i < $len && $i >= 0 && $i >= $start; $i--){
            $list[] = $files[$i];
        }
        
        /* 返回数据 */
        $result = json_encode(array(
                "state" => "SUCCESS",
                "list" => $list,
                "start" => $start,
                "total" => count($files)
        ));
        
        echo $result;
    }

    /**
     * 遍历获取目录下的指定类型的文件
     * @param $path
     * @param array $files
     * @return array
     */
    private function getfiles($path, $allowFiles, $key, &$files = array()){
        if (!is_dir($path)) return null;
        if(substr($path, strlen($path) - 1) != '/') $path .= '/';
        $handle = opendir($path);
        while (false !== ($file = readdir($handle))) {
            if ($file != '.' && $file != '..') {
                $path2 = $path . $file;
                if (is_dir($path2)) {
                    $this->getfiles($path2, $allowFiles, $key, $files);
                } else {
                    if (preg_match("/\.(".$allowFiles.")$/i", $file) && preg_match("/.*". $key .".*/i", $file)) {
                        $files[] = array(
                            'url'=> '/'.$path2,
                            'name'=> $file,
                            'mtime'=> filemtime($path2)
                        );
                    }
                }
            }
        }
        return $files;
    }
}