<?php
namespace app\admin\controller;
use app\admin\common\Base;
use Util\data\Sysdb;

class Category extends Base
{
  // 课程标题信息
  public function index() {
    $pid = (int)input('get.pid');
		$data['lists'] = $this->db->table('category')->where(array('pid'=>$pid))->lists();

		// 返回上级
		$backid = 0;
		if($pid > 0){
			$parent = $this->db->table('category')->where(array('id'=>$pid))->item();
			$backid = $parent['pid'];
		}

		$this->assign('pid',$pid);
		$this->assign('backid',$backid);
		$this->assign('data',$data);
		return $this->fetch();
  }

  // 保存
	public function save(){
		$pid = (int)input('post.pid');
		$ords = input('post.ords/a');
		$titles = input('post.titles/a');
    $is_index = input('post.is_index/a');
    $is_nav = input('post.is_nav/a');
    $status = input('post.status/a');

		foreach ($titles as $key => $value) {
			// 新增
			$data['pid'] = $pid;
			$data['ord'] = $ords[$key];
			$data['title'] = $titles[$key];
      $data['is_index'] = isset($is_index[$key]) ? 1 : 0;
      $data['is_nav'] = isset($is_nav[$key]) ? 1 : 0;
      $data['status'] = isset($status[$key]) ? 1 : 0;

			if($key==0 && $data['title']){
				$this->db->table('category')->insert($data);
			}
			if($key > 0){
				if($data['title']==''){
					// 删除
					$this->db->table('category')->where(array('id'=>$key))->delete();
				}else{
					// 修改
					$this->db->table('category')->where(array('id'=>$key))->update($data);
				}
			}
		}

		exit(json_encode(array('code'=>0,'msg'=>'保存成功')));
	}
}