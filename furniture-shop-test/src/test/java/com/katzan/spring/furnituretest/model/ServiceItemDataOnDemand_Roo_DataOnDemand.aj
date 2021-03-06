// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katzan.spring.furnituretest.model;

import com.katzan.spring.furnituretest.model.ServiceItem;
import com.katzan.spring.furnituretest.model.ServiceItemDataOnDemand;
import com.katzan.spring.furnituretest.repository.ServiceItemRepository;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ServiceItemDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ServiceItemDataOnDemand: @Component;
    
    private Random ServiceItemDataOnDemand.rnd = new SecureRandom();
    
    private List<ServiceItem> ServiceItemDataOnDemand.data;
    
    @Autowired
    ServiceItemRepository ServiceItemDataOnDemand.serviceItemRepository;
    
    public ServiceItem ServiceItemDataOnDemand.getNewTransientServiceItem(int index) {
        ServiceItem obj = new ServiceItem();
        setDescription(obj, index);
        setName(obj, index);
        setTitle(obj, index);
        return obj;
    }
    
    public void ServiceItemDataOnDemand.setDescription(ServiceItem obj, int index) {
        String description = "description_" + index;
        if (description.length() > 1500) {
            description = description.substring(0, 1500);
        }
        obj.setDescription(description);
    }
    
    public void ServiceItemDataOnDemand.setName(ServiceItem obj, int index) {
        String name = "name_" + index;
        if (name.length() > 200) {
            name = name.substring(0, 200);
        }
        obj.setName(name);
    }
    
    public void ServiceItemDataOnDemand.setTitle(ServiceItem obj, int index) {
        String title = "title_" + index;
        if (title.length() > 200) {
            title = title.substring(0, 200);
        }
        obj.setTitle(title);
    }
    
    public ServiceItem ServiceItemDataOnDemand.getSpecificServiceItem(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ServiceItem obj = data.get(index);
        Long id = obj.getId();
        return serviceItemRepository.findOne(id);
    }
    
    public ServiceItem ServiceItemDataOnDemand.getRandomServiceItem() {
        init();
        ServiceItem obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return serviceItemRepository.findOne(id);
    }
    
    public boolean ServiceItemDataOnDemand.modifyServiceItem(ServiceItem obj) {
        return false;
    }
    
    public void ServiceItemDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = serviceItemRepository.findAll(new org.springframework.data.domain.PageRequest(from / to, to)).getContent();
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ServiceItem' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ServiceItem>();
        for (int i = 0; i < 10; i++) {
            ServiceItem obj = getNewTransientServiceItem(i);
            try {
                serviceItemRepository.save(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            serviceItemRepository.flush();
            data.add(obj);
        }
    }
    
}
