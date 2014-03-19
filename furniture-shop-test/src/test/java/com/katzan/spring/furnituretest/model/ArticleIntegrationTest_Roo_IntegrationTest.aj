// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katzan.spring.furnituretest.model;

import com.katzan.spring.furnituretest.model.ArticleDataOnDemand;
import com.katzan.spring.furnituretest.model.ArticleIntegrationTest;
import com.katzan.spring.furnituretest.repository.ArticleRepository;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ArticleIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ArticleIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ArticleIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ArticleIntegrationTest: @Transactional;
    
    @Autowired
    ArticleDataOnDemand ArticleIntegrationTest.dod;
    
    @Autowired
    ArticleRepository ArticleIntegrationTest.articleRepository;
    
    @Test
    public void ArticleIntegrationTest.testCount() {
        Assert.assertNotNull("Data on demand for 'Article' failed to initialize correctly", dod.getRandomArticle());
        long count = articleRepository.count();
        Assert.assertTrue("Counter for 'Article' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ArticleIntegrationTest.testFind() {
        Article obj = dod.getRandomArticle();
        Assert.assertNotNull("Data on demand for 'Article' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Article' failed to provide an identifier", id);
        obj = articleRepository.findOne(id);
        Assert.assertNotNull("Find method for 'Article' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Article' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ArticleIntegrationTest.testFindAll() {
        Assert.assertNotNull("Data on demand for 'Article' failed to initialize correctly", dod.getRandomArticle());
        long count = articleRepository.count();
        Assert.assertTrue("Too expensive to perform a find all test for 'Article', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Article> result = articleRepository.findAll();
        Assert.assertNotNull("Find all method for 'Article' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Article' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ArticleIntegrationTest.testFindEntries() {
        Assert.assertNotNull("Data on demand for 'Article' failed to initialize correctly", dod.getRandomArticle());
        long count = articleRepository.count();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Article> result = articleRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
        Assert.assertNotNull("Find entries method for 'Article' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Article' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ArticleIntegrationTest.testFlush() {
        Article obj = dod.getRandomArticle();
        Assert.assertNotNull("Data on demand for 'Article' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Article' failed to provide an identifier", id);
        obj = articleRepository.findOne(id);
        Assert.assertNotNull("Find method for 'Article' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyArticle(obj);
        Integer currentVersion = obj.getVersion();
        articleRepository.flush();
        Assert.assertTrue("Version for 'Article' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ArticleIntegrationTest.testSaveUpdate() {
        Article obj = dod.getRandomArticle();
        Assert.assertNotNull("Data on demand for 'Article' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Article' failed to provide an identifier", id);
        obj = articleRepository.findOne(id);
        boolean modified =  dod.modifyArticle(obj);
        Integer currentVersion = obj.getVersion();
        Article merged = articleRepository.save(obj);
        articleRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Article' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ArticleIntegrationTest.testSave() {
        Assert.assertNotNull("Data on demand for 'Article' failed to initialize correctly", dod.getRandomArticle());
        Article obj = dod.getNewTransientArticle(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Article' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Article' identifier to be null", obj.getId());
        try {
            articleRepository.save(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        articleRepository.flush();
        Assert.assertNotNull("Expected 'Article' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ArticleIntegrationTest.testDelete() {
        Article obj = dod.getRandomArticle();
        Assert.assertNotNull("Data on demand for 'Article' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Article' failed to provide an identifier", id);
        obj = articleRepository.findOne(id);
        articleRepository.delete(obj);
        articleRepository.flush();
        Assert.assertNull("Failed to remove 'Article' with identifier '" + id + "'", articleRepository.findOne(id));
    }
    
}
