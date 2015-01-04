package com.nbad.xtrak.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ExpenseDetails {

    /**
     */
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
}
