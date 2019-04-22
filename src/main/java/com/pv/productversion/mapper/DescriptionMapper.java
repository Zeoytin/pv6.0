package com.pv.productversion.mapper;

import com.pv.productversion.entity.Description;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DescriptionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Description record);

    int insertSelective(Description record);

    Description selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Description record);

    int updateByPrimaryKey(Description record);

    List<Description> listDescription(@Param("versionId") Long versionId, @Param("type")String type, @Param("limit")int pageSize, @Param("beginNumber")int pageNumber);

    int count(@Param("versionId") Long versionId,@Param("type")String type);

}