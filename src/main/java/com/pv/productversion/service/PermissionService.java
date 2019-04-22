package com.pv.productversion.service;

import com.pv.productversion.entity.Permission;

import java.util.List;

/**
 * @program: pv3.0
 * @Date: 2019/4/3 13:45
 * @Author: Zhaoyt
 * @Description:
 */

public interface PermissionService {
    //查询所有权限
    List<Permission> selectAll();
    //添加权限
    int insert(Permission permission);
    //删除权限
    int delete(int id);
    //修改权限
    int update(Permission permission);
    //根据id获取权限
    Permission getPermissionById(int id);
}
