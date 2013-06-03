package com.katzan.spring.furnituretest.repository;

import com.katzan.spring.furnituretest.model.ShopOrder;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = ShopOrder.class)
public interface ShopOrderRepository {
}
