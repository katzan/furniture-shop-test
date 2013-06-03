package com.katzan.spring.furnituretest.repository;

import com.katzan.spring.furnituretest.model.Article;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Article.class)
public interface ArticleRepository {
}
