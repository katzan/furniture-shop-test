package com.katzan.spring.furnituretest.repository;

import com.katzan.spring.furnituretest.model.ImageFile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = ImageFile.class)
public interface ImageFileRepository  {
}
