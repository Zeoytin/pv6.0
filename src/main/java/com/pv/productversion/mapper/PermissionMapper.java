package com.pv.productversion.mapper;

import com.pv.productversion.entity.Permission;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PermissionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Permission record);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);

    //查询所有角色
    List<Permission> findAll();

    //根据角色id查询权限
    List<Permission> findPermissionByRoleId(@Param("rid") int rid);

    List<Permission> selectAllpermissions(@Param("id") int id);
}