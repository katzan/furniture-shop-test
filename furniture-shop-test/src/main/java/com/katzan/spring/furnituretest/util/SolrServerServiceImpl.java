package com.katzan.spring.furnituretest.util;

import org.apache.solr.client.solrj.SolrServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.stereotype.Component;

@Component
@RooJavaBean
@RooToString
public class SolrServerServiceImpl {

	@Autowired
	SolrServer solrServer;
	
	String serverURL;
}
