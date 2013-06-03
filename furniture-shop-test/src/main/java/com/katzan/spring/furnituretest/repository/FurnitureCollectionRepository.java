package com.katzan.spring.furnituretest.repository;

import com.katzan.spring.furnituretest.model.FurnitureCollection;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = FurnitureCollection.class)
public interface FurnitureCollectionRepository {
}
