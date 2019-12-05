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

Route::get('think', function () {
    return 'hello,ThinkPHP5!';
});

Route::get('news-details/:id','home/News/view');

Route::rule('About-MicroPort-Knowledge-and-Action-Medical-Training-Institute$','home/zhixing/index');

Route::rule('Equipment-and-Facilities$','home/zhixing/equipment');

Route::rule('3D-View$','home/zhixing/overall_view');

Route::rule('Press-Release$','home/News/lists?catid=3');

Route::rule('Clinical-Literature$','home/News/lists?catid=4');

Route::rule('About-Innovation-Center$','home/Liangzhi/index');

Route::rule('Challenges$','home/Liangzhi/caselist');

Route::rule('Partnering$','home/Liangzhi/application');

Route::rule('Contact-Us$','home/Contact/index');

Route::get('case/:id','home/Liangzhi/caseview');

return [

];
