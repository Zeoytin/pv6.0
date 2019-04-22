package com.pv.productversion.service;

import com.pv.productversion.entity.Description;
import com.pv.productversion.entity.Type;

import java.util.List;

public interface DescriptionService {
    //增加
    int insert(Description description);

    //删除
    int delete(Long id);

    //修改
    int update(Description description);

    //根据id查描述
    Description getDescriptionById(Long id);

    //查询版本的描述信息
    List<Description> listDescription(Long versionId, String type, int pageSize, int pageNumber);

    //计数
    int count(Long versionId, String type);

    //查询描述信息的类型
    List<Type> typeList();
    int count();

    int addType(Type type);

    int updateType(Type type);

    int delType(Long id);
}
