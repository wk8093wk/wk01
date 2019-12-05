<?php /*a:1:{s:72:"/home/wwwroot/lunwen.wit100.net/application/admin/view/home/console.html";i:1572484156;}*/ ?>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layuiAdmin 主页示例模板二</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="/static/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="/static/layuiadmin/style/admin.css" media="all">
</head>
<body>

  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      
      <div class="layui-col-sm6 layui-col-md3">
        <div class="layui-card">
          <div class="layui-card-header">
            新闻动态
            <span class="layui-badge layui-bg-blue layuiadmin-badge">总计</span>
          </div>
          <div class="layui-card-body layuiadmin-card-list">
            <p class="layuiadmin-big-font"><?php echo htmlentities($news); ?></p>
            <p>
              <!--总计访问量 
              <span class="layuiadmin-span-color">0<i class="layui-inline layui-icon layui-icon-flag"></i></span>-->
            </p>
          </div>
        </div>
      </div>
      <div class="layui-col-sm6 layui-col-md3">
        <div class="layui-card">
          <div class="layui-card-header">
            会议信息
            <span class="layui-badge layui-bg-cyan layuiadmin-badge">总计</span>
          </div>
          <div class="layui-card-body layuiadmin-card-list">
            <p class="layuiadmin-big-font"><?php echo htmlentities($meeting); ?></p>
            <p>
              <!--新下载 
              <span class="layuiadmin-span-color">0<i class="layui-inline layui-icon layui-icon-face-smile-b"></i></span>-->
            </p>
          </div>
        </div>
      </div>
      <div class="layui-col-sm6 layui-col-md3">
        <div class="layui-card">
          <div class="layui-card-header">
            用户量
            <span class="layui-badge layui-bg-green layuiadmin-badge">总计</span>
          </div>
          <div class="layui-card-body layuiadmin-card-list">

            <p class="layuiadmin-big-font"><?php echo htmlentities($user); ?></p>
            <p>
              <!--总收入 
              <span class="layuiadmin-span-color">0 <i class="layui-inline layui-icon layui-icon-dollar"></i></span>-->
            </p>
          </div>
        </div>
      </div>
      <div class="layui-col-sm6 layui-col-md3">
        <div class="layui-card">
          <div class="layui-card-header">
            上传论文
            <span class="layui-badge layui-bg-orange layuiadmin-badge">总计</span>
          </div>
          <div class="layui-card-body layuiadmin-card-list">

            <p class="layuiadmin-big-font"><?php echo htmlentities($paper); ?></p>
            <p>
              <!--最近一个月 
              <span class="layuiadmin-span-color">0<i class="layui-inline layui-icon layui-icon-user"></i></span>-->
            </p>
          </div>
        </div>
      </div>   
     <!-- <div class="layui-col-sm12">
        <div class="layui-card">
          <div class="layui-card-header">
            访问量
            <div class="layui-btn-group layuiadmin-btn-group">
              <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs">去年</a>
              <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs">今年</a>
            </div>
          </div>
          <div class="layui-card-body">
            <div class="layui-row">
              <div class="layui-col-sm8">
                  <div class="layui-carousel layadmin-carousel layadmin-dataview" data-anim="fade" lay-filter="LAY-index-pagetwo">
                    <div carousel-item id="LAY-index-pagetwo">
                      <div><i class="layui-icon layui-icon-loading1 layadmin-loading"></i></div>
                    </div>
                  </div>
              </div>
              <div class="layui-col-sm4">
                <div class="layuiadmin-card-list">
                  <p class="layuiadmin-normal-font">月访问数</p>
                  <span>同上期增长</span>
                  <div class="layui-progress layui-progress-big" lay-showPercent="yes">
                    <div class="layui-progress-bar" lay-percent="0%"></div>
                  </div>
                </div>
                <div class="layuiadmin-card-list">
                  <p class="layuiadmin-normal-font">月下载数</p>
                  <span>同上期增长</span>
                  <div class="layui-progress layui-progress-big" lay-showPercent="yes">
                    <div class="layui-progress-bar" lay-percent="0%"></div>
                  </div>
                </div>
                <div class="layuiadmin-card-list">
                  <p class="layuiadmin-normal-font">月收入</p>
                  <span>同上期增长</span>
                  <div class="layui-progress layui-progress-big" lay-showPercent="yes">
                    <div class="layui-progress-bar" lay-percent="0%"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>-->
      
      
        
      </div>
    </div>
  </div>
  
  <script src="/static/layuiadmin/layui/layui.js"></script>  
  <script>
  layui.config({
    base: '/static/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'sample']);
  </script>
</body>
</html>