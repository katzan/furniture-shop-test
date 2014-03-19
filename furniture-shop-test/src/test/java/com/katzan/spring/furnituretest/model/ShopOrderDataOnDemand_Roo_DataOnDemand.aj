// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katzan.spring.furnituretest.model;

import com.katzan.spring.furnituretest.model.Address;
import com.katzan.spring.furnituretest.model.ShopOrder;
import com.katzan.spring.furnituretest.model.ShopOrderDataOnDemand;
import com.katzan.spring.furnituretest.model.UserAccountDataOnDemand;
import com.katzan.spring.furnituretest.repository.ShopOrderRepository;
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

privileged aspect ShopOrderDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ShopOrderDataOnDemand: @Component;
    
    private Random ShopOrderDataOnDemand.rnd = new SecureRandom();
    
    private List<ShopOrder> ShopOrderDataOnDemand.data;
    
    @Autowired
    UserAccountDataOnDemand ShopOrderDataOnDemand.userAccountDataOnDemand;
    
    @Autowired
    ShopOrderRepository ShopOrderDataOnDemand.shopOrderRepository;
    
    public ShopOrder ShopOrderDataOnDemand.getNewTransientShopOrder(int index) {
        ShopOrder obj = new ShopOrder();
        setShippingAddress(obj, index);
        setBillingSameAsShipping(obj, index);
        setComments(obj, index);
        setDeliveryDate(obj, index);
        setOrderDate(obj, index);
        setTotalOrderPrice(obj, index);
        return obj;
    }
    
    public void ShopOrderDataOnDemand.setShippingAddress(ShopOrder obj, int index) {
        Address embeddedClass = new Address();
        setShippingAddressStreet(embeddedClass, index);
        setShippingAddressHouseNumber(embeddedClass, index);
        setShippingAddressBoxNumber(embeddedClass, index);
        setShippingAddressCity(embeddedClass, index);
        setShippingAddressPostalCode(embeddedClass, index);
        setShippingAddressCountry(embeddedClass, index);
        obj.setShippingAddress(embeddedClass);
    }
    
    public void ShopOrderDataOnDemand.setShippingAddressStreet(Address obj, int index) {
        String street = "street_" + index;
        obj.setStreet(street);
    }
    
    public void ShopOrderDataOnDemand.setShippingAddressHouseNumber(Address obj, int index) {
        String houseNumber = "houseNumber_" + index;
        obj.setHouseNumber(houseNumber);
    }
    
    public void ShopOrderDataOnDemand.setShippingAddressBoxNumber(Address obj, int index) {
        String boxNumber = "boxNumber_" + index;
        obj.setBoxNumber(boxNumber);
    }
    
    public void ShopOrderDataOnDemand.setShippingAddressCity(Address obj, int index) {
        String city = "city_" + index;
        obj.setCity(city);
    }
    
    public void ShopOrderDataOnDemand.setShippingAddressPostalCode(Address obj, int index) {
        String postalCode = "postalCode_" + index;
        obj.setPostalCode(postalCode);
    }
    
    public void ShopOrderDataOnDemand.setShippingAddressCountry(Address obj, int index) {
        String country = "country_" + index;
        obj.setCountry(country);
    }
    
    public void ShopOrderDataOnDemand.setBillingSameAsShipping(ShopOrder obj, int index) {
        Boolean billingSameAsShipping = true;
        obj.setBillingSameAsShipping(billingSameAsShipping);
    }
    
    public void ShopOrderDataOnDemand.setComments(ShopOrder obj, int index) {
        String comments = "comments_" + index;
        obj.setComments(comments);
    }
    
    public void ShopOrderDataOnDemand.setDeliveryDate(ShopOrder obj, int index) {
        Date deliveryDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDeliveryDate(deliveryDate);
    }
    
    public void ShopOrderDataOnDemand.setOrderDate(ShopOrder obj, int index) {
        Date orderDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setOrderDate(orderDate);
    }
    
    public void ShopOrderDataOnDemand.setTotalOrderPrice(ShopOrder obj, int index) {
        Double totalOrderPrice = new Integer(index).doubleValue();
        obj.setTotalOrderPrice(totalOrderPrice);
    }
    
    public ShopOrder ShopOrderDataOnDemand.getSpecificShopOrder(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ShopOrder obj = data.get(index);
        Long id = obj.getId();
        return shopOrderRepository.findOne(id);
    }
    
    public ShopOrder ShopOrderDataOnDemand.getRandomShopOrder() {
        init();
        ShopOrder obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return shopOrderRepository.findOne(id);
    }
    
    public boolean ShopOrderDataOnDemand.modifyShopOrder(ShopOrder obj) {
        return false;
    }
    
    public void ShopOrderDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = shopOrderRepository.findAll(new org.springframework.data.domain.PageRequest(from / to, to)).getContent();
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ShopOrder' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ShopOrder>();
        for (int i = 0; i < 10; i++) {
            ShopOrder obj = getNewTransientShopOrder(i);
            try {
                shopOrderRepository.save(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            shopOrderRepository.flush();
            data.add(obj);
        }
    }
    
}
