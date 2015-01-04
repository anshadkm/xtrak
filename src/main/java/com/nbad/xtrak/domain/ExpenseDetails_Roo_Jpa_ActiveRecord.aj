// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nbad.xtrak.domain;

import com.nbad.xtrak.domain.ExpenseDetails;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ExpenseDetails_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ExpenseDetails.entityManager;
    
    public static final List<String> ExpenseDetails.fieldNames4OrderClauseFilter = java.util.Arrays.asList("expense", "paidFor", "cost");
    
    public static final EntityManager ExpenseDetails.entityManager() {
        EntityManager em = new ExpenseDetails().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ExpenseDetails.countExpenseDetailses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ExpenseDetails o", Long.class).getSingleResult();
    }
    
    public static List<ExpenseDetails> ExpenseDetails.findAllExpenseDetailses() {
        return entityManager().createQuery("SELECT o FROM ExpenseDetails o", ExpenseDetails.class).getResultList();
    }
    
    public static List<ExpenseDetails> ExpenseDetails.findAllExpenseDetailses(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ExpenseDetails o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ExpenseDetails.class).getResultList();
    }
    
    public static ExpenseDetails ExpenseDetails.findExpenseDetails(Long id) {
        if (id == null) return null;
        return entityManager().find(ExpenseDetails.class, id);
    }
    
    public static List<ExpenseDetails> ExpenseDetails.findExpenseDetailsEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ExpenseDetails o", ExpenseDetails.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<ExpenseDetails> ExpenseDetails.findExpenseDetailsEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ExpenseDetails o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ExpenseDetails.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ExpenseDetails.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ExpenseDetails.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ExpenseDetails attached = ExpenseDetails.findExpenseDetails(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ExpenseDetails.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ExpenseDetails.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ExpenseDetails ExpenseDetails.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ExpenseDetails merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}