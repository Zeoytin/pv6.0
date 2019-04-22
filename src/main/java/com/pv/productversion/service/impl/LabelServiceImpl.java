package com.pv.productversion.service.impl;

import com.pv.productversion.entity.Label;
import com.pv.productversion.entity.VersionLabel;
import com.pv.productversion.mapper.LabelMapper;
import com.pv.productversion.mapper.VersionLabelMapper;
import com.pv.productversion.service.LabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class LabelServiceImpl implements LabelService {
    @Autowired
    private LabelMapper labelMapper;
    @Autowired
    private VersionLabelMapper versionLabelMapper;
    @Override
    public int insert(Label label) {
        return labelMapper.insertSelective(label);
    }

    @Override
    public int delete(Long id) {
        return labelMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(Label label) {
        return labelMapper.updateByPrimaryKeySelective(label);
    }

    @Override
    public Label getLabelById(Long id) {
        return labelMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Label> allLabel() {
        return labelMapper.allLabel();
    }

    @Override
    public int count() {
        return labelMapper.count();
    }

    @Override
    public int addLabel(VersionLabel versionLabel) {
        return versionLabelMapper.insertSelective(versionLabel);
    }

    @Override
    public int deleteLabel(Long id) {
        return versionLabelMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateLabel(VersionLabel versionLabel) {
        return versionLabelMapper.updateByPrimaryKeySelective(versionLabel);
    }

    @Override
    public VersionLabel getLabel(Long versionId) {
        return versionLabelMapper.getLabel(versionId);
    }

    @Override
    public int delVersionLabel(Long versionId) {
        return versionLabelMapper.delVersionLabel(versionId);
    }

    @Override
    public int modifyLabel(Long versionId, String label) {
        return versionLabelMapper.modifyLabel(versionId,label);
    }
}
