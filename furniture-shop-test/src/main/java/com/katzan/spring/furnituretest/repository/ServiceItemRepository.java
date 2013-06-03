package com.katzan.spring.furnituretest.repository;

import com.katzan.spring.furnituretest.model.ServiceItem;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = ServiceItem.class)
public interface ServiceItemRepository {
}
