package com.pv.productversion.entity;

import java.util.Date;
import java.util.List;

public class Version {
    private Long id;

    private String versionName;

    private String versionCode;

    private Date createTime;

    private String url;

    private String fileName;

    private Long productId;

    private Long parentId;

    private Boolean isDelete = false;

    private Boolean isCheck = false;

    private List<Version> children;

    private Product product;

    public VersionLabel getLabel() {
        return label;
    }

    public void setLabel(VersionLabel label) {
        this.label = label;
    }

    private VersionLabel label;
    public Boolean getIsCheck() {
        return isCheck;
    }

    public void setIsCheck(Boolean isCheck) {
        this.isCheck = isCheck;
    }

    public List<Version> getChildren() {
        return children;
    }

    public void setChildren(List<Version> children) {
        this.children = children;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getVersionName() {
        return versionName;
    }

    public void setVersionName(String versionName) {
        this.versionName = versionName == null ? null : versionName.trim();
    }

    public String getVersionCode() {
        return versionCode;
    }

    public void setVersionCode(String versionCode) {
        this.versionCode = versionCode == null ? null : versionCode.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Boolean getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }

    @Override
    public String toString() {
        return "Version: [id=" + id +
                ",versionName=" + versionName +
                ",versionCode=" + versionCode +
                ",createTime=" + createTime +
                ",url=" + url +
                ",fileName=" + fileName +
                ",productId=" + productId +
                ",parentId=" + parentId +
                ",isDelete=" + isDelete +
                ",relaters=" + children + "]";
    }
}