<?php
namespace app\admin\controller;
use app\admin\common\Base;

class Admin extends Base
{
  // 管理员列表
  public function index()
  {
    $data['lists'] = $this->db->table('admins')->lists();
    // 加载角色
    $data['groups'] = $this->db->table('admin_groups')->cates('gid');
    
    $this->assign('data',$data);
    return $this -> fetch();
  }

  // 添加管理员
  public function add()
  {
    $id = (int)input('get.id');
		// 加载管理员
    $data['item'] = $this->db->table('admins')->where(array('id'=>$id))->item();
		// 加载角色
    $data['groups'] = $this->db->table('admin_groups')->cates('gid');
		$this->assign('data',$data);
		return $this->fetch();
  }

  // 保存管理员
  public function save()
  {
    $id = (int)input('post.id');
		$data['username'] = trim(input('post.username'));
		$data['gid'] = (int)input('post.gid');
		$password = trim(input('post.pwd'));
		$data['truename'] = trim(input('post.truename'));
		$data['status'] = (int)(input('post.status'));

		if(!$data['username']){
			exit(json_encode(array('code'=>1,'msg'=>'用户名不能为空')));
		}
		if(!$data['gid']){
			exit(json_encode(array('code'=>1,'msg'=>'角色不能为空')));
		}
		if($id==0 && !$password){
			exit(json_encode(array('code'=>1,'msg'=>'密码不能为空')));
		}
		if(!$data['truename']){
			exit(json_encode(array('code'=>1,'msg'=>'姓名不能为空')));
		}

		if($password){
			// 密码处理
			$data['password'] = md5($data['username'].$password);
		}
		
		$res = true;
		if($id==0){
			// 检查用户是否已存在
			$item = $this->db->table('admins')->where(array('username'=>$data['username']))->item();
			if($item){
				exit(json_encode(array('code'=>1,'msg'=>'该用户已存在')));
			}
			$data['add_time'] = time();
			// 保存用户
			$res = $this->db->table('admins')->insert($data);
		}else{
			$this->db->table('admins')->where(array('id'=>$id))->update($data);
		}
		
		if(!$res){
			exit(json_encode(array('code'=>1,'msg'=>'保存失败')));
		}
		exit(json_encode(array('code'=>0,'msg'=>'保存成功')));
  }

  // 删除管理员
	public function delete(){
		$id = (int)input('post.id');
		$res = $this->db->table('admins')->where(array('id'=>$id))->delete();
		if(!$res){
			exit(json_encode(array('code'=>1,'msg'=>'删除失败')));
		}
		exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
	}

	// 修改密码
	public function edit(){
		$id = (int)input('get.id');
		$data['item'] = $this->db->table('admins')->where(array('id'=>$id))->item();

		$this->assign('data',$data);
		return $this->fetch();
	}

	// 保存修改
	public function update(){
		$id = (int)input('post.id');
		$data['username'] = trim(input('post.username'));
		$data['truename'] = trim(input('post.truename'));
		$old_pwd = md5($data['username'].trim(input('post.old_pwd')));
		$item = $this->db->table('admins')->where(array('id'=>$id))->item();

		if($item['password'] !== $old_pwd){
			exit(json_encode(array('code'=>1,'msg'=>'原密码不正确')));
		}else{
			$data['password'] = md5($data['username'].trim(input('post.new_pwd')));
			$this->db->table('admins')->where(array('id'=>$id))->update($data);
			exit(json_encode(array('code'=>0,'msg'=>'修改成功')));
		}
	}
}