package com.nbad.xtrak.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ItemType {

    /**
     */
    @NotNull
    private String itemCode;

    /**
     */
    @NotNull
    private String itemDescription;
}
