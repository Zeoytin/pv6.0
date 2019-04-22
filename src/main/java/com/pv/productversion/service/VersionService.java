package com.pv.productversion.service;

import com.pv.productversion.entity.Version;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface VersionService {
    //给产品增加新版本
    int insert(Version version);

    //查看当前版本信息
    Version getVersionById(Long id);

    //修改当前版本信息
    int update(Version version);

    //删除版本信息
    int delete(Long id);

    //根据产品id查最新版本
    Version getLatestVersion(Long productId);
    //获取非树形版本号
    List<Version> versionList(Long productId);
    //获取树形版本号
    Map<String, Object> treeVersion(Long productId);

    List<Version> getChild(Long versionId, List<Version> allVersion);

    //获取一个产品的所有子版本号
    List<Version> listChildVersion(Long productId);

    //根据版本号查版本信息描述
    List getDescription(Long versionId);

    //列出所有关联版本
    List<Version> queryRelated(Long versionId);

    //<!--删产品的同时删产品所有版本号-->
    int deleteByProduct(Long productId);
//查所有版本号
    List<Version> selectall();
    //未审核
    List<Version> allVersions(int pageSize,int pageNumber);
    int countChecked();

    int checked(@Param("id")Long id);
}
