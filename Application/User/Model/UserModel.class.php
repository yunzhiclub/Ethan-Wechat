<?php

namespace User\Model;

use Yunzhi\Model\YunzhiModel;

class UserModel extends YunzhiModel
{
    protected $orderBys     = array("username"=>"asc"); //排序字段方式
    protected $keywords     = "I('get.keywords')"; //查询关键字
    protected $field        = "name"; //查询字段
    protected $_validate = array(
        array("phonenumber","/^0?(13[0-9]|15[012356789]|18[0236789]|14[57]|17[7])[0-9]{8}$/","the phonenumber length is not 11",1,'regex'),//验证手机号码
        );


    protected $_auto = array(
        array('password','password',1,'function'),
        );

 //    //自动验证
	// protected $_validate = array(
 //    array('username', 'require', 'username cannot be empty', 0, 'regex', 1),
 //    //用户名不能为空
 //    array('username','','Account name already exists！',0,'unique',1),
 //    // 在新增的时候验证name字段是否唯一

 //    array('name', 'require', 'name cannot be empty', 0, 'regex', 1),
 //    //姓名不能为空
 //    array('name','','name already exists！',0,'unique',1),
 //    // 在新增的时候验证name字段是否唯一

 //    array('phonenumber','/^1[3|4|5|8][0-9]\d{4,8}$/','phonenumber is wrong','0','regex',3),
   
 //    // array('repassword','password','Incorrect password confirmation',0,'confirm'), 
 //    // 验证确认密码是否和密码一致
 
 //    array('email','email','email format is not correct',0,''), 
 //    // 验证邮箱格式是否正确
 //   );


    /**
     * [resetPassword 重置密码]
     * 重置密码为mengyunzhi
     * @param  [type] $userId [用户id]
     * @return [type]         [description]
     */
    public function resetPassword($userId)
    {
        if ($userId == null) 
        {
            $this ->error = "系统错误!";
            throw new \Think\Exception($this->error,1);
        }
        else
        {
            $data['id'] = $userId;
            $data['password'] = password();
            $this->save($data);
            return true;
        }
    }

    //检查用户名与密码的正确性
    public function checkUser($username,$password){
        //根据用户名获取用户密码与用户信息
        $user = array();
        $user = $this->getUserInfoByName($username);
        if($user == null){
            return 2;//代表无此用户名
        }else if($user['password'] == password($password)){
            return 1;//代表验证成功
        }else{
            return 0;//代表验证失败
        }
    }

    //根据用户名取用户信息
    //$name string
    public function getUserInfoByName($name){
        $map = array();
        $map['username'] = $name;
        return $this->where($map)->find();
    }


}