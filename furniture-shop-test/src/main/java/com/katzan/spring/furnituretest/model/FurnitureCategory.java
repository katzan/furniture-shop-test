package com.katzan.spring.furnituretest.model;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@RooJavaBean
@RooToString
@RooJpaEntity
public class FurnitureCategory {

    @Size(max=200)
	private String categoryName;

    @Size(max=1000)
    private String categoryDescription;
    
    @Size(max=1000)
    private String metaDescription;

    @Size(max=200)
    private String metaTitle;

    @Size(max=200)
    private String metaKeywords;
    
   // @ManyToMany(fetch=FetchType.EAGER)
   // private Set<Big>bigs;
    
    @ManyToMany(fetch=FetchType.EAGER)
    private Set<ImageFile>imageFiles;
    @ManyToMany(mappedBy="furnitureCategories")
    private Set<FurnitureCollection>furnitureCollections;
    
    @ManyToMany(mappedBy="furnitureCategories")
    private Set<FurnitureItem>furnitureItems;
    
    private String smallImageFile;

    private long smallImageSize;

    @Transient
    private CommonsMultipartFile smallFile;

    private String largeImageFile;

    private long largeImageSize;

    @Transient
    private CommonsMultipartFile largeFile;
    
    public void setSmallFile(CommonsMultipartFile smallFile) {
    	//System.out.println("Path to server images is: "+ this.getServerPathString() );
        if (smallFile != null && smallFile.getSize() > 0) {
            this.smallFile = smallFile;
            SimpleDateFormat dateFormat = new SimpleDateFormat("ddMMyy");
            Date curDate = new Date();
            String dateString = dateFormat.format(curDate);
            this.smallImageFile = "catsm" + dateString + smallFile.getOriginalFilename();
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
            Date curDate = new Date();
            String dateString = dateFormat.format(curDate);
            this.largeImageFile = "catla" + dateString + largeFile.getOriginalFilename();
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
}
