// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katzan.spring.furnituretest.model;

import com.katzan.spring.furnituretest.model.Contact;
import com.katzan.spring.furnituretest.model.ContactDataOnDemand;
import com.katzan.spring.furnituretest.repository.ContactRepository;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ContactDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ContactDataOnDemand: @Component;
    
    private Random ContactDataOnDemand.rnd = new SecureRandom();
    
    private List<Contact> ContactDataOnDemand.data;
    
    @Autowired
    ContactRepository ContactDataOnDemand.contactRepository;
    
    public Contact ContactDataOnDemand.getNewTransientContact(int index) {
        Contact obj = new Contact();
        setDescription(obj, index);
        setName(obj, index);
        setTitle(obj, index);
        return obj;
    }
    
    public void ContactDataOnDemand.setDescription(Contact obj, int index) {
        String description = "description_" + index;
        if (description.length() > 1500) {
            description = description.substring(0, 1500);
        }
        obj.setDescription(description);
    }
    
    public void ContactDataOnDemand.setName(Contact obj, int index) {
        String name = "name_" + index;
        if (name.length() > 200) {
            name = name.substring(0, 200);
        }
        obj.setName(name);
    }
    
    public void ContactDataOnDemand.setTitle(Contact obj, int index) {
        String title = "title_" + index;
        if (title.length() > 200) {
            title = title.substring(0, 200);
        }
        obj.setTitle(title);
    }
    
    public Contact ContactDataOnDemand.getSpecificContact(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Contact obj = data.get(index);
        Long id = obj.getId();
        return contactRepository.findOne(id);
    }
    
    public Contact ContactDataOnDemand.getRandomContact() {
        init();
        Contact obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return contactRepository.findOne(id);
    }
    
    public boolean ContactDataOnDemand.modifyContact(Contact obj) {
        return false;
    }
    
    public void ContactDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = contactRepository.findAll(new org.springframework.data.domain.PageRequest(from / to, to)).getContent();
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Contact' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Contact>();
        for (int i = 0; i < 10; i++) {
            Contact obj = getNewTransientContact(i);
            try {
                contactRepository.save(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            contactRepository.flush();
            data.add(obj);
        }
    }
    
}
