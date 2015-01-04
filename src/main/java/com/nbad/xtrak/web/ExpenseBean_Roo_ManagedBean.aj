// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nbad.xtrak.web;

import com.nbad.xtrak.domain.Expense;
import com.nbad.xtrak.domain.ExpenseDetails;
import com.nbad.xtrak.domain.Login;
import com.nbad.xtrak.web.ExpenseBean;
import com.nbad.xtrak.web.converter.LoginConverter;
import com.nbad.xtrak.web.util.MessageFactory;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
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
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.calendar.Calendar;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.message.Message;
import org.primefaces.component.outputlabel.OutputLabel;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;

privileged aspect ExpenseBean_Roo_ManagedBean {
    
    declare @type: ExpenseBean: @ManagedBean(name = "expenseBean");
    
    declare @type: ExpenseBean: @SessionScoped;
    
    private String ExpenseBean.name = "Expenses";
    
    private Expense ExpenseBean.expense;
    
    private List<Expense> ExpenseBean.allExpenses;
    
    private boolean ExpenseBean.dataVisible = false;
    
    private List<String> ExpenseBean.columns;
    
    private HtmlPanelGrid ExpenseBean.createPanelGrid;
    
    private HtmlPanelGrid ExpenseBean.editPanelGrid;
    
    private HtmlPanelGrid ExpenseBean.viewPanelGrid;
    
    private boolean ExpenseBean.createDialogVisible = false;
    
    private List<ExpenseDetails> ExpenseBean.selectedExpenseDetails;
    
    @PostConstruct
    public void ExpenseBean.init() {
        columns = new ArrayList<String>();
        columns.add("xpdate");
        columns.add("itemcode");
        columns.add("remarks");
        columns.add("totalCost");
    }
    
    public String ExpenseBean.getName() {
        return name;
    }
    
    public List<String> ExpenseBean.getColumns() {
        return columns;
    }
    
    public List<Expense> ExpenseBean.getAllExpenses() {
        return allExpenses;
    }
    
    public void ExpenseBean.setAllExpenses(List<Expense> allExpenses) {
        this.allExpenses = allExpenses;
    }
    
    public String ExpenseBean.findAllExpenses() {
        allExpenses = Expense.findAllExpenses();
        dataVisible = !allExpenses.isEmpty();
        return null;
    }
    
    public boolean ExpenseBean.isDataVisible() {
        return dataVisible;
    }
    
    public void ExpenseBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid ExpenseBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void ExpenseBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid ExpenseBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void ExpenseBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid ExpenseBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void ExpenseBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid ExpenseBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel paidByCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        paidByCreateOutput.setFor("paidByCreateInput");
        paidByCreateOutput.setId("paidByCreateOutput");
        paidByCreateOutput.setValue("Paid By:");
        htmlPanelGrid.getChildren().add(paidByCreateOutput);
        
        AutoComplete paidByCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        paidByCreateInput.setId("paidByCreateInput");
        paidByCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.paidBy}", Login.class));
        paidByCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{expenseBean.completePaidBy}", List.class, new Class[] { String.class }));
        paidByCreateInput.setDropdown(true);
        paidByCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "paidBy", String.class));
        paidByCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{paidBy.username}", String.class));
        paidByCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{paidBy}", Login.class));
        paidByCreateInput.setConverter(new LoginConverter());
        paidByCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(paidByCreateInput);
        
        Message paidByCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        paidByCreateInputMessage.setId("paidByCreateInputMessage");
        paidByCreateInputMessage.setFor("paidByCreateInput");
        paidByCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(paidByCreateInputMessage);
        
        OutputLabel xpdateCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        xpdateCreateOutput.setFor("xpdateCreateInput");
        xpdateCreateOutput.setId("xpdateCreateOutput");
        xpdateCreateOutput.setValue("Xpdate:");
        htmlPanelGrid.getChildren().add(xpdateCreateOutput);
        
        Calendar xpdateCreateInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        xpdateCreateInput.setId("xpdateCreateInput");
        xpdateCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.xpdate}", Date.class));
        xpdateCreateInput.setNavigator(true);
        xpdateCreateInput.setEffect("slideDown");
        xpdateCreateInput.setPattern("dd/MM/yyyy");
        xpdateCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(xpdateCreateInput);
        
        Message xpdateCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        xpdateCreateInputMessage.setId("xpdateCreateInputMessage");
        xpdateCreateInputMessage.setFor("xpdateCreateInput");
        xpdateCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(xpdateCreateInputMessage);
        
        OutputLabel itemcodeCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        itemcodeCreateOutput.setFor("itemcodeCreateInput");
        itemcodeCreateOutput.setId("itemcodeCreateOutput");
        itemcodeCreateOutput.setValue("Itemcode:");
        htmlPanelGrid.getChildren().add(itemcodeCreateOutput);
        
        InputText itemcodeCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        itemcodeCreateInput.setId("itemcodeCreateInput");
        itemcodeCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.itemcode}", String.class));
        itemcodeCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(itemcodeCreateInput);
        
        Message itemcodeCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        itemcodeCreateInputMessage.setId("itemcodeCreateInputMessage");
        itemcodeCreateInputMessage.setFor("itemcodeCreateInput");
        itemcodeCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(itemcodeCreateInputMessage);
        
        OutputLabel remarksCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        remarksCreateOutput.setFor("remarksCreateInput");
        remarksCreateOutput.setId("remarksCreateOutput");
        remarksCreateOutput.setValue("Remarks:");
        htmlPanelGrid.getChildren().add(remarksCreateOutput);
        
        InputText remarksCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        remarksCreateInput.setId("remarksCreateInput");
        remarksCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.remarks}", String.class));
        remarksCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(remarksCreateInput);
        
        Message remarksCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        remarksCreateInputMessage.setId("remarksCreateInputMessage");
        remarksCreateInputMessage.setFor("remarksCreateInput");
        remarksCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(remarksCreateInputMessage);
        
        OutputLabel totalCostCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        totalCostCreateOutput.setFor("totalCostCreateInput");
        totalCostCreateOutput.setId("totalCostCreateOutput");
        totalCostCreateOutput.setValue("Total Cost:");
        htmlPanelGrid.getChildren().add(totalCostCreateOutput);
        
        InputText totalCostCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        totalCostCreateInput.setId("totalCostCreateInput");
        totalCostCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.totalCost}", Double.class));
        totalCostCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(totalCostCreateInput);
        
        Message totalCostCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        totalCostCreateInputMessage.setId("totalCostCreateInputMessage");
        totalCostCreateInputMessage.setFor("totalCostCreateInput");
        totalCostCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(totalCostCreateInputMessage);
        
        HtmlOutputText expenseDetailsCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        expenseDetailsCreateOutput.setId("expenseDetailsCreateOutput");
        expenseDetailsCreateOutput.setValue("Expense Details:");
        htmlPanelGrid.getChildren().add(expenseDetailsCreateOutput);
        
        HtmlOutputText expenseDetailsCreateInput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        expenseDetailsCreateInput.setId("expenseDetailsCreateInput");
        expenseDetailsCreateInput.setValue("This relationship is managed from the ExpenseDetails side");
        htmlPanelGrid.getChildren().add(expenseDetailsCreateInput);
        
        Message expenseDetailsCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        expenseDetailsCreateInputMessage.setId("expenseDetailsCreateInputMessage");
        expenseDetailsCreateInputMessage.setFor("expenseDetailsCreateInput");
        expenseDetailsCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(expenseDetailsCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid ExpenseBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel paidByEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        paidByEditOutput.setFor("paidByEditInput");
        paidByEditOutput.setId("paidByEditOutput");
        paidByEditOutput.setValue("Paid By:");
        htmlPanelGrid.getChildren().add(paidByEditOutput);
        
        AutoComplete paidByEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        paidByEditInput.setId("paidByEditInput");
        paidByEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.paidBy}", Login.class));
        paidByEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{expenseBean.completePaidBy}", List.class, new Class[] { String.class }));
        paidByEditInput.setDropdown(true);
        paidByEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "paidBy", String.class));
        paidByEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{paidBy.username} #{paidBy.password} #{paidBy.lastLogin}", String.class));
        paidByEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{paidBy}", Login.class));
        paidByEditInput.setConverter(new LoginConverter());
        paidByEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(paidByEditInput);
        
        Message paidByEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        paidByEditInputMessage.setId("paidByEditInputMessage");
        paidByEditInputMessage.setFor("paidByEditInput");
        paidByEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(paidByEditInputMessage);
        
        OutputLabel xpdateEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        xpdateEditOutput.setFor("xpdateEditInput");
        xpdateEditOutput.setId("xpdateEditOutput");
        xpdateEditOutput.setValue("Xpdate:");
        htmlPanelGrid.getChildren().add(xpdateEditOutput);
        
        Calendar xpdateEditInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        xpdateEditInput.setId("xpdateEditInput");
        xpdateEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.xpdate}", Date.class));
        xpdateEditInput.setNavigator(true);
        xpdateEditInput.setEffect("slideDown");
        xpdateEditInput.setPattern("dd/MM/yyyy");
        xpdateEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(xpdateEditInput);
        
        Message xpdateEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        xpdateEditInputMessage.setId("xpdateEditInputMessage");
        xpdateEditInputMessage.setFor("xpdateEditInput");
        xpdateEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(xpdateEditInputMessage);
        
        OutputLabel itemcodeEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        itemcodeEditOutput.setFor("itemcodeEditInput");
        itemcodeEditOutput.setId("itemcodeEditOutput");
        itemcodeEditOutput.setValue("Itemcode:");
        htmlPanelGrid.getChildren().add(itemcodeEditOutput);
        
        InputText itemcodeEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        itemcodeEditInput.setId("itemcodeEditInput");
        itemcodeEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.itemcode}", String.class));
        itemcodeEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(itemcodeEditInput);
        
        Message itemcodeEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        itemcodeEditInputMessage.setId("itemcodeEditInputMessage");
        itemcodeEditInputMessage.setFor("itemcodeEditInput");
        itemcodeEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(itemcodeEditInputMessage);
        
        OutputLabel remarksEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        remarksEditOutput.setFor("remarksEditInput");
        remarksEditOutput.setId("remarksEditOutput");
        remarksEditOutput.setValue("Remarks:");
        htmlPanelGrid.getChildren().add(remarksEditOutput);
        
        InputText remarksEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        remarksEditInput.setId("remarksEditInput");
        remarksEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.remarks}", String.class));
        remarksEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(remarksEditInput);
        
        Message remarksEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        remarksEditInputMessage.setId("remarksEditInputMessage");
        remarksEditInputMessage.setFor("remarksEditInput");
        remarksEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(remarksEditInputMessage);
        
        OutputLabel totalCostEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        totalCostEditOutput.setFor("totalCostEditInput");
        totalCostEditOutput.setId("totalCostEditOutput");
        totalCostEditOutput.setValue("Total Cost:");
        htmlPanelGrid.getChildren().add(totalCostEditOutput);
        
        InputText totalCostEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        totalCostEditInput.setId("totalCostEditInput");
        totalCostEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.totalCost}", Double.class));
        totalCostEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(totalCostEditInput);
        
        Message totalCostEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        totalCostEditInputMessage.setId("totalCostEditInputMessage");
        totalCostEditInputMessage.setFor("totalCostEditInput");
        totalCostEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(totalCostEditInputMessage);
        
        HtmlOutputText expenseDetailsEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        expenseDetailsEditOutput.setId("expenseDetailsEditOutput");
        expenseDetailsEditOutput.setValue("Expense Details:");
        htmlPanelGrid.getChildren().add(expenseDetailsEditOutput);
        
        HtmlOutputText expenseDetailsEditInput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        expenseDetailsEditInput.setId("expenseDetailsEditInput");
        expenseDetailsEditInput.setValue("This relationship is managed from the ExpenseDetails side");
        htmlPanelGrid.getChildren().add(expenseDetailsEditInput);
        
        Message expenseDetailsEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        expenseDetailsEditInputMessage.setId("expenseDetailsEditInputMessage");
        expenseDetailsEditInputMessage.setFor("expenseDetailsEditInput");
        expenseDetailsEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(expenseDetailsEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid ExpenseBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText paidByLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        paidByLabel.setId("paidByLabel");
        paidByLabel.setValue("Paid By:");
        htmlPanelGrid.getChildren().add(paidByLabel);
        
        HtmlOutputText paidByValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        paidByValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.paidBy}", Login.class));
        paidByValue.setConverter(new LoginConverter());
        htmlPanelGrid.getChildren().add(paidByValue);
        
        HtmlOutputText xpdateLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        xpdateLabel.setId("xpdateLabel");
        xpdateLabel.setValue("Xpdate:");
        htmlPanelGrid.getChildren().add(xpdateLabel);
        
        HtmlOutputText xpdateValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        xpdateValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.xpdate}", Date.class));
        DateTimeConverter xpdateValueConverter = (DateTimeConverter) application.createConverter(DateTimeConverter.CONVERTER_ID);
        xpdateValueConverter.setPattern("dd/MM/yyyy");
        xpdateValue.setConverter(xpdateValueConverter);
        htmlPanelGrid.getChildren().add(xpdateValue);
        
        HtmlOutputText itemcodeLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        itemcodeLabel.setId("itemcodeLabel");
        itemcodeLabel.setValue("Itemcode:");
        htmlPanelGrid.getChildren().add(itemcodeLabel);
        
        HtmlOutputText itemcodeValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        itemcodeValue.setId("itemcodeValue");
        itemcodeValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.itemcode}", String.class));
        htmlPanelGrid.getChildren().add(itemcodeValue);
        
        HtmlOutputText remarksLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        remarksLabel.setId("remarksLabel");
        remarksLabel.setValue("Remarks:");
        htmlPanelGrid.getChildren().add(remarksLabel);
        
        HtmlOutputText remarksValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        remarksValue.setId("remarksValue");
        remarksValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.remarks}", String.class));
        htmlPanelGrid.getChildren().add(remarksValue);
        
        HtmlOutputText totalCostLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        totalCostLabel.setId("totalCostLabel");
        totalCostLabel.setValue("Total Cost:");
        htmlPanelGrid.getChildren().add(totalCostLabel);
        
        HtmlOutputText totalCostValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        totalCostValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.totalCost}", String.class));
        htmlPanelGrid.getChildren().add(totalCostValue);
        
        HtmlOutputText expenseDetailsLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        expenseDetailsLabel.setId("expenseDetailsLabel");
        expenseDetailsLabel.setValue("Expense Details:");
        htmlPanelGrid.getChildren().add(expenseDetailsLabel);
        
        HtmlOutputText expenseDetailsValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        expenseDetailsValue.setId("expenseDetailsValue");
        expenseDetailsValue.setValue("This relationship is managed from the ExpenseDetails side");
        htmlPanelGrid.getChildren().add(expenseDetailsValue);
        
        return htmlPanelGrid;
    }
    
    public Expense ExpenseBean.getExpense() {
        if (expense == null) {
            expense = new Expense();
        }
        return expense;
    }
    
    public void ExpenseBean.setExpense(Expense expense) {
        this.expense = expense;
    }
    
    public List<Login> ExpenseBean.completePaidBy(String query) {
        List<Login> suggestions = new ArrayList<Login>();
        for (Login login : Login.findAllLogins()) {
            String loginStr = String.valueOf(login.getUsername() +  " "  + login.getPassword() +  " "  + login.getLastLogin());
            if (loginStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(login);
            }
        }
        return suggestions;
    }
    
    public List<ExpenseDetails> ExpenseBean.getSelectedExpenseDetails() {
        return selectedExpenseDetails;
    }
    
    public void ExpenseBean.setSelectedExpenseDetails(List<ExpenseDetails> selectedExpenseDetails) {
        if (selectedExpenseDetails != null) {
            expense.setExpenseDetails(new HashSet<ExpenseDetails>(selectedExpenseDetails));
        }
        this.selectedExpenseDetails = selectedExpenseDetails;
    }
    
    public String ExpenseBean.onEdit() {
        if (expense != null && expense.getExpenseDetails() != null) {
            selectedExpenseDetails = new ArrayList<ExpenseDetails>(expense.getExpenseDetails());
        }
        return null;
    }
    
    public boolean ExpenseBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void ExpenseBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String ExpenseBean.displayList() {
        createDialogVisible = false;
        findAllExpenses();
        return "expense";
    }
    
    public String ExpenseBean.displayCreateDialog() {
        expense = new Expense();
        createDialogVisible = true;
        return "expense";
    }
    
    public String ExpenseBean.persist() {
        String message = "";
        if (expense.getId() != null) {
            expense.merge();
            message = "message_successfully_updated";
        } else {
            expense.persist();
            message = "message_successfully_created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialogWidget.hide()");
        context.execute("editDialogWidget.hide()");
        
        FacesMessage facesMessage = MessageFactory.getMessage(message, "Expense");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllExpenses();
    }
    
    public String ExpenseBean.delete() {
        expense.remove();
        FacesMessage facesMessage = MessageFactory.getMessage("message_successfully_deleted", "Expense");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllExpenses();
    }
    
    public void ExpenseBean.reset() {
        expense = null;
        selectedExpenseDetails = null;
        createDialogVisible = false;
    }
    
    public void ExpenseBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}