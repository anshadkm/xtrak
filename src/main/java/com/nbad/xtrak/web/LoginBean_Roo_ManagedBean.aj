// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nbad.xtrak.web;

import com.nbad.xtrak.domain.Login;
import com.nbad.xtrak.web.LoginBean;
import com.nbad.xtrak.web.util.MessageFactory;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import javax.faces.convert.DateTimeConverter;
import org.primefaces.component.calendar.Calendar;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.message.Message;
import org.primefaces.component.outputlabel.OutputLabel;
import org.primefaces.component.selectbooleancheckbox.SelectBooleanCheckbox;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;

privileged aspect LoginBean_Roo_ManagedBean {
    
    declare @type: LoginBean: @ManagedBean(name = "loginBean");
    
    declare @type: LoginBean: @SessionScoped;
    
    private String LoginBean.name = "Logins";
    
    private Login LoginBean.login;
    
    private List<Login> LoginBean.allLogins;
    
    private boolean LoginBean.dataVisible = false;
    
    private List<String> LoginBean.columns;
    
    private HtmlPanelGrid LoginBean.createPanelGrid;
    
    private HtmlPanelGrid LoginBean.editPanelGrid;
    
    private HtmlPanelGrid LoginBean.viewPanelGrid;
    
    private boolean LoginBean.createDialogVisible = false;
    
    @PostConstruct
    public void LoginBean.init() {
        columns = new ArrayList<String>();
        columns.add("username");
        columns.add("password");
        columns.add("lastLogin");
    }
    
    public String LoginBean.getName() {
        return name;
    }
    
    public List<String> LoginBean.getColumns() {
        return columns;
    }
    
    public List<Login> LoginBean.getAllLogins() {
        return allLogins;
    }
    
    public void LoginBean.setAllLogins(List<Login> allLogins) {
        this.allLogins = allLogins;
    }
    
    public String LoginBean.findAllLogins() {
        allLogins = Login.findAllLogins();
        dataVisible = !allLogins.isEmpty();
        return null;
    }
    
    public boolean LoginBean.isDataVisible() {
        return dataVisible;
    }
    
    public void LoginBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid LoginBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void LoginBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid LoginBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void LoginBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid LoginBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void LoginBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid LoginBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel usernameCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        usernameCreateOutput.setFor("usernameCreateInput");
        usernameCreateOutput.setId("usernameCreateOutput");
        usernameCreateOutput.setValue("Username:");
        htmlPanelGrid.getChildren().add(usernameCreateOutput);
        
        InputText usernameCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        usernameCreateInput.setId("usernameCreateInput");
        usernameCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{loginBean.login.username}", String.class));
        usernameCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(usernameCreateInput);
        
        Message usernameCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        usernameCreateInputMessage.setId("usernameCreateInputMessage");
        usernameCreateInputMessage.setFor("usernameCreateInput");
        usernameCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(usernameCreateInputMessage);
        
        OutputLabel passwordCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        passwordCreateOutput.setFor("passwordCreateInput");
        passwordCreateOutput.setId("passwordCreateOutput");
        passwordCreateOutput.setValue("Password:");
        htmlPanelGrid.getChildren().add(passwordCreateOutput);
        
        InputText passwordCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        passwordCreateInput.setId("passwordCreateInput");
        passwordCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{loginBean.login.password}", String.class));
        passwordCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(passwordCreateInput);
        
        Message passwordCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        passwordCreateInputMessage.setId("passwordCreateInputMessage");
        passwordCreateInputMessage.setFor("passwordCreateInput");
        passwordCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(passwordCreateInputMessage);
        
        OutputLabel activeCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        activeCreateOutput.setFor("activeCreateInput");
        activeCreateOutput.setId("activeCreateOutput");
        activeCreateOutput.setValue("Active:");
        htmlPanelGrid.getChildren().add(activeCreateOutput);
        
        SelectBooleanCheckbox activeCreateInput = (SelectBooleanCheckbox) application.createComponent(SelectBooleanCheckbox.COMPONENT_TYPE);
        activeCreateInput.setId("activeCreateInput");
        activeCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{loginBean.login.active}", Boolean.class));
        activeCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(activeCreateInput);
        
        Message activeCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        activeCreateInputMessage.setId("activeCreateInputMessage");
        activeCreateInputMessage.setFor("activeCreateInput");
        activeCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(activeCreateInputMessage);
        
        OutputLabel lastLoginCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        lastLoginCreateOutput.setFor("lastLoginCreateInput");
        lastLoginCreateOutput.setId("lastLoginCreateOutput");
        lastLoginCreateOutput.setValue("Last Login:");
        htmlPanelGrid.getChildren().add(lastLoginCreateOutput);
        
        Calendar lastLoginCreateInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        lastLoginCreateInput.setId("lastLoginCreateInput");
        lastLoginCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{loginBean.login.lastLogin}", Date.class));
        lastLoginCreateInput.setNavigator(true);
        lastLoginCreateInput.setEffect("slideDown");
        lastLoginCreateInput.setPattern("dd/MM/yyyy");
        lastLoginCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(lastLoginCreateInput);
        
        Message lastLoginCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        lastLoginCreateInputMessage.setId("lastLoginCreateInputMessage");
        lastLoginCreateInputMessage.setFor("lastLoginCreateInput");
        lastLoginCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(lastLoginCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid LoginBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel usernameEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        usernameEditOutput.setFor("usernameEditInput");
        usernameEditOutput.setId("usernameEditOutput");
        usernameEditOutput.setValue("Username:");
        htmlPanelGrid.getChildren().add(usernameEditOutput);
        
        InputText usernameEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        usernameEditInput.setId("usernameEditInput");
        usernameEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{loginBean.login.username}", String.class));
        usernameEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(usernameEditInput);
        
        Message usernameEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        usernameEditInputMessage.setId("usernameEditInputMessage");
        usernameEditInputMessage.setFor("usernameEditInput");
        usernameEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(usernameEditInputMessage);
        
        OutputLabel passwordEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        passwordEditOutput.setFor("passwordEditInput");
        passwordEditOutput.setId("passwordEditOutput");
        passwordEditOutput.setValue("Password:");
        htmlPanelGrid.getChildren().add(passwordEditOutput);
        
        InputText passwordEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        passwordEditInput.setId("passwordEditInput");
        passwordEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{loginBean.login.password}", String.class));
        passwordEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(passwordEditInput);
        
        Message passwordEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        passwordEditInputMessage.setId("passwordEditInputMessage");
        passwordEditInputMessage.setFor("passwordEditInput");
        passwordEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(passwordEditInputMessage);
        
        OutputLabel activeEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        activeEditOutput.setFor("activeEditInput");
        activeEditOutput.setId("activeEditOutput");
        activeEditOutput.setValue("Active:");
        htmlPanelGrid.getChildren().add(activeEditOutput);
        
        SelectBooleanCheckbox activeEditInput = (SelectBooleanCheckbox) application.createComponent(SelectBooleanCheckbox.COMPONENT_TYPE);
        activeEditInput.setId("activeEditInput");
        activeEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{loginBean.login.active}", Boolean.class));
        activeEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(activeEditInput);
        
        Message activeEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        activeEditInputMessage.setId("activeEditInputMessage");
        activeEditInputMessage.setFor("activeEditInput");
        activeEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(activeEditInputMessage);
        
        OutputLabel lastLoginEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        lastLoginEditOutput.setFor("lastLoginEditInput");
        lastLoginEditOutput.setId("lastLoginEditOutput");
        lastLoginEditOutput.setValue("Last Login:");
        htmlPanelGrid.getChildren().add(lastLoginEditOutput);
        
        Calendar lastLoginEditInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        lastLoginEditInput.setId("lastLoginEditInput");
        lastLoginEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{loginBean.login.lastLogin}", Date.class));
        lastLoginEditInput.setNavigator(true);
        lastLoginEditInput.setEffect("slideDown");
        lastLoginEditInput.setPattern("dd/MM/yyyy");
        lastLoginEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(lastLoginEditInput);
        
        Message lastLoginEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        lastLoginEditInputMessage.setId("lastLoginEditInputMessage");
        lastLoginEditInputMessage.setFor("lastLoginEditInput");
        lastLoginEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(lastLoginEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid LoginBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText usernameLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        usernameLabel.setId("usernameLabel");
        usernameLabel.setValue("Username:");
        htmlPanelGrid.getChildren().add(usernameLabel);
        
        HtmlOutputText usernameValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        usernameValue.setId("usernameValue");
        usernameValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{loginBean.login.username}", String.class));
        htmlPanelGrid.getChildren().add(usernameValue);
        
        HtmlOutputText passwordLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        passwordLabel.setId("passwordLabel");
        passwordLabel.setValue("Password:");
        htmlPanelGrid.getChildren().add(passwordLabel);
        
        HtmlOutputText passwordValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        passwordValue.setId("passwordValue");
        passwordValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{loginBean.login.password}", String.class));
        htmlPanelGrid.getChildren().add(passwordValue);
        
        HtmlOutputText activeLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        activeLabel.setId("activeLabel");
        activeLabel.setValue("Active:");
        htmlPanelGrid.getChildren().add(activeLabel);
        
        HtmlOutputText activeValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        activeValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{loginBean.login.active}", String.class));
        htmlPanelGrid.getChildren().add(activeValue);
        
        HtmlOutputText lastLoginLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        lastLoginLabel.setId("lastLoginLabel");
        lastLoginLabel.setValue("Last Login:");
        htmlPanelGrid.getChildren().add(lastLoginLabel);
        
        HtmlOutputText lastLoginValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        lastLoginValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{loginBean.login.lastLogin}", Date.class));
        DateTimeConverter lastLoginValueConverter = (DateTimeConverter) application.createConverter(DateTimeConverter.CONVERTER_ID);
        lastLoginValueConverter.setPattern("dd/MM/yyyy");
        lastLoginValue.setConverter(lastLoginValueConverter);
        htmlPanelGrid.getChildren().add(lastLoginValue);
        
        return htmlPanelGrid;
    }
    
    public Login LoginBean.getLogin() {
        if (login == null) {
            login = new Login();
        }
        return login;
    }
    
    public void LoginBean.setLogin(Login login) {
        this.login = login;
    }
    
    public String LoginBean.onEdit() {
        return null;
    }
    
    public boolean LoginBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void LoginBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String LoginBean.displayList() {
        createDialogVisible = false;
        findAllLogins();
        return "login";
    }
    
    public String LoginBean.displayCreateDialog() {
        login = new Login();
        createDialogVisible = true;
        return "login";
    }
    
    public String LoginBean.persist() {
        String message = "";
        if (login.getId() != null) {
            login.merge();
            message = "message_successfully_updated";
        } else {
            login.persist();
            message = "message_successfully_created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialogWidget.hide()");
        context.execute("editDialogWidget.hide()");
        
        FacesMessage facesMessage = MessageFactory.getMessage(message, "Login");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllLogins();
    }
    
    public String LoginBean.delete() {
        login.remove();
        FacesMessage facesMessage = MessageFactory.getMessage("message_successfully_deleted", "Login");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllLogins();
    }
    
    public void LoginBean.reset() {
        login = null;
        createDialogVisible = false;
    }
    
    public void LoginBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}
