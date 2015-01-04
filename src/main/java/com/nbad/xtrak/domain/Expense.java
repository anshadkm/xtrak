package com.nbad.xtrak.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findExpensesByPaidBy" })
public class Expense {

    /**
     */
    @NotNull
    @ManyToOne
    private Login paidBy;

    /**
     */
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date xpDate;

    /**
     */
    @NotNull
    @ManyToOne
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
    
    public void get() {
    	entityManager.createQuery("SELECT e.totalCost, COUNT(t) FROM Expense e GROUP BY d.name");
    }
}
