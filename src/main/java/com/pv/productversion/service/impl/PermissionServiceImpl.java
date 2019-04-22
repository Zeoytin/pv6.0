package com.pv.productversion.service.impl;

import com.pv.productversion.entity.Permission;
import com.pv.productversion.mapper.PermissionMapper;
import com.pv.productversion.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: pv3.0
 * @Date: 2019/4/3 13:48
 * @Author: Zhaoyt
 * @Description:
 */
@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionMapper permissionMapper;
    @Override
    public List<Permission> selectAll() {
        return permissionMapper.findAll();
    }

    @Override
    public int insert(Permission permission) {
        return permissionMapper.insertSelective(permission);
    }

    @Override
    public int delete(int id) {
        return permissionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(Permission permission) {
        return permissionMapper.updateByPrimaryKeySelective(permission);
    }

    @Override
    public Permission getPermissionById(int id) {
        return permissionMapper.selectByPrimaryKey(id);
    }
}
