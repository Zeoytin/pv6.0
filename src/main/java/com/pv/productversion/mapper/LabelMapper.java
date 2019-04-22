package com.pv.productversion.mapper;

import com.pv.productversion.entity.Label;

import java.util.List;

public interface LabelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Label record);

    int insertSelective(Label record);

    Label selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Label record);

    int updateByPrimaryKey(Label record);

    List<Label> allLabel();

    int count();
}