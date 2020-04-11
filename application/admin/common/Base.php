<?php
namespace app\admin\common;
use think\Controller;
use Util\data\Sysdb;

class Base extends Controller
{
  public function __construct(){
		parent::__construct();
		$this->_admin = session('admin');
		// 未登录的用户不允许访问
		if(!$this->_admin){
			header('Location: /admin.php/Account/login');
			exit;
		}
		// 判断用户是否有权限
		$this->assign('admin',$this->_admin);
		$this->db = new Sysdb;
		// 获取菜单id
		$m_id = (int)input('get.m_id');
		$menu_s = $this->db->table('admin_menus')->where(array('mid'=>$m_id))->item();
		$menu_p = $this->db->table('admin_menus')->where(array('mid'=>$menu_s['pid']))->item();
		$this->assign('menu_s',$menu_s);
		$this->assign('menu_p',$menu_p);
	}	
}
