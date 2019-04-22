package com.pv.productversion.service.impl;

import com.pv.productversion.entity.Version;
import com.pv.productversion.mapper.VersionMapper;
import com.pv.productversion.service.VersionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class VersionServiceImpl implements VersionService {
    @Autowired
    private VersionMapper versionMapper;

    @Override
    public int insert(Version version) {
        return versionMapper.insertSelective(version);
    }

    @Override
    public Version getLatestVersion(Long productId) {

        return versionMapper.getLatestVersion(productId);
    }

    @Override
    public List<Version> versionList(Long productId) {
        return versionMapper.treeVersion(productId);
    }

    @Override
    public Map<String, Object> treeVersion(Long productId) {
        Map<String, Object> data = new HashMap<String, Object>();
        try {//查询所有菜单
            List<Version> allVersion = versionMapper.treeVersion(productId);
            //根节点
            List<Version> rootVersion = new ArrayList<Version>();
            for (Version nav : allVersion) {
                if (nav.getParentId() == 0) {//父节点是0的，为根节点。
                    rootVersion.add(nav);
                }
            }
           
            //为根菜单设置子菜单，getChild是递归调用的
            for (Version nav : rootVersion) {
                /* 获取根节点下的所有子节点 使用getChild方法*/
                List<Version> childList = getChild(nav.getId(), allVersion);
                nav.setChildren(childList);//给根节点设置子节点
            }
            /**
             * 输出构建好的菜单数据。
             *
             */
//            data.put("success", "true");
            data.put("list", rootVersion);
            return data;
        } catch (Exception e) {
//            data.put("success", "false");
            data.put("list", new ArrayList());
            return data;
        }
    }

    @Override
    public List<Version> getChild(Long versionId, List<Version> allVersion) {
        //子菜单
        List<Version> childList = new ArrayList<Version>();
        for (Version nav : allVersion) {
            // 遍历所有节点，将所有菜单的父id与传过来的根节点的id比较
            //相等说明：为该根节点的子节点。
            if (nav.getParentId() == versionId) {
                childList.add(nav);
            }
        }
        //递归
        for (Version nav : childList) {
            nav.setChildren(getChild(nav.getId(), allVersion));
        }
        //如果节点下没有子节点，返回一个空List（递归退出）
        if (childList.size() == 0) {
            return new ArrayList<Version>();
        }
        return childList;
    }

    @Override
    public List<Version> listChildVersion(Long productId) {
        return versionMapper.listChildVersion(productId);
    }

    @Override
    public List getDescription(Long versionId) {
        return versionMapper.getDescription(versionId);
    }

    @Override
    public List<Version> queryRelated(Long versionId) {
        return versionMapper.queryRelated(versionId);
    }

    @Override
    public int deleteByProduct(Long productId) {
        return versionMapper.deleteByProduct(productId);
    }

    @Override
    public List<Version> selectall() {
        return versionMapper.selectall();
    }

    @Override
    public List<Version> allVersions(int pageSize, int pageNumber) {
        return versionMapper.allVersions(pageSize,pageNumber);
    }

    @Override
    public int countChecked() {
        return versionMapper.countChecked();
    }

    @Override
    public int checked(Long id) {
        return versionMapper.checked(id);
    }

    @Override
    public Version getVersionById(Long id) {
        return versionMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(Version version) {
        return versionMapper.updateByPrimaryKeySelective(version);
    }

    @Override
    public int delete(Long id) {
        return versionMapper.isDelete(id);
    }
}
