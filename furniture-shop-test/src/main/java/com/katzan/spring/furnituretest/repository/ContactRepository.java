package com.katzan.spring.furnituretest.repository;

import com.katzan.spring.furnituretest.model.Contact;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Contact.class)
public interface ContactRepository {
}
