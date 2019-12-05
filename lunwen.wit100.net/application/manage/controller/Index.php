<?php
namespace app\manage\controller;

use think\controller;

use think\Page;

use think\Verify;

use think\Image;

use think\Db;

class Index extends Base {
	
	public function initialize(){
        parent::initialize();
		$this->assign('topid',0);
    }


    public function index(){  
	   //学术新闻 
		$map_news['catid'] =3;
		$map_news['hide'] =1; 
        $academic_news = Db::name('article')->where($map_news)->limit(2)->order("add_time desc")->select();
		foreach ($academic_news as $k => $v){
			$academic_news[$k]['url']=url('home/News/view', 'id='.$v['article_id']);
		}
		$this->assign('academic_news', $academic_news);
		//案例列表 
		$map_case['hide'] =1; 
        $case_list = Db::name('case')->where($map_case)->limit(3)->order("orderid asc")->select();
		foreach ($case_list as $k => $v){
			$case_list[$k]['url']=url('home/Liangzhi/caseview', 'id='.$v['article_id']);
		}
		$this->assign('case_list', $case_list);
		$res = M('config')->where('is_del',0)->cache(true)->select();
		foreach($res as $k=>$val){
                    $config[$val['name']] = $val['value'];
        }
		$this->assign('config',$config);
		$this->assign('keywords', $config['store_keyword']);
		$this->assign('description', $config['store_desc']);
        return $this->fetch();

    }
	
	
    

    

}