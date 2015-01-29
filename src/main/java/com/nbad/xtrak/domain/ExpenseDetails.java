package com.nbad.xtrak.domain;
import java.util.List;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Query;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ExpenseDetails {

    /**
     */
    @NotNull
    @ManyToOne(fetch = FetchType.EAGER)
    private Expense expense;

    /**
     */
    @NotNull
    @ManyToOne
    private Login paidFor;

    /**
     */
    @NotNull
    private Double cost;
    
    public static List<Object[]> getMonthWiseTotalAmount() {
    	Query query = Expense.entityManager().createQuery("SELECT l.id, MONTH(e.xpDate) as td, SUM(o.cost) FROM ExpenseDetails AS o JOIN o.paidFor AS l JOIN o.expense AS e GROUP BY l.id, MONTH(e.xpDate) ORDER BY td");
    	List<Object[]> listExpected = query.getResultList();
        return listExpected;
    }
}
