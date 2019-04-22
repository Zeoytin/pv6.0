package com.pv.productversion.service;

import com.pv.productversion.entity.Permission;
import com.pv.productversion.entity.Role;

import java.util.List;

/**
 * @program: pv3.0
 * @Date: 2019/4/2 17:35
 * @Author: Zhaoyt
 * @Description:
 */
public interface RoleService {
    //查询所有角色
    List<Role> selectAll();
    //添加角色
    int insert(Role role);
    //删除角色
    int delete(int id);
    //修改角色
    int update(Role role);
    //根据id获取角色
    Role getRoleById(int id);
    //根据角色id查询权限
    List<Permission> findPermissionByRoleId(int rid);
    //给角色分配权限
    int setPermissionForRole(Integer rid,String pids);
    //清空权限
    int cleanRolePermission(int rid);
}
