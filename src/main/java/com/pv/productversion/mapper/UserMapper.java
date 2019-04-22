package com.pv.productversion.mapper;

import com.pv.productversion.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    //登录验证
    User login(User user);
    //查询所有用户
    List<User> selectAll();
    //查询用户对应角色以及角色对应权限
    User selectURP(int id);
    //通过username查找用户信息
    User findByUsername(@Param("username") String username);

}