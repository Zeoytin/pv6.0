package com.pv.productversion.mapper;

import com.pv.productversion.entity.Version;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VersionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Version record);

    int insertSelective(Version record);

    Version selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Version record);

    int updateByPrimaryKey(Version record);
    //<!--删产品的同时删产品所有版本号-->
    int deleteByProduct(@Param("productId") Long productId);

    Version getLatestVersion(@Param("productId") Long productId);

    List<Version> treeVersion(@Param("productId") Long productId);

    List<Version> getChild(Long versionId, List<Version> allVersion);

    int isDelete(@Param("id") Long id);

    List<Version> listChildVersion(@Param("productId") Long productId);

    List getDescription(@Param("versionId") Long versionId);

    List<Version> queryRelated(@Param("versionId") Long versionId);

    List<Version> selectall();
//未审核
    List<Version> allVersions( @Param("limit")int pageSize, @Param("beginNumber")int pageNumber);
    int countChecked();

    int checked(@Param("id")Long id);
}