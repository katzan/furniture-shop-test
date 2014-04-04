package com.katzan.spring.furnituretest.model;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;
import javax.persistence.*;
import javax.validation.constraints.Size;

import com.katzan.spring.furnituretest.util.Translit;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.solr.RooSolrSearchable;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@RooJavaBean
@RooToString
@RooJpaEntity
//@RooSolrSearchable
public class FurnitureCollection {

    @Size(max=100)
    private String virtualPath;

	@Size(max=200)
    private String collectionName;
	
	@Size(max=1000)
    private String collectionDescription;

	@Size(max=200)
    private String metaDescription;

	@Size(max=200)
    private String metaTitle;

	@Size(max=200)
    private String metaKeywords;

    private double collectionPrice;

    private Boolean inStock;
    
    //Small image block
    private String smallImageFile; // added
    private long smallImageSize; //added 
    @Transient
    private CommonsMultipartFile smallFile; // added
    
    // save file to disk ,save filename , file size to database 
     public void setSmallFile(CommonsMultipartFile smallFile) {
      if (smallFile!=null&&smallFile.getSize()>0) {
    	  
        this.smallFile = smallFile;
        SimpleDateFormat dateFormat = new SimpleDateFormat("ddMMyy");
        Date curDate = new Date();
        String dateString = dateFormat.format(curDate);
        this.smallImageFile = "fcolsm"+dateString+ smallFile.getOriginalFilename();
        this.smallImageSize = smallFile.getSize();
        System.out.println(" hehe  this.fileName: " + this.smallImageFile + " ,  "
             + smallFile.getClass().getName()+". File content type: "+smallFile.getContentType());

        try {
            InputStream in = smallFile.getInputStream();
            FileOutputStream f = new FileOutputStream("/home/alex/webapps/ROOT/img/"
              + this.getSmallImageFile() ); ///"/Users/alexander/Documents/STSProjects/furniture-shop-front-test/img/"

            int ch = 0;
            while ((ch = in.read()) != -1) {
                f.write(ch);
            }
            f.flush();
            f.close();
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
     }
  }
     
     //Large image block
     private String largeImageFile; // added
     private long largeImageSize; //added 
     @Transient
     private CommonsMultipartFile largeFile; // added
     
     // save file to disk ,save filename , file size to database 
      public void setLargeFile(CommonsMultipartFile largeFile) {
         if (largeFile!=null&&largeFile.getSize()>0) {
            this.largeFile = largeFile;
            SimpleDateFormat dateFormat = new SimpleDateFormat("ddMMyy");
            Date curDate = new Date();
            String dateString = dateFormat.format(curDate);
            this.largeImageFile = "fcolla"+dateString+ largeFile.getOriginalFilename();
            this.largeImageSize = largeFile.getSize();
            System.out.println(" hehe  this.fileName: " + this.largeImageFile + " ,  "
                + largeFile.getClass().getName());

            try {
                InputStream in = largeFile.getInputStream();
                FileOutputStream f = new FileOutputStream("/home/alex/webapps/ROOT/img/"
                  +this.getLargeImageFile() ); ///"/Users/alexander/Documents/STSProjects/furniture-shop-front-test/img/"

                int ch = 0;
                while ((ch = in.read()) != -1) {
                    f.write(ch);
                }
                f.flush();
                f.close();
            } catch (FileNotFoundException e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
            } catch (IOException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
         } 
      }
   }
    
   // @ManyToMany(fetch=FetchType.EAGER)
   // private Set<Big>bigs;
    
    @ManyToMany(fetch=FetchType.EAGER)
    private Set<ImageFile>imageFiles;
    
    @ManyToMany(fetch=FetchType.EAGER)
    private Set<FurnitureCategory>furnitureCategories;
    
    @ManyToMany(mappedBy="furnitureCollections")
    private Set<FurnitureItem>furnitureItems;
    
    

	public String toString() {
		return this.collectionName;
        //return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

    @PreUpdate
    @PrePersist
    private void prePersistOrUpdate() {
        if(this.virtualPath==null||this.virtualPath.trim().length()==0) {
            this.virtualPath = Translit.getLatinStringWithUnderscore(this.collectionName);
        }
    }
}
