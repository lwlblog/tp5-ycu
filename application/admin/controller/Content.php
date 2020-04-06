<?php
namespace app\admin\controller;
use app\admin\common\Base;
use Util\data\Sysdb;

class Content extends Base
{
	// 内容列表
  public function index()
  {
		$data['pageSize'] = 10;
		$data['page'] = max(1,(int)input('get.page'));

		$data['wd'] = trim(input('get.wd'));
		$where = array();
		$data['wd'] && $where = 'title like "%'.$data['wd'].'%"';
    $data['lists'] = $this->db->table('content')->where($where)->order('id desc')->pages($data['pageSize']);
		$data['category'] = $this->db->table('category')->cates('id');

		$this->assign('data',$data);
    return $this -> fetch();
  }

	// 添加内容
  public function add()
  {
		$id = (int)input('get.id');
		// 获取一级分类
		$data['course'] = $this->db->table('category')->where(array('pid'=>0))->lists();
		$data['item'] = $this->db->table('content')->where(array('id'=>$id))->item();
		if($id && $data['item']['cat_id'] !== 0){
			// 编辑页面获取分类数据
			$data['cat_list'] = $this->db->table('category')->where(array('pid'=>$data['item']['course_id']))->cates('id');
			$data['sub_list'] = $this->db->table('category')->where(array('pid'=>$data['item']['cat_id']))->cates('id');
		}
		
		$this->assign('data',$data);
		return $this->fetch();
	}
	
	// 分类联动
	public function category(){
		$id = (int)input('get.id');
		$category = $this->db->table('category')->where(array('pid'=>$id))->lists();
		exit(json_encode(array('code'=>0,'data'=>$category)));
	}

	// 上传文件
	public function upload_file(){
		$file = request()->file('file');
		if($file==null){
			exit(json_encode(array('code'=>1,'msg'=>'没有文件上传')));
		}
		$info = $file->move(ROOT_PATH.'public'.DS.'uploads');
		$ext = ($info->getExtension());
		// if(!in_array($ext,array('jpg','jpeg','gif','png'))){
		// 	exit(json_encode(array('code'=>1,'msg'=>'文件格式不支持')));
		// }
		$getSaveName=str_replace("\\","/",$info->getSaveName());
		$url = '/uploads/'.$getSaveName;

		// 保存到数据库
		$data['type'] = $ext;
		$data['url'] = $url;
		$data['add_time'] = time();
		$this->db->table('file')->insert($data);

		exit(json_encode(array('code'=>0,'msg'=>'上传成功','data'=>$url)));
	}

  // 保存
  public function save()
  {
    $id = (int)input('post.id');
		$data['course_id'] = (int)input('post.course_id');
		$data['cat_id'] = (int)input('post.cat_id');
		$data['sub_id'] = (int)input('post.sub_id');
		$data['title'] = trim(input('post.title'));
		$data['desc'] = trim(input('post.desc'));
		$data['author'] = trim(input('post.author'));
		$data['url'] = trim(input('post.url'));
		$data['status'] = (int)(input('post.status'));
		$data['img'] = trim(input('post.img'));

		if(!$data['course_id']){
			exit(json_encode(array('code'=>1,'msg'=>'课程不能为空')));
		}
		if(!$data['title']){
			exit(json_encode(array('code'=>1,'msg'=>'标题不能为空')));
		}
		if(!$data['url']){
			exit(json_encode(array('code'=>1,'msg'=>'内容链接不能为空')));
		}

		if($id){
			$this->db->table('content')->where(array('id'=>$id))->update($data);
		}else{
			$data['add_time'] = time();
			$this->db->table('content')->insert($data);
		}
		exit(json_encode(array('code'=>0,'msg'=>'保存成功')));
  }

  // 删除管理员
	public function delete(){
		$id = (int)input('post.id');
		$res = $this->db->table('content')->where(array('id'=>$id))->delete();
		if(!$res){
			exit(json_encode(array('code'=>1,'msg'=>'删除失败')));
		}
		exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
	}
}