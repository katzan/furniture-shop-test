package com.katzan.spring.furnituretest.repository;

import com.katzan.spring.furnituretest.model.FurnitureItem;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = FurnitureItem.class)
public interface FurnitureItemRepository {
}
