// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katzan.spring.furnituretest.model;

import com.katzan.spring.furnituretest.model.ImageFile;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect ImageFile_Roo_Jpa_Entity {
    
    declare @type: ImageFile: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long ImageFile.id;
    
    @Version
    @Column(name = "version")
    private Integer ImageFile.version;
    
    public Long ImageFile.getId() {
        return this.id;
    }
    
    public void ImageFile.setId(Long id) {
        this.id = id;
    }
    
    public Integer ImageFile.getVersion() {
        return this.version;
    }
    
    public void ImageFile.setVersion(Integer version) {
        this.version = version;
    }
    
}
