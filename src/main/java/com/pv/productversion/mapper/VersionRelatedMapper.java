package com.pv.productversion.mapper;

import com.pv.productversion.entity.VersionRelated;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VersionRelatedMapper {

    int deleteByPrimaryKey(Long id);

    int insert(VersionRelated record);

    int insertSelective(VersionRelated record);

    VersionRelated selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(VersionRelated record);

    int updateByPrimaryKey(VersionRelated record);

    List<VersionRelated> selectByCondition(@Param("versionId") Long versionId);

    List<VersionRelated> treeRelated();
    List<VersionRelated> getChildren(Long id,List<VersionRelated> allRelated);
    List<VersionRelated> selectByVersionId(@Param("versionId") Long versionId,@Param("parentId")Long parentId);
    //用这个↓
    List<VersionRelated> selectByParent(@Param("parentId")Long parentId);
    //List<VersionRelated> selectById(@Param("versionId") Long versionId);
    List<VersionRelated> find(@Param("versionId") Long versionId);

    Long findId (@Param("versionId") Long versionId,@Param("parentId")Long parentId);
}