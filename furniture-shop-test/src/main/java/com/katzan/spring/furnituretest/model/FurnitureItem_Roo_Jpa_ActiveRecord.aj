// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katzan.spring.furnituretest.model;

import com.katzan.spring.furnituretest.model.FurnitureItem;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect FurnitureItem_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager FurnitureItem.entityManager;
    
    public static final EntityManager FurnitureItem.entityManager() {
        EntityManager em = new FurnitureItem().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long FurnitureItem.countFurnitureItems() {
        return entityManager().createQuery("SELECT COUNT(o) FROM FurnitureItem o", Long.class).getSingleResult();
    }
    
    public static List<FurnitureItem> FurnitureItem.findAllFurnitureItems() {
        return entityManager().createQuery("SELECT o FROM FurnitureItem o", FurnitureItem.class).getResultList();
    }
    
    public static FurnitureItem FurnitureItem.findFurnitureItem(Long id) {
        if (id == null) return null;
        return entityManager().find(FurnitureItem.class, id);
    }
    
    public static List<FurnitureItem> FurnitureItem.findFurnitureItemEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM FurnitureItem o", FurnitureItem.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void FurnitureItem.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void FurnitureItem.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            FurnitureItem attached = FurnitureItem.findFurnitureItem(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void FurnitureItem.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void FurnitureItem.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public FurnitureItem FurnitureItem.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        FurnitureItem merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}