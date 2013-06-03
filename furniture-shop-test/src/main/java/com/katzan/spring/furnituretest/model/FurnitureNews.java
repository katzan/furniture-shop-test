package com.katzan.spring.furnituretest.model;

import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity
public class FurnitureNews {

	@Size(max=200)
    private String newsName;

	@Size(max=1500)
    private String newsText;
    
	@Size(max=200)
    private String newsTitle;
}
