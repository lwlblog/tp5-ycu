<?php
namespace app\admin\controller;
use app\admin\common\Base;

class Other extends Base
{
  public function icon(){
    return $this->fetch();
  }
}