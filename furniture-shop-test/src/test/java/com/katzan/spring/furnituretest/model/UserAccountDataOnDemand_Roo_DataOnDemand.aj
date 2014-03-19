// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katzan.spring.furnituretest.model;

import com.katzan.spring.furnituretest.model.Address;
import com.katzan.spring.furnituretest.model.UserAccount;
import com.katzan.spring.furnituretest.model.UserAccountDataOnDemand;
import com.katzan.spring.furnituretest.repository.UserAccountRepository;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect UserAccountDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UserAccountDataOnDemand: @Component;
    
    private Random UserAccountDataOnDemand.rnd = new SecureRandom();
    
    private List<UserAccount> UserAccountDataOnDemand.data;
    
    @Autowired
    UserAccountRepository UserAccountDataOnDemand.userAccountRepository;
    
    public UserAccount UserAccountDataOnDemand.getNewTransientUserAccount(int index) {
        UserAccount obj = new UserAccount();
        setAddress(obj, index);
        setDateOfBirth(obj, index);
        setEmailAddress(obj, index);
        setFirstName(obj, index);
        setLastName(obj, index);
        setPassword(obj, index);
        setPhoneNumber(obj, index);
        setUsername(obj, index);
        return obj;
    }
    
    public void UserAccountDataOnDemand.setAddress(UserAccount obj, int index) {
        Address embeddedClass = new Address();
        setAddressStreet(embeddedClass, index);
        setAddressHouseNumber(embeddedClass, index);
        setAddressBoxNumber(embeddedClass, index);
        setAddressCity(embeddedClass, index);
        setAddressPostalCode(embeddedClass, index);
        setAddressCountry(embeddedClass, index);
        obj.setAddress(embeddedClass);
    }
    
    public void UserAccountDataOnDemand.setAddressStreet(Address obj, int index) {
        String street = "street_" + index;
        obj.setStreet(street);
    }
    
    public void UserAccountDataOnDemand.setAddressHouseNumber(Address obj, int index) {
        String houseNumber = "houseNumber_" + index;
        obj.setHouseNumber(houseNumber);
    }
    
    public void UserAccountDataOnDemand.setAddressBoxNumber(Address obj, int index) {
        String boxNumber = "boxNumber_" + index;
        obj.setBoxNumber(boxNumber);
    }
    
    public void UserAccountDataOnDemand.setAddressCity(Address obj, int index) {
        String city = "city_" + index;
        obj.setCity(city);
    }
    
    public void UserAccountDataOnDemand.setAddressPostalCode(Address obj, int index) {
        String postalCode = "postalCode_" + index;
        obj.setPostalCode(postalCode);
    }
    
    public void UserAccountDataOnDemand.setAddressCountry(Address obj, int index) {
        String country = "country_" + index;
        obj.setCountry(country);
    }
    
    public void UserAccountDataOnDemand.setDateOfBirth(UserAccount obj, int index) {
        Date dateOfBirth = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDateOfBirth(dateOfBirth);
    }
    
    public void UserAccountDataOnDemand.setEmailAddress(UserAccount obj, int index) {
        String emailAddress = "foo" + index + "@bar.com";
        obj.setEmailAddress(emailAddress);
    }
    
    public void UserAccountDataOnDemand.setFirstName(UserAccount obj, int index) {
        String firstName = "firstName_" + index;
        obj.setFirstName(firstName);
    }
    
    public void UserAccountDataOnDemand.setLastName(UserAccount obj, int index) {
        String lastName = "lastName_" + index;
        obj.setLastName(lastName);
    }
    
    public void UserAccountDataOnDemand.setPassword(UserAccount obj, int index) {
        String password = "password_" + index;
        obj.setPassword(password);
    }
    
    public void UserAccountDataOnDemand.setPhoneNumber(UserAccount obj, int index) {
        String phoneNumber = "phoneNumber_" + index;
        obj.setPhoneNumber(phoneNumber);
    }
    
    public void UserAccountDataOnDemand.setUsername(UserAccount obj, int index) {
        String username = "username_" + index;
        obj.setUsername(username);
    }
    
    public UserAccount UserAccountDataOnDemand.getSpecificUserAccount(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        UserAccount obj = data.get(index);
        Long id = obj.getId();
        return userAccountRepository.findOne(id);
    }
    
    public UserAccount UserAccountDataOnDemand.getRandomUserAccount() {
        init();
        UserAccount obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return userAccountRepository.findOne(id);
    }
    
    public boolean UserAccountDataOnDemand.modifyUserAccount(UserAccount obj) {
        return false;
    }
    
    public void UserAccountDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = userAccountRepository.findAll(new org.springframework.data.domain.PageRequest(from / to, to)).getContent();
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'UserAccount' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<UserAccount>();
        for (int i = 0; i < 10; i++) {
            UserAccount obj = getNewTransientUserAccount(i);
            try {
                userAccountRepository.save(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            userAccountRepository.flush();
            data.add(obj);
        }
    }
    
}
