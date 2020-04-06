<?php
namespace app\admin\controller;
use app\admin\common\Base;

class File extends Base
{
	// 内容列表
  public function index()
  {
    $data = $this->db->table('file')->lists();

		$this->assign('data',$data);
    return $this -> fetch();
  }

  // 删除
	public function delete(){
		$id = (int)input('post.id');
		$url = $this->db->table('file')->where(array('id'=>$id))->item()['url'];
		$filename = ROOT_PATH . 'public' . DS . substr($url, 1);

    if(file_exists($filename)){
			unlink($filename);
			$res = $this->db->table('file')->where(array('id'=>$id))->delete();
			if($res){
				exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
			}
		}
		exit(json_encode(array('code'=>1,'msg'=>'删除失败，文件不存在')));
	}

	public function delDirAndFile($path, $delDir = FALSE) {
    if (is_array($path)) {
      foreach ($path as $subPath) {
				delDirAndFile($subPath, $delDir);
			}
    }
    if (is_dir($path)) {
			$handle = opendir($path);
			if ($handle) {
				while (false !== ( $item = readdir($handle) )) {
					if ($item != "." && $item != ".."){
						is_dir("$path/$item") ? delDirAndFile("$path/$item", $delDir) : unlink("$path/$item");
					}
				}
				closedir($handle);
				if ($delDir){
					return rmdir($path);
				}
			}
    } else {
			if (file_exists($path)) {
				return unlink($path);
			} else {
				return FALSE;
			}
    }
    clearstatcache();
	}
}