package com.pv.productversion.service.impl;

import com.pv.productversion.entity.Role;
import com.pv.productversion.entity.User;
import com.pv.productversion.entity.UserRoleKey;
import com.pv.productversion.mapper.RoleMapper;
import com.pv.productversion.mapper.UserMapper;
import com.pv.productversion.mapper.UserRoleMapper;
import com.pv.productversion.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: pv3.0
 * @Date: 2019/4/2 14:23
 * @Author: Zhaoyt
 * @Description:
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Override
    public User login(User user) {
        return userMapper.login(user);
    }

    @Override
    public List<User> selectAll() {
        return userMapper.selectAll();
    }

    @Override
    public int insert(User user) {
        return userMapper.insertSelective(user);
    }

    @Override
    public int delete(int id) {
        return userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(User user) {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public User getUserById(int id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public int setRoleForUser(Integer uid, String rids) {
        int count = 0;
        try {
            //先删除原有的。
            if (uid!=null){
                List list =userRoleMapper.findRoleIdByUserId(uid);
                if (list.size()>0){
                    userRoleMapper.deleteByUserId(uid);
                }
            }else {return 0;}

            //如果ids,role 的id 有值，那么就添加。没值象征着：把这个用户（userId）所有角色取消。
            if(rids!=null){
                String[] idArray = null;

                //这里有的人习惯，直接ids.split(",") 都可以，我习惯这么写。清楚明了。

                idArray = rids.split(",");

                //添加新的。
                for (String rid : idArray) {
                    //这里严谨点可以判断，也可以不判断。这个{@link StringUtils 我是重写了的}
                    if(rid!=null){
                        UserRoleKey entity = new UserRoleKey(uid,new Integer(rid));
                        count +=userRoleMapper.insertSelective(entity);
                        System.out.println("count="+count);
                    }
                }
                return 1;
            }else {return 0;}
        } catch (Exception e) {
            System.out.println("有异常");
            return 0;
        }
    }

    @Override
    public int cleanUserRole(int uid) {
        return userRoleMapper.deleteByUserId(uid);
    }

    @Override
    public List<Role> findRoleByUserId(int uid) {
        return roleMapper.findRoleByUserId(uid);
    }

    @Override
    public User selectURP(int id) {
        return userMapper.selectURP(id);
    }

    @Override
    public User findByUsername(String username) {
        return userMapper.findByUsername(username);
    }
}
