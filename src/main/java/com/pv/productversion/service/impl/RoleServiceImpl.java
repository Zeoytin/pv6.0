package com.pv.productversion.service.impl;

import com.pv.productversion.entity.Permission;
import com.pv.productversion.entity.Role;
import com.pv.productversion.entity.RolePermissionKey;
import com.pv.productversion.mapper.PermissionMapper;
import com.pv.productversion.mapper.RoleMapper;
import com.pv.productversion.mapper.RolePermissionMapper;
import com.pv.productversion.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: pv3.0
 * @Date: 2019/4/2 17:37
 * @Author: Zhaoyt
 * @Description:
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private PermissionMapper permissionMapper;
    @Autowired
    private RolePermissionMapper rolePermissionMapper;
    @Override
    public List<Role> selectAll() {
        return roleMapper.findAll();
    }

    @Override
    public int insert(Role role) {
        return roleMapper.insertSelective(role);
    }

    @Override
    public int delete(int id) {
        return roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(Role role) {
        return roleMapper.updateByPrimaryKeySelective(role);
    }

    @Override
    public Role getRoleById(int id) {
        return roleMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Permission> findPermissionByRoleId(int rid) {
        return permissionMapper.findPermissionByRoleId(rid);
    }

    @Override
    public int setPermissionForRole(Integer rid,String pids) {
        int count = 0;
        try {
            //先删除原有的。
            List list =rolePermissionMapper.findPerIdByRoleId(rid);
            if (list.size()>0){
                rolePermissionMapper.cleanRolePermission(rid);
            }
            //如果ids,role 的id 有值，那么就添加。没值象征着：把这个用户（userId）所有角色取消。
            if(pids!=null){
                String[] idArray = null;

                //这里有的人习惯，直接ids.split(",") 都可以，我习惯这么写。清楚明了。

                idArray = pids.split(",");

                //添加新的。
                for (String pid : idArray) {
                    //这里严谨点可以判断，也可以不判断。这个{@link StringUtils 我是重写了的}
                    if(rid!=null){
                        RolePermissionKey entity = new RolePermissionKey(rid,new Integer(pid));
                        count +=rolePermissionMapper.insertSelective(entity);
                        System.out.println("count="+count);
                    }
                }
            }
            return 1;
        } catch (Exception e) {
            System.out.println("有异常");
            return 0;
        }
    }

    @Override
    public int cleanRolePermission(int rid) {
        return rolePermissionMapper.cleanRolePermission(rid);
    }

}
