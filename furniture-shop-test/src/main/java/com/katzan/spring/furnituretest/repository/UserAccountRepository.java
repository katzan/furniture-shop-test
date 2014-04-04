package com.katzan.spring.furnituretest.repository;

import com.katzan.spring.furnituretest.model.UserAccount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import java.util.List;

@RooJpaRepository(domainType = UserAccount.class)
public interface UserAccountRepository {
}
