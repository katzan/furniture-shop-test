package com.katzan.spring.furnituretest.converter;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.katzan.spring.furnituretest.model.Address;


public class AddressConverter implements Converter<Address, String> {

	@Override
	public String convert(Address source) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(source.getCity()+","+source.getStreet()+", "+
		source.getHouseNumber()+", "+source.getBoxNumber()+", "+
		source.getPostalCode());
		return buffer.toString();
	}



}
