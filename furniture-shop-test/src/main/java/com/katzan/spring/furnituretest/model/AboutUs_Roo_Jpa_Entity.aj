// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katzan.spring.furnituretest.model;

import com.katzan.spring.furnituretest.model.AboutUs;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect AboutUs_Roo_Jpa_Entity {
    
    declare @type: AboutUs: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long AboutUs.id;
    
    @Version
    @Column(name = "version")
    private Integer AboutUs.version;
    
    public Long AboutUs.getId() {
        return this.id;
    }
    
    public void AboutUs.setId(Long id) {
        this.id = id;
    }
    
    public Integer AboutUs.getVersion() {
        return this.version;
    }
    
    public void AboutUs.setVersion(Integer version) {
        this.version = version;
    }
    
}