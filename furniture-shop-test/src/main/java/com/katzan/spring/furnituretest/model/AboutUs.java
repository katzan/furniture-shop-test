package com.katzan.spring.furnituretest.model;
/**
 * Just a simple comment
 */
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity
public class AboutUs {

	@Size(max=200)
    private String name;
	
	@Size(max=200)
    private String title;
	
	@Size(max=1500)
    private String description;
}
