package com.nbad.xtrak.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import java.util.Date;
import java.util.List;

import javax.persistence.Query;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Payments {

    /**
     */
    @NotNull
    @ManyToOne
    private Login paidBy;

    /**
     */
    @NotNull
    @ManyToOne
    private Login paidTo;

    /**
     */
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date paidDate;

    /**
     */
    @NotNull
    private Double amount;
    
    public static List<Object[]> getMonthWiseSettledAmount() {
    	Query query = Expense.entityManager().createQuery("SELECT l.id, MONTH(o.paidDate) as td, SUM(o.amount) FROM Payments AS o JOIN o.paidBy AS l GROUP BY l.id, MONTH(o.paidDate) ORDER BY td");
    	List<Object[]> listExpected = query.getResultList();
        return listExpected;
    }
}
