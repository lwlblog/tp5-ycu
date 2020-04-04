<?php
namespace app\admin\controller;
use app\admin\common\Base;

class Slide extends Base
{
  // 首页首屏
  public function index(){
    $data = $this->db->table('slide')->order('ord')->lists();
    $category = $this->db->table('category')->where(array('pid'=>0))->cates('id');

    $this->assign('data',$data);
    $this->assign('category',$category);
    return $this->fetch();
  }


  // 添加首屏
  public function add_first(){
    $id = (int)input('get.id');
    $slide = $this->db->table('slide')->where(array('id'=>$id))->item();
    $category = $this->db->table('category')->where(array('pid'=>0))->cates('id');
    $this->assign('category',$category);
    $this->assign('data',$slide);
    return $this->fetch();
  }

  public function save(){
    $id = (int)input('post.id');
    $data['type'] = (int)input('post.type');
    $data['ord'] = (int)input('post.ord');
    $data['c_id'] = (int)input('post.c_id');
    $data['title'] = trim(input('post.title'));
    $data['url'] = trim(input('post.url'));
    $data['img'] = input('post.img');

    if($data['title']=='' || $data['url']=='' || $data['img']==''){
      exit(json_encode(array('code'=>1,'msg'=>'数据不能为空')));
    }
    if($id>0){
      $this->db->table('slide')->where(array('id'=>$id))->update($data);
    }else{
      $this->db->table('slide')->insert($data);
    }
    
    exit(json_encode(array('code'=>0,'msg'=>'保存成功')));
  }

  // 删除
  public function delete(){
    $id = (int)input('post.id');
    $this->db->table('slide')->where(array('id'=>$id))->delete();
    exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
  }
}