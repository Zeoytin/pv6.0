package com.pv.productversion.service;

import com.pv.productversion.entity.VersionRelated;

import java.util.List;
import java.util.Map;

public interface RelatedService {
    //增加关联
    int addRelated(VersionRelated versionRelated);
    //删除关联
    int deleteRelated(Long id);
    //修改关联
    int updateRelated(VersionRelated versionRelated);
    //查询关联
    List<VersionRelated> selectByCondition(Long versionId);

    Map<String, Object> treeRelated();
    List<VersionRelated> getChildren(Long id,List<VersionRelated> allRelated);
    List<VersionRelated> selectByVersionId(Long versionId,Long parentId);
    List<VersionRelated> selectByParent(Long parentId);
    //List<VersionRelated> selectById(Long versionId);
    List<VersionRelated> find( Long versionId);
    Long findId ( Long versionId, Long parentId);
}
