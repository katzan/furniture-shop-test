package com.katzan.spring.furnituretest.repository;

import com.katzan.spring.furnituretest.model.AboutUs;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = AboutUs.class)
public interface AboutUsRepository {
}
