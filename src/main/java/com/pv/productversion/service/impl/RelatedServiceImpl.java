package com.pv.productversion.service.impl;

import com.pv.productversion.entity.VersionRelated;
import com.pv.productversion.mapper.VersionRelatedMapper;
import com.pv.productversion.service.RelatedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RelatedServiceImpl implements RelatedService {
    @Autowired
    private VersionRelatedMapper versionRelatedMapper;
    @Override
    public int addRelated(VersionRelated versionRelated) {
        return versionRelatedMapper.insertSelective(versionRelated);
    }

    @Override
    public int deleteRelated(Long id) {

        return versionRelatedMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateRelated(VersionRelated versionRelated) {
        return versionRelatedMapper.updateByPrimaryKey(versionRelated);
    }

    @Override
    public List<VersionRelated> selectByCondition(Long versionId) {
        return versionRelatedMapper.selectByCondition(versionId);
    }

    @Override
    public Map<String, Object> treeRelated() {
        Map<String, Object> data = new HashMap<String, Object>();
        try {//查询所有菜单
            List<VersionRelated> allVersion = versionRelatedMapper.treeRelated();
            //根节点
            List<VersionRelated> rootVersion = new ArrayList<VersionRelated>();
            for (VersionRelated nav : allVersion) {
                if (nav.getParentId() == 0) {//父节点是0的，为根节点。
                    rootVersion.add(nav);
                }
            }

            //为根菜单设置子菜单，getChild是递归调用的
            for (VersionRelated nav : rootVersion) {
                /* 获取根节点下的所有子节点 使用getChild方法*/
                List<VersionRelated> childList = getChildren(nav.getId(), allVersion);
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
    public List<VersionRelated> getChildren(Long id,List<VersionRelated> allRelated) {
        //子菜单
        List<VersionRelated> childList = new ArrayList<VersionRelated>();
        for (VersionRelated nav : allRelated) {
            // 遍历所有节点，将所有菜单的父id与传过来的根节点的id比较
            //相等说明：为该根节点的子节点。
            if (nav.getParentId() == id) {
                childList.add(nav);
            }
        }
        //递归
        for (VersionRelated nav : childList) {
            nav.setChildren(getChildren(nav.getId(), allRelated));
        }
        //如果节点下没有子节点，返回一个空List（递归退出）
        if (childList.size() == 0) {
            return new ArrayList<VersionRelated>();
        }
        return childList;
    }

    @Override
    public List<VersionRelated> selectByVersionId(Long versionId,Long parentId) {
        return versionRelatedMapper.selectByVersionId(versionId,parentId);
    }
    //
    //@Override
    //public List<VersionRelated> selectById(Long versionId) {
    //    return versionRelatedMapper.selectById(versionId);
    //}


    @Override
    public List<VersionRelated> selectByParent(Long parentId) {
        return versionRelatedMapper.selectByParent(parentId);
    }

    @Override
    public List<VersionRelated> find(Long versionId) {
        return versionRelatedMapper.find(versionId);
    }

    @Override
    public Long findId(Long versionId, Long parentId) {
        return versionRelatedMapper.findId(versionId,parentId);
    }
}
