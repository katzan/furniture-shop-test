package com.katzan.spring.furnituretest.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.Valid;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;



@RooJavaBean
@RooToString
@RooJpaEntity
public class ShopOrder {
	
	public ShopOrder() {
		this.orderDate = new Date();
	}
	
   /** private String street;
    private String houseNumber;
    private String boxNumber;

    
    
    private String city;
    private String postalCode;

    
   
    private String country; **/
	
   @Embedded
    private Address shippingAddress; 
    
    private boolean billingSameAsShipping = true;
    
    @ManyToOne
    @Valid
    private UserAccount account;
    
    private Date orderDate;
    private Date deliveryDate;
    private String comments;

    private Double totalOrderPrice;
    
    @JoinColumn(name = "order_id")
    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    private final List<ShopOrderDetail> orderDetails = new ArrayList<ShopOrderDetail>();
    
    public void addOrderDetail(ShopOrderDetail detail) {
        if (this.orderDetails.add(detail)) {
            if (this.totalOrderPrice == null) {
                this.totalOrderPrice = detail.getPrice();
            } else {
                this.totalOrderPrice = this.totalOrderPrice + detail.getPrice();
            }
        }
    }
    
    /**
     * Update the order details and update the total price. If the quantity is 0 or less the order detail is removed from the list.
     */
    public void updateOrderDetails() {
        Double total = new Double(0);
        Iterator<ShopOrderDetail> details = this.orderDetails.iterator();
        while (details.hasNext()) {
            ShopOrderDetail detail = details.next();
            if (detail.getQuantity() <= 0) {
                details.remove();
            } else {
                total = total + detail.getPrice();

            }
        }
        //total.setScale(2, RoundingMode.HALF_UP);
        this.totalOrderPrice = total;
    }
    

}
