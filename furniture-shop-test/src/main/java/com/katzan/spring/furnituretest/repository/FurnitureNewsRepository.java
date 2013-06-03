package com.katzan.spring.furnituretest.repository;

import com.katzan.spring.furnituretest.model.FurnitureNews;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = FurnitureNews.class)
public interface FurnitureNewsRepository {
}
