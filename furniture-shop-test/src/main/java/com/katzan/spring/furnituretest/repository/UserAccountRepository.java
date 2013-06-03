package com.katzan.spring.furnituretest.repository;

import com.katzan.spring.furnituretest.model.UserAccount;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = UserAccount.class)
public interface UserAccountRepository {
}
