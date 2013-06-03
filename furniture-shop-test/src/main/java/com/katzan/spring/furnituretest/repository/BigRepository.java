package com.katzan.spring.furnituretest.repository;

import com.katzan.spring.furnituretest.model.Big;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Big.class)
public interface BigRepository {
}
