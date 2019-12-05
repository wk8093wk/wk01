<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// +----------------------------------------------------------------------
// | 模板设置
// +----------------------------------------------------------------------

return [
    // 模板引擎类型 支持 php think 支持扩展
    'type'         => 'Think',
    // 默认模板渲染规则 1 解析为小写+下划线 2 全部转换小写 3 保持操作方法
    'auto_rule'    => 1,
    // 模板路径
    'view_path'    => '',
    // 模板后缀
    'view_suffix'  => 'html',
    // 模板文件名分隔符
    'view_depr'    => DIRECTORY_SEPARATOR,
    // 模板引擎普通标签开始标记
    'tpl_begin'    => '{',
    // 模板引擎普通标签结束标记
    'tpl_end'      => '}',
    // 标签库标签开始标记
    'taglib_begin' => '{',
    // 标签库标签结束标记
    'taglib_end'   => '}',
	'tpl_replace_string'      => [

        '__ADMINJS__'     =>	'/static/admin/js',
        '__ADMINCSS__'    =>	'/static/admin/css',
		'__ADMINIMG__'    =>	'/static/admin/images',
		'__ADMINSKIN__'   =>	'/static/admin',
		'__STATIC__'      =>	'/static',
		'__PUBLIC__'      =>	'/public',
		'__HOMES__'       =>	'/static/home',
		'__PREFIX__'      =>	'tp_',
		'__HOMEJS__'      =>	'/static/home/js',
        '__HOMECSS__'     =>	'/static/home/css',
		'__HOMEIMG__'     =>	'/static/home/images',

    ],
];
