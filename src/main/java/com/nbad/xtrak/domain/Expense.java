package com.nbad.xtrak.domain;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Query;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Tuple;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findExpensesByPaidBy" })
public class Expense {

    /**
     */
    @NotNull
    @ManyToOne(fetch=FetchType.EAGER)
    private Login paidBy;

    /**
     */
    @NotNull
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date xpDate;

    /**
     */
    @NotNull
    @ManyToOne(fetch=FetchType.EAGER)
    private ItemType itemType;

    /**
     */
    private String remarks;

    /**
     */
    @NotNull
    private Double totalCost;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL)
    private Set<ExpenseDetails> expenseDetails = new HashSet<ExpenseDetails>();
    
    public static List<Object[]> getMonthWiseTotalCost() {
    	
        //Query query = Expense.entityManager().createQuery("SELECT SUM(o.totalCost), MONTH(o.xpDate) FROM Expense AS o GROUP BY MONTH(o.xpDate)");
    	Query query = Expense.entityManager().createQuery("SELECT l.id, MONTH(o.xpDate) as td, SUM(o.totalCost)  FROM Expense AS o JOIN o.paidBy l GROUP BY  l.id, MONTH(o.xpDate) ORDER BY td");
        //query.setParameter("paidBy", paidBy);
    	List<Object[]> listExpected = query.getResultList();
        return listExpected;
    }
    
}
