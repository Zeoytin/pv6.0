package com.pv.productversion.mapper;

import com.pv.productversion.entity.VersionLabel;
import org.apache.ibatis.annotations.Param;

public interface VersionLabelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(VersionLabel record);

    int insertSelective(VersionLabel record);

    VersionLabel selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(VersionLabel record);

    int updateByPrimaryKey(VersionLabel record);

    VersionLabel getLabel(@Param("versionId") Long versionId);

    int delVersionLabel(@Param("versionId") Long versionId);

    int modifyLabel(Long versionId,String label);
}