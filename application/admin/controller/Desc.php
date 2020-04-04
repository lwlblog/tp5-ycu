<?php
namespace app\admin\controller;
use app\admin\common\Base;

class Desc extends Base
{
	// 内容列表
  public function index()
  {
    $data['category'] = $this->db->table('category')->where(array('pid'=>0))->order('ord')->cates('id');
    $data['list'] = $this->db->table('desc')->lists();

		$this->assign('data',$data);
    return $this -> fetch();
  }

	// 添加内容
  public function add()
  {
		$id = (int)input('get.id');
		// 获取课程
		$data['course'] = $this->db->table('category')->where(array('pid'=>0))->lists();
		$data['item'] = $this->db->table('desc')->where(array('id'=>$id))->item();
		
		$this->assign('data',$data);
		return $this->fetch();
	}

  // 保存
  public function save()
  {
    $id = (int)input('post.id');
		$data['c_id'] = (int)input('post.c_id');
		$data['desc'] = trim(input('post.desc'));
    $data['img'] = trim(input('post.img'));
    $data['url'] = trim(input('post.url'));

		if(!$data['c_id']){
			exit(json_encode(array('code'=>1,'msg'=>'请选择课程')));
		}
		if(!$data['desc']){
			exit(json_encode(array('code'=>1,'msg'=>'课程简介不能为空')));
		}
		if(!$data['img']){
			exit(json_encode(array('code'=>1,'msg'=>'图片链接不能为空')));
		}
		if(!$data['url']){
			exit(json_encode(array('code'=>1,'msg'=>'内容链接不能为空')));
		}

		if($id){
			$this->db->table('desc')->where(array('id'=>$id))->update($data);
		}else{
			$data['add_time'] = time();
			$this->db->table('desc')->insert($data);
		}
		exit(json_encode(array('code'=>0,'msg'=>'保存成功')));
  }

  // 删除管理员
	public function delete(){
		$id = (int)input('post.id');
		$res = $this->db->table('desc')->where(array('id'=>$id))->delete();
		if(!$res){
			exit(json_encode(array('code'=>1,'msg'=>'删除失败')));
		}
		exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
	}
}