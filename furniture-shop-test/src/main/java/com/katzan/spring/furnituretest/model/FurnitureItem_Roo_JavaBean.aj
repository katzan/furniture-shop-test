// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katzan.spring.furnituretest.model;

import com.katzan.spring.furnituretest.model.FurnitureCategory;
import com.katzan.spring.furnituretest.model.FurnitureCollection;
import com.katzan.spring.furnituretest.model.FurnitureItem;
import com.katzan.spring.furnituretest.model.ImageFile;
import java.util.Set;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

privileged aspect FurnitureItem_Roo_JavaBean {
    
    public String FurnitureItem.getServerPathString() {
        return this.serverPathString;
    }
    
    public void FurnitureItem.setServerPathString(String serverPathString) {
        this.serverPathString = serverPathString;
    }
    
    public String FurnitureItem.getVirtualPath() {
        return this.virtualPath;
    }
    
    public void FurnitureItem.setVirtualPath(String virtualPath) {
        this.virtualPath = virtualPath;
    }
    
    public String FurnitureItem.getItemName() {
        return this.itemName;
    }
    
    public void FurnitureItem.setItemName(String itemName) {
        this.itemName = itemName;
    }
    
    public String FurnitureItem.getCodeNumber() {
        return this.codeNumber;
    }
    
    public void FurnitureItem.setCodeNumber(String codeNumber) {
        this.codeNumber = codeNumber;
    }
    
    public String FurnitureItem.getDimensions() {
        return this.dimensions;
    }
    
    public void FurnitureItem.setDimensions(String dimensions) {
        this.dimensions = dimensions;
    }
    
    public String FurnitureItem.getMaterials() {
        return this.materials;
    }
    
    public void FurnitureItem.setMaterials(String materials) {
        this.materials = materials;
    }
    
    public String FurnitureItem.getItemDescription() {
        return this.itemDescription;
    }
    
    public void FurnitureItem.setItemDescription(String itemDescription) {
        this.itemDescription = itemDescription;
    }
    
    public String FurnitureItem.getMetaDescription() {
        return this.metaDescription;
    }
    
    public void FurnitureItem.setMetaDescription(String metaDescription) {
        this.metaDescription = metaDescription;
    }
    
    public String FurnitureItem.getMetaTitle() {
        return this.metaTitle;
    }
    
    public void FurnitureItem.setMetaTitle(String metaTitle) {
        this.metaTitle = metaTitle;
    }
    
    public String FurnitureItem.getMetaKeywords() {
        return this.metaKeywords;
    }
    
    public void FurnitureItem.setMetaKeywords(String metaKeywords) {
        this.metaKeywords = metaKeywords;
    }
    
    public double FurnitureItem.getItemPrice() {
        return this.itemPrice;
    }
    
    public void FurnitureItem.setItemPrice(double itemPrice) {
        this.itemPrice = itemPrice;
    }
    
    public Boolean FurnitureItem.getInStock() {
        return this.inStock;
    }
    
    public void FurnitureItem.setInStock(Boolean inStock) {
        this.inStock = inStock;
    }
    
    public Boolean FurnitureItem.getShowOnFirstPage() {
        return this.showOnFirstPage;
    }
    
    public void FurnitureItem.setShowOnFirstPage(Boolean showOnFirstPage) {
        this.showOnFirstPage = showOnFirstPage;
    }
    
    public int FurnitureItem.getListNumber() {
        return this.listNumber;
    }
    
    public void FurnitureItem.setListNumber(int listNumber) {
        this.listNumber = listNumber;
    }
    
    public String FurnitureItem.getSmallImageFile() {
        return this.smallImageFile;
    }
    
    public void FurnitureItem.setSmallImageFile(String smallImageFile) {
        this.smallImageFile = smallImageFile;
    }
    
    public long FurnitureItem.getSmallImageSize() {
        return this.smallImageSize;
    }
    
    public void FurnitureItem.setSmallImageSize(long smallImageSize) {
        this.smallImageSize = smallImageSize;
    }
    
    public CommonsMultipartFile FurnitureItem.getSmallFile() {
        return this.smallFile;
    }
    
    public String FurnitureItem.getLargeImageFile() {
        return this.largeImageFile;
    }
    
    public void FurnitureItem.setLargeImageFile(String largeImageFile) {
        this.largeImageFile = largeImageFile;
    }
    
    public long FurnitureItem.getLargeImageSize() {
        return this.largeImageSize;
    }
    
    public void FurnitureItem.setLargeImageSize(long largeImageSize) {
        this.largeImageSize = largeImageSize;
    }
    
    public CommonsMultipartFile FurnitureItem.getLargeFile() {
        return this.largeFile;
    }
    
    public Set<ImageFile> FurnitureItem.getImageFiles() {
        return this.imageFiles;
    }
    
    public void FurnitureItem.setImageFiles(Set<ImageFile> imageFiles) {
        this.imageFiles = imageFiles;
    }
    
    public Set<FurnitureCategory> FurnitureItem.getFurnitureCategories() {
        return this.furnitureCategories;
    }
    
    public void FurnitureItem.setFurnitureCategories(Set<FurnitureCategory> furnitureCategories) {
        this.furnitureCategories = furnitureCategories;
    }
    
    public Set<FurnitureCollection> FurnitureItem.getFurnitureCollections() {
        return this.furnitureCollections;
    }
    
    public void FurnitureItem.setFurnitureCollections(Set<FurnitureCollection> furnitureCollections) {
        this.furnitureCollections = furnitureCollections;
    }
    
}
