package com.nbad.xtrak.domain;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;

@RooJavaBean
@RooJpaActiveRecord
public class Login {

    /**
     */
    @NotNull
    @Column(unique = true)
    private String username;

    /**
     */
    @NotNull
    private String password;

    /**
     */
    private Boolean active;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date lastLogin;

    @Override
    public String toString() {
        return String.valueOf(username);
    }

    /**
     */
    private String role;
}
