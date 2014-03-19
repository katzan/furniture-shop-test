// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katzan.spring.furnituretest.model;

import com.katzan.spring.furnituretest.model.FurnitureCollection;
import com.katzan.spring.furnituretest.model.FurnitureCollectionDataOnDemand;
import com.katzan.spring.furnituretest.repository.FurnitureCollectionRepository;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect FurnitureCollectionDataOnDemand_Roo_DataOnDemand {
    
    declare @type: FurnitureCollectionDataOnDemand: @Component;
    
    private Random FurnitureCollectionDataOnDemand.rnd = new SecureRandom();
    
    private List<FurnitureCollection> FurnitureCollectionDataOnDemand.data;
    
    @Autowired
    FurnitureCollectionRepository FurnitureCollectionDataOnDemand.furnitureCollectionRepository;
    
    public FurnitureCollection FurnitureCollectionDataOnDemand.getNewTransientFurnitureCollection(int index) {
        FurnitureCollection obj = new FurnitureCollection();
        setCollectionDescription(obj, index);
        setCollectionName(obj, index);
        setCollectionPrice(obj, index);
        setInStock(obj, index);
        setLargeImageFile(obj, index);
        setLargeImageSize(obj, index);
        setMetaDescription(obj, index);
        setMetaKeywords(obj, index);
        setMetaTitle(obj, index);
        setSmallImageFile(obj, index);
        setSmallImageSize(obj, index);
        setVirtualPath(obj, index);
        return obj;
    }
    
    public void FurnitureCollectionDataOnDemand.setCollectionDescription(FurnitureCollection obj, int index) {
        String collectionDescription = "collectionDescription_" + index;
        if (collectionDescription.length() > 1000) {
            collectionDescription = collectionDescription.substring(0, 1000);
        }
        obj.setCollectionDescription(collectionDescription);
    }
    
    public void FurnitureCollectionDataOnDemand.setCollectionName(FurnitureCollection obj, int index) {
        String collectionName = "collectionName_" + index;
        if (collectionName.length() > 200) {
            collectionName = collectionName.substring(0, 200);
        }
        obj.setCollectionName(collectionName);
    }
    
    public void FurnitureCollectionDataOnDemand.setCollectionPrice(FurnitureCollection obj, int index) {
        double collectionPrice = new Integer(index).doubleValue();
        obj.setCollectionPrice(collectionPrice);
    }
    
    public void FurnitureCollectionDataOnDemand.setInStock(FurnitureCollection obj, int index) {
        Boolean inStock = Boolean.TRUE;
        obj.setInStock(inStock);
    }
    
    public void FurnitureCollectionDataOnDemand.setLargeImageFile(FurnitureCollection obj, int index) {
        String largeImageFile = "largeImageFile_" + index;
        obj.setLargeImageFile(largeImageFile);
    }
    
    public void FurnitureCollectionDataOnDemand.setLargeImageSize(FurnitureCollection obj, int index) {
        Long largeImageSize = new Integer(index).longValue();
        obj.setLargeImageSize(largeImageSize);
    }
    
    public void FurnitureCollectionDataOnDemand.setMetaDescription(FurnitureCollection obj, int index) {
        String metaDescription = "metaDescription_" + index;
        if (metaDescription.length() > 200) {
            metaDescription = metaDescription.substring(0, 200);
        }
        obj.setMetaDescription(metaDescription);
    }
    
    public void FurnitureCollectionDataOnDemand.setMetaKeywords(FurnitureCollection obj, int index) {
        String metaKeywords = "metaKeywords_" + index;
        if (metaKeywords.length() > 200) {
            metaKeywords = metaKeywords.substring(0, 200);
        }
        obj.setMetaKeywords(metaKeywords);
    }
    
    public void FurnitureCollectionDataOnDemand.setMetaTitle(FurnitureCollection obj, int index) {
        String metaTitle = "metaTitle_" + index;
        if (metaTitle.length() > 200) {
            metaTitle = metaTitle.substring(0, 200);
        }
        obj.setMetaTitle(metaTitle);
    }
    
    public void FurnitureCollectionDataOnDemand.setSmallImageFile(FurnitureCollection obj, int index) {
        String smallImageFile = "smallImageFile_" + index;
        obj.setSmallImageFile(smallImageFile);
    }
    
    public void FurnitureCollectionDataOnDemand.setSmallImageSize(FurnitureCollection obj, int index) {
        Long smallImageSize = new Integer(index).longValue();
        obj.setSmallImageSize(smallImageSize);
    }
    
    public void FurnitureCollectionDataOnDemand.setVirtualPath(FurnitureCollection obj, int index) {
        String virtualPath = "virtualPath_" + index;
        if (virtualPath.length() > 100) {
            virtualPath = virtualPath.substring(0, 100);
        }
        obj.setVirtualPath(virtualPath);
    }
    
    public FurnitureCollection FurnitureCollectionDataOnDemand.getSpecificFurnitureCollection(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        FurnitureCollection obj = data.get(index);
        Long id = obj.getId();
        return furnitureCollectionRepository.findOne(id);
    }
    
    public FurnitureCollection FurnitureCollectionDataOnDemand.getRandomFurnitureCollection() {
        init();
        FurnitureCollection obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return furnitureCollectionRepository.findOne(id);
    }
    
    public boolean FurnitureCollectionDataOnDemand.modifyFurnitureCollection(FurnitureCollection obj) {
        return false;
    }
    
    public void FurnitureCollectionDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = furnitureCollectionRepository.findAll(new org.springframework.data.domain.PageRequest(from / to, to)).getContent();
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'FurnitureCollection' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<FurnitureCollection>();
        for (int i = 0; i < 10; i++) {
            FurnitureCollection obj = getNewTransientFurnitureCollection(i);
            try {
                furnitureCollectionRepository.save(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            furnitureCollectionRepository.flush();
            data.add(obj);
        }
    }
    
}
