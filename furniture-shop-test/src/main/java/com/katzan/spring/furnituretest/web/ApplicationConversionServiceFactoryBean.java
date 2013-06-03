package com.katzan.spring.furnituretest.web;


import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.converter.RooConversionService;


import com.katzan.spring.furnituretest.model.Address;
import com.katzan.spring.furnituretest.model.FurnitureCollection;
import com.katzan.spring.furnituretest.model.ShopOrderDetail;
import com.katzan.spring.furnituretest.model.UserAccount;
import com.katzan.spring.furnituretest.repository.ShopOrderDetailRepository;
import com.katzan.spring.furnituretest.repository.UserAccountRepository;

/**
 * A central place to register application converters and formatters. 
 */
@RooConversionService
public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

	@Autowired
	UserAccountRepository userAccountRepository;
	
	@Autowired
	ShopOrderDetailRepository shopOrderDetailRepository;

	
	@Override
	protected void installFormatters(FormatterRegistry registry) {
		super.installFormatters(registry);
		// Register application converters and formatters
		registry.addConverter(getAddressToStringConverter());
	}
	

	
	/**public Converter<Address, String> getAddressToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.katzan.spring.furnituretest.model.Address, java.lang.String>() {
            public String convert(Address address) {
                return new StringBuilder().append(address.getCity()).append(' ').append(address.getStreet()).append(' ').append(address.getHouseNumber()).append(' ').append(address.getBoxNumber()).toString();
            }
        };
    }**/

    public Converter<com.katzan.spring.furnituretest.model.UserAccount, java.lang.String> getUserAccountToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.katzan.spring.furnituretest.model.UserAccount, java.lang.String>() {
            public String convert(UserAccount account) {
                return new StringBuilder().append(account.getFirstName()).append(' ').append(account.getLastName()).append(' ').append(account.getEmailAddress()).append(' ').append(account.getPhoneNumber()).toString();
            }
        };
    }

    public Converter<com.katzan.spring.furnituretest.model.FurnitureCollection, java.lang.String> getFurnitureCollectionToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.katzan.spring.furnituretest.model.FurnitureCollection, java.lang.String>() {
            public String convert(FurnitureCollection collection) {
                return new StringBuilder().append(collection.getCollectionName()).append(' ').toString();
            }
        };
    }    
    
	public Converter<String, UserAccount> getStringToUserAccountConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.katzan.spring.furnituretest.model.UserAccount>() {
            public com.katzan.spring.furnituretest.model.UserAccount convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), UserAccount.class);
            }
        };
    } 

	/**public Converter<UserAccount, String> getUserAccountToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.katzan.spring.furnituretest.model.UserAccount, java.lang.String>() {
            public String convert(UserAccount userAccount) {
                return new StringBuilder().append(userAccount.getFirstName()).append(' ').append(userAccount.getLastName()).append(' ').append(userAccount.getDateOfBirth()).append(' ').append(userAccount.getEmailAddress()).toString();
            }
        };
    } **/

	public Converter<Long, UserAccount> getIdToUserAccountConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.katzan.spring.furnituretest.model.UserAccount>() {
            public com.katzan.spring.furnituretest.model.UserAccount convert(java.lang.Long id) {
                return userAccountRepository.findOne(id);
            }
        };
    }

	public Converter<ShopOrderDetail, String> getShopOrderDetailToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.katzan.spring.furnituretest.model.ShopOrderDetail, java.lang.String>() {
            public String convert(ShopOrderDetail shopOrderDetail) {
                return new StringBuilder().append(shopOrderDetail.getFurnitureItem().getItemName()).append('-').append(shopOrderDetail.getQuantity()).append('-').append(shopOrderDetail.getPrice()).append(' ').toString();
            }
        };
    }

	public Converter<Long, ShopOrderDetail> getIdToShopOrderDetailConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.katzan.spring.furnituretest.model.ShopOrderDetail>() {
            public com.katzan.spring.furnituretest.model.ShopOrderDetail convert(java.lang.Long id) {
                return shopOrderDetailRepository.findOne(id);
            }
        };
    }

	public Converter<Address, String> getAddressToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.katzan.spring.furnituretest.model.Address, java.lang.String >() {
            public String convert(Address address) {
            	return new StringBuilder().append(address.getCity()).append(' ').append(address.getStreet()).append(' ').append(address.getHouseNumber()).append(' ').append(address.getBoxNumber()).toString();
            }
        };
    }
}
