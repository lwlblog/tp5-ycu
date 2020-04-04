<?php
namespace app\index\controller;
use think\Controller;
use Util\data\Sysdb;

class Index extends Controller
{
	public function __construct(){
		parent::__construct();
		$this->db = new Sysdb;
		// 获取课程id
		$this->cid = (int)input('get.cid')?(int)input('get.cid'):1;
		$course = $this->db->table('category')->where(array('id'=>$this->cid))->item();
		if ($course['status']) {
			$this -> error('该课程已被管理员禁用',url('/'));
			exit;
		}
		// 获取导航和课程数据
		$nav = $this->db->table('category')->where(array('pid'=>$this->cid, 'is_nav'=>1, 'status'=>0))->order('ord')->lists();
		$course = $this->db->table('category')->where(array('pid'=>0,'status'=>0))->order('ord')->cates('id');
		$title = $course[$this->cid]['title'];

		$this->assign('cid', $this->cid);
		$this->assign('title', $title);
		$this->assign('category', $nav);
		$this->assign('course', $course);
	}
	
	// 首页
	public function index(){
		$data['swiper'] = $this->db->table('slide')->where(array('type'=>0))->order('ord')->lists();
		$data['resource'] = $this->db->table('slide')->where(array('type'=>1))->order('ord')->lists();
		$data['main_swiper'] = $this->db->table('slide')->where(array('type'=>2))->order('ord')->lists();
		$data['team'] = $this->db->table('slide')->where(array('type'=>3))->order('ord')->lists();
		$data['desc'] = $this->db->table('desc')->where(array('c_id'=>$this->cid))->item();

		// 首页显示内容列表
		$data['list'] = $this->db->table('category')->where(array('pid'=>$this->cid, 'is_index'=>1, 'status'=>0))->order('ord')->lists();
		foreach ($data['list'] as $key => $value) {
			$list = $this->db->table('content')->where(array('course_id'=>$this->cid,'cat_id'=>$value['id'], 'status'=>1))->pages(8)['lists'];
			$data['list'][$key]['content'] = $list;
		}

		$this->assign('data', $data);
		return $this->fetch();
	}

	// 内容详情页
	public function detail(){
		$gid = (int)input('get.gid'); // 分类id
		$sid = (int)input('get.sid'); // 子类id
		$n = (int)input('get.n'); // 内容id
		$data = $this->db->table('category')->where(array('id'=>$gid, 'status'=>0))->item();
		// 获取子分类
		$category = $this->db->table('category')->where(array('pid'=>$gid, 'status'=>0))->order('ord')->cates('id');
		// 获取内容列表
		$list = $this->db->table('content')->where(array('course_id'=>$this->cid,'cat_id'=>$gid, 'status'=>1))->lists();
		// 获取内容资源
		$item = $this->db->table('content')->where(array('id'=>$n, 'status'=>1))->item();

		// 三级分类
		if($category && $list){
			foreach ($category as $key => $value) {
				$content = array();
					foreach ($list as $list_item) {
						if($list_item['sub_id'] == $key) {
							array_push($content, $list_item);
						}
					}
					$category[$key]['content'] = $content;
				}
			$data['children'] = $category;
		}else{
			$data['content'] = $list;
		}

		// 课程介绍
		$desc = $data['title']=='课程简介' || $data['title']=='课程介绍' ? $list[0]['url'] : '';
		// 点击排行列表
		$pv_list = $this->db->table('content')->where(array('course_id'=>$this->cid, 'status'=>1))->order('pv desc')->pages(8);
		// 点击量增加
		if($item){
			$this->db->table('content')->where(array('id'=>$item['id']))->update(['pv'=>$item['pv']+1]);
		}

		$this->assign('gid', $gid);
		$this->assign('sid', $sid);
		$this->assign('n', $n);
		$this->assign('item', $item);
		$this->assign('data', $data);
		$this->assign('desc', $desc);
		$this->assign('pv_list', $pv_list['lists']);
		return $this->fetch();
	}

	public function pv(){
		$id = (int)input('get.id');
		// $pv_list = $this->db->table('content')->where(array('status'=>1))->order('pv desc')->pages(8);

		dump($id);
	}

	public function test(){
		return $this->fetch();
	}
}
