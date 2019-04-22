package com.pv.productversion.service;

import com.pv.productversion.entity.Label;
import com.pv.productversion.entity.VersionLabel;

import java.util.List;

public interface LabelService {
    //增加标签
    int insert(Label label);

    //删除标签
    int delete(Long id);

    //修改标签
    int update(Label label);

    //根据id查询
    Label getLabelById(Long id);

    //列出所有标签
    List<Label> allLabel();

    int count();

    //给版本增加标签
    int addLabel(VersionLabel versionLabel);

    //给版本删除标签
    int deleteLabel(Long id);

    //给版本修改标签
    int updateLabel(VersionLabel versionLabel);

    //根据版本id查标签
    VersionLabel getLabel(Long versionId);

    int delVersionLabel(Long versionId);

    int modifyLabel(Long versionId, String label);

}
