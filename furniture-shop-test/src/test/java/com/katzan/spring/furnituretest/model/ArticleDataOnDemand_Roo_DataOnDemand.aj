// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katzan.spring.furnituretest.model;

import com.katzan.spring.furnituretest.model.Article;
import com.katzan.spring.furnituretest.model.ArticleDataOnDemand;
import com.katzan.spring.furnituretest.repository.ArticleRepository;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ArticleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ArticleDataOnDemand: @Component;
    
    private Random ArticleDataOnDemand.rnd = new SecureRandom();
    
    private List<Article> ArticleDataOnDemand.data;
    
    @Autowired
    ArticleRepository ArticleDataOnDemand.articleRepository;
    
    public Article ArticleDataOnDemand.getNewTransientArticle(int index) {
        Article obj = new Article();
        setArticleText(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void ArticleDataOnDemand.setArticleText(Article obj, int index) {
        String articleText = "articleText_" + index;
        obj.setArticleText(articleText);
    }
    
    public void ArticleDataOnDemand.setName(Article obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public Article ArticleDataOnDemand.getSpecificArticle(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Article obj = data.get(index);
        Long id = obj.getId();
        return articleRepository.findOne(id);
    }
    
    public Article ArticleDataOnDemand.getRandomArticle() {
        init();
        Article obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return articleRepository.findOne(id);
    }
    
    public boolean ArticleDataOnDemand.modifyArticle(Article obj) {
        return false;
    }
    
    public void ArticleDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = articleRepository.findAll(new org.springframework.data.domain.PageRequest(from / to, to)).getContent();
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Article' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Article>();
        for (int i = 0; i < 10; i++) {
            Article obj = getNewTransientArticle(i);
            try {
                articleRepository.save(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            articleRepository.flush();
            data.add(obj);
        }
    }
    
}
