package com.katzan.spring.furnituretest.repository;

import com.katzan.spring.furnituretest.model.FurnitureCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = FurnitureCategory.class)
public interface FurnitureCategoryRepository {
}
