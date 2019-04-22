package com.pv.productversion.service;

import com.pv.productversion.entity.Role;
import com.pv.productversion.entity.User;

import java.util.List;

/**
 * @program: pv3.0
 * @Date: 2019/4/2 14:25
 * @Author: Zhaoyt
 * @Description:
 */
public interface UserService {
    //登录验证
    User login(User user);
    //查询所有用户
    List<User> selectAll();
    //添加用户
    int insert(User user);
    //删除用户
    int delete(int id);
    //修改用户
    int update(User user);
    //根据id获取用户
    User getUserById(int id);
    //给用户分配角色
    int setRoleForUser(Integer uid,String rids);
    //清空角色
    int cleanUserRole(int uid);
    //根据用户id查询角色
    List<Role> findRoleByUserId(int uid);
    //查询用户对应角色以及角色对应权限
    User selectURP(int id);
    //通过username查找用户信息
    User findByUsername(String username);
}
