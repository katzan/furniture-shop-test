// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katzan.spring.furnituretest.repository;

import com.katzan.spring.furnituretest.model.Article;
import com.katzan.spring.furnituretest.repository.ArticleRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect ArticleRepository_Roo_Jpa_Repository {
    
    declare parents: ArticleRepository extends JpaRepository<Article, Long>;
    
    declare parents: ArticleRepository extends JpaSpecificationExecutor<Article>;
    
    declare @type: ArticleRepository: @Repository;
    
}
