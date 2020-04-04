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
		$this->assign('admin',$this->_admin);
		// 判断用户是否有权限
		$this->db = new Sysdb;
	}	
}
