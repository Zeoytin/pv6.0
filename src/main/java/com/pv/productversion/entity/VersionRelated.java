package com.pv.productversion.entity;

import java.util.List;

public class VersionRelated {
    private Long id;

    private Long versionId;

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    private Long parentId;//新增的父id

    public Version getVersion() {
        return version;
    }

    public void setVersion(Version version) {
        this.version = version;
    }

    private Version version;
    private  Product product;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public List<VersionRelated> getChildren() {
        return children;
    }

    public void setChildren(List<VersionRelated> children) {
        this.children = children;
    }

    private List<VersionRelated> children;
@Override
public String toString(){
    return "VersionRelated["+
            "id="+id+
            "versionId"+versionId+
            "parentId="+parentId+
            "children="+children+"]";
}
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getVersionId() {
        return versionId;
    }

    public void setVersionId(Long versionId) {
        this.versionId = versionId;
    }

}