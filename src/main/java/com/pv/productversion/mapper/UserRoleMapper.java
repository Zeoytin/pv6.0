package com.pv.productversion.mapper;

import com.pv.productversion.entity.UserRoleKey;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface UserRoleMapper {
    int deleteByPrimaryKey(UserRoleKey key);

    int insert(UserRoleKey record);

    int insertSelective(UserRoleKey record);
    //查询用户有没有角色
    List<UserRoleKey> findRoleIdByUserId(Integer uid);
    //分配角色
    int setRoleForUser(Map<String, Object> map);

    int deleteByUserId(Integer uid);

}