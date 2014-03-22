package com.katzan.spring.furnituretest.model;

import com.katzan.spring.furnituretest.util.ApplicationContextProvider;
import com.katzan.spring.furnituretest.util.SolrServerServiceImpl;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
//import java.util.Map;

import javax.persistence.*;
//import javax.persistence.*;
//import java.util.*;
import javax.validation.constraints.Size;

import com.katzan.spring.furnituretest.util.Translit;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
//import org.springframework.context.event.ApplicationContextEvent;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.solr.RooSolrSearchable;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.commons.CommonsMultipartFile;








@RooJavaBean
@RooToString
@RooJpaEntity
@RooSolrSearchable
@Component("furnitureItem")
public class FurnitureItem {
	
   //@Autowired
  // transient SolrServer solrServer;// = new CommonsHttpSolrServer("http://localhost:8983/solr/collection1");

 // FurnitureItem() throws MalformedURLException { }
	  
    //@Value("#{systemProperties.IMAGE_STORAGE}") //This property is need to explored
	//@Autowired
	//@Value("ServerPath")
    @Transient
    private String serverPathString;

    @Size(max=100)
    private String virtualPath;

    @Size(max = 200)
    private String itemName;

    private String codeNumber;

    private String dimensions;

    private String materials;

    @Size(max = 1000)
    private String itemDescription;

    @Size(max = 1000)
    private String metaDescription;

    @Size(max = 200)
    private String metaTitle;

    @Size(max = 200)
    private String metaKeywords;

    private double itemPrice;

    private Boolean inStock;

    private Boolean showOnFirstPage;

    private int listNumber;

    private String smallImageFile;

    private long smallImageSize;

    @Transient
    private CommonsMultipartFile smallFile;

    private String largeImageFile;

    private long largeImageSize;

    @Transient
    private CommonsMultipartFile largeFile;

    @ManyToMany(fetch = FetchType.EAGER)
    private java.util.Set<ImageFile> imageFiles;

    @ManyToMany(fetch = FetchType.EAGER)
    private java.util.Set<FurnitureCategory> furnitureCategories;

    @ManyToMany(fetch = FetchType.EAGER)
    private java.util.Set<FurnitureCollection> furnitureCollections;

    public void setSmallFile(CommonsMultipartFile smallFile) {
    	
    	//System.out.println("Path to server images is: "+ this.getServerPathString() );
        if (smallFile != null && smallFile.getSize() > 0) {
            this.smallFile = smallFile;
            SimpleDateFormat dateFormat = new SimpleDateFormat("ddMMyy");
            java.util.Date curDate = new java.util.Date();
            String dateString = dateFormat.format(curDate);
            this.smallImageFile = "fism" + dateString + smallFile.getOriginalFilename();
            this.smallImageSize = smallFile.getSize();
            System.out.println(" hehe  this.fileName: " + this.smallImageFile + " ,  " + smallFile.getClass().getName() + ". File content type: " + smallFile.getContentType());
            try {
                InputStream in = smallFile.getInputStream();
                FileOutputStream f = new FileOutputStream("/home/alex/webapps/ROOT/img/" + this.getSmallImageFile());
                int ch = 0;
                while ((ch = in.read()) != -1) {
                    f.write(ch);
                }
                f.flush();
                f.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
   
    }

    public void setLargeFile(CommonsMultipartFile largeFile) {
        if (largeFile != null && largeFile.getSize() > 0) {
            this.largeFile = largeFile;
            SimpleDateFormat dateFormat = new SimpleDateFormat("ddMMyy");
            java.util.Date curDate = new java.util.Date();
            String dateString = dateFormat.format(curDate);
            this.largeImageFile = "fila" + dateString + largeFile.getOriginalFilename();
            this.largeImageSize = largeFile.getSize();
            System.out.println(" hehe  this.fileName: " + this.largeImageFile + " ,  " + largeFile.getClass().getName());
            try {
                InputStream in = largeFile.getInputStream();
                FileOutputStream f = new FileOutputStream("/home/alex/webapps/ROOT/img/" + this.getLargeImageFile());
                int ch = 0;
                while ((ch = in.read()) != -1) {
                    f.write(ch);
                }
                f.flush();
                f.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


  /**	public static SolrServer solrServer() {
		SolrServer _solrServer = null;
		try {
			_solrServer  = new CommonsHttpSolrServer("http://localhost:8983/solr/collection1"); //new FurnitureItem().solrServer;
		}
		catch (MalformedURLException ex) {
			System.out.println(ex.getStackTrace());
		}
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    } **/

	





	@Autowired
    transient SolrServer solrServer;
	
	//@Autowired
	//transient SolrServerServiceImpl solrServiceImpl;

	public static QueryResponse search(String queryString) {
        String searchString = "FurnitureItem_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }

	public static QueryResponse search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }

	public static void indexFurnitureItem(FurnitureItem furnitureItem) {
        List<FurnitureItem> furnitureitems = new ArrayList<FurnitureItem>();
        furnitureitems.add(furnitureItem);
        indexFurnitureItems(furnitureitems);
    }

	@Async
    public static void indexFurnitureItems(java.util.Collection<FurnitureItem> furnitureitems) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (FurnitureItem furnitureItem : furnitureitems) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "furnitureitem_" + furnitureItem.getId());
            sid.addField("name", furnitureItem.getItemName());
            sid.addField("codenumber", furnitureItem.getCodeNumber());
            sid.addField("description", furnitureItem.getItemDescription());
            sid.addField("controller", "item");
            sid.addField("item_id", furnitureItem.getId());
            sid.addField("foto", furnitureItem.smallImageFile);
            documents.add(sid);
        }
        try {
            SolrServer solrServer = solrServer();
            solrServer.add(documents);
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	@Async
    public static void deleteIndex(FurnitureItem furnitureItem) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("furnitureitem_" + furnitureItem.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @PreUpdate
    @PrePersist
    private void prePersistOrUpdate() {
        if(this.virtualPath==null||this.virtualPath.trim().length()==0) {
           this.virtualPath = Translit.getLatinStringWithUnderscore(this.itemName+"_"+this.codeNumber);
        }
    }

	@PostUpdate
    @PostPersist
    private void postPersistOrUpdate() {
        indexFurnitureItem(this);
    }


    @PreRemove
    private void preRemove() {
        deleteIndex(this);
    }
	
	public String toString() {
		return this.itemName;
	}

	public static SolrServer solrServer() {
		ApplicationContext context = ApplicationContextProvider.getApplicationContext();
		if(context==null) {
			System.out.println("Application context is null!!!");
		}
		SolrServer _solrServer = (SolrServer) context.getBean("solrServer"); 
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
}
