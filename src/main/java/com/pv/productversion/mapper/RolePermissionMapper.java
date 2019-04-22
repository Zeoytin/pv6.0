package com.pv.productversion.mapper;

import com.pv.productversion.entity.RolePermissionKey;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface RolePermissionMapper {
    int deleteByPrimaryKey(RolePermissionKey key);

    int insert(RolePermissionKey record);

    int insertSelective(RolePermissionKey record);
    //给角色分配权限
    int setPermissionForRole(Map<String, Object> map);
    //清空权限
    int cleanRolePermission(Integer rid);
    //查询角色有没有权限
    List<RolePermissionKey> findPerIdByRoleId(Integer rid);
}