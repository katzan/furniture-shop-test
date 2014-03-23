// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katzan.spring.furnituretest.model;

import com.katzan.spring.furnituretest.model.FurnitureCategory;
import com.katzan.spring.furnituretest.model.FurnitureCategoryDataOnDemand;
import com.katzan.spring.furnituretest.repository.FurnitureCategoryRepository;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

privileged aspect FurnitureCategoryDataOnDemand_Roo_DataOnDemand {
    
    declare @type: FurnitureCategoryDataOnDemand: @Component;
    
    private Random FurnitureCategoryDataOnDemand.rnd = new SecureRandom();
    
    private List<FurnitureCategory> FurnitureCategoryDataOnDemand.data;
    
    @Autowired
    FurnitureCategoryRepository FurnitureCategoryDataOnDemand.furnitureCategoryRepository;
    
    public FurnitureCategory FurnitureCategoryDataOnDemand.getNewTransientFurnitureCategory(int index) {
        FurnitureCategory obj = new FurnitureCategory();
        setCategoryDescription(obj, index);
        setCategoryName(obj, index);
        setLargeFile(obj, index);
        setLargeImageFile(obj, index);
        setLargeImageSize(obj, index);
        setMetaDescription(obj, index);
        setMetaKeywords(obj, index);
        setMetaTitle(obj, index);
        setSmallFile(obj, index);
        setSmallImageFile(obj, index);
        setSmallImageSize(obj, index);
        setVirtualPath(obj, index);
        return obj;
    }
    
    public void FurnitureCategoryDataOnDemand.setCategoryDescription(FurnitureCategory obj, int index) {
        String categoryDescription = "categoryDescription_" + index;
        if (categoryDescription.length() > 1000) {
            categoryDescription = categoryDescription.substring(0, 1000);
        }
        obj.setCategoryDescription(categoryDescription);
    }
    
    public void FurnitureCategoryDataOnDemand.setCategoryName(FurnitureCategory obj, int index) {
        String categoryName = "categoryName_" + index;
        if (categoryName.length() > 200) {
            categoryName = categoryName.substring(0, 200);
        }
        obj.setCategoryName(categoryName);
    }
    
    public void FurnitureCategoryDataOnDemand.setLargeFile(FurnitureCategory obj, int index) {
        CommonsMultipartFile largeFile = null;
        obj.setLargeFile(largeFile);
    }
    
    public void FurnitureCategoryDataOnDemand.setLargeImageFile(FurnitureCategory obj, int index) {
        String largeImageFile = "largeImageFile_" + index;
        obj.setLargeImageFile(largeImageFile);
    }
    
    public void FurnitureCategoryDataOnDemand.setLargeImageSize(FurnitureCategory obj, int index) {
        Long largeImageSize = new Integer(index).longValue();
        obj.setLargeImageSize(largeImageSize);
    }
    
    public void FurnitureCategoryDataOnDemand.setMetaDescription(FurnitureCategory obj, int index) {
        String metaDescription = "metaDescription_" + index;
        if (metaDescription.length() > 1000) {
            metaDescription = metaDescription.substring(0, 1000);
        }
        obj.setMetaDescription(metaDescription);
    }
    
    public void FurnitureCategoryDataOnDemand.setMetaKeywords(FurnitureCategory obj, int index) {
        String metaKeywords = "metaKeywords_" + index;
        if (metaKeywords.length() > 200) {
            metaKeywords = metaKeywords.substring(0, 200);
        }
        obj.setMetaKeywords(metaKeywords);
    }
    
    public void FurnitureCategoryDataOnDemand.setMetaTitle(FurnitureCategory obj, int index) {
        String metaTitle = "metaTitle_" + index;
        if (metaTitle.length() > 200) {
            metaTitle = metaTitle.substring(0, 200);
        }
        obj.setMetaTitle(metaTitle);
    }
    
    public void FurnitureCategoryDataOnDemand.setSmallFile(FurnitureCategory obj, int index) {
        CommonsMultipartFile smallFile = null;
        obj.setSmallFile(smallFile);
    }
    
    public void FurnitureCategoryDataOnDemand.setSmallImageFile(FurnitureCategory obj, int index) {
        String smallImageFile = "smallImageFile_" + index;
        obj.setSmallImageFile(smallImageFile);
    }
    
    public void FurnitureCategoryDataOnDemand.setSmallImageSize(FurnitureCategory obj, int index) {
        Long smallImageSize = new Integer(index).longValue();
        obj.setSmallImageSize(smallImageSize);
    }
    
    public void FurnitureCategoryDataOnDemand.setVirtualPath(FurnitureCategory obj, int index) {
        String virtualPath = "virtualPath_" + index;
        if (virtualPath.length() > 100) {
            virtualPath = virtualPath.substring(0, 100);
        }
        obj.setVirtualPath(virtualPath);
    }
    
    public FurnitureCategory FurnitureCategoryDataOnDemand.getSpecificFurnitureCategory(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        FurnitureCategory obj = data.get(index);
        Long id = obj.getId();
        return furnitureCategoryRepository.findOne(id);
    }
    
    public FurnitureCategory FurnitureCategoryDataOnDemand.getRandomFurnitureCategory() {
        init();
        FurnitureCategory obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return furnitureCategoryRepository.findOne(id);
    }
    
    public boolean FurnitureCategoryDataOnDemand.modifyFurnitureCategory(FurnitureCategory obj) {
        return false;
    }
    
    public void FurnitureCategoryDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = furnitureCategoryRepository.findAll(new org.springframework.data.domain.PageRequest(from / to, to)).getContent();
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'FurnitureCategory' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<FurnitureCategory>();
        for (int i = 0; i < 10; i++) {
            FurnitureCategory obj = getNewTransientFurnitureCategory(i);
            try {
                furnitureCategoryRepository.save(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            furnitureCategoryRepository.flush();
            data.add(obj);
        }
    }
    
}
