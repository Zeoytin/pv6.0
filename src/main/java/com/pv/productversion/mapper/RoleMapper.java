package com.pv.productversion.mapper;

import com.pv.productversion.entity.Role;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    //查询所有角色
    List<Role> findAll();
    //根据用户id查询角色
    List<Role> findRoleByUserId(@Param("uid") int uid);

    List<Role> selectAllRoles(@Param("id") int id);

    List<Role> findRoleByUsername(@Param("username") String username);
}