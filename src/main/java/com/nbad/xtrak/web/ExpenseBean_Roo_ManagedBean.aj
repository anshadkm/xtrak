// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nbad.xtrak.web;

import com.nbad.xtrak.domain.Expense;
import com.nbad.xtrak.domain.ExpenseDetails;
import com.nbad.xtrak.domain.ItemType;
import com.nbad.xtrak.domain.Login;
import com.nbad.xtrak.web.ExpenseBean;
import com.nbad.xtrak.web.converter.ItemTypeConverter;
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
        columns.add("xpDate");
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
        paidByCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{paidBy.username} #{paidBy.password} #{paidBy.lastLogin} #{paidBy.role}", String.class));
        paidByCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{paidBy}", Login.class));
        paidByCreateInput.setConverter(new LoginConverter());
        paidByCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(paidByCreateInput);
        
        Message paidByCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        paidByCreateInputMessage.setId("paidByCreateInputMessage");
        paidByCreateInputMessage.setFor("paidByCreateInput");
        paidByCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(paidByCreateInputMessage);
        
        OutputLabel xpDateCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        xpDateCreateOutput.setFor("xpDateCreateInput");
        xpDateCreateOutput.setId("xpDateCreateOutput");
        xpDateCreateOutput.setValue("Xp Date:");
        htmlPanelGrid.getChildren().add(xpDateCreateOutput);
        
        Calendar xpDateCreateInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        xpDateCreateInput.setId("xpDateCreateInput");
        xpDateCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.xpDate}", Date.class));
        xpDateCreateInput.setNavigator(true);
        xpDateCreateInput.setEffect("slideDown");
        xpDateCreateInput.setPattern("dd/MM/yyyy");
        xpDateCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(xpDateCreateInput);
        
        Message xpDateCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        xpDateCreateInputMessage.setId("xpDateCreateInputMessage");
        xpDateCreateInputMessage.setFor("xpDateCreateInput");
        xpDateCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(xpDateCreateInputMessage);
        
        OutputLabel itemTypeCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        itemTypeCreateOutput.setFor("itemTypeCreateInput");
        itemTypeCreateOutput.setId("itemTypeCreateOutput");
        itemTypeCreateOutput.setValue("Item Type:");
        htmlPanelGrid.getChildren().add(itemTypeCreateOutput);
        
        AutoComplete itemTypeCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        itemTypeCreateInput.setId("itemTypeCreateInput");
        itemTypeCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.itemType}", ItemType.class));
        itemTypeCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{expenseBean.completeItemType}", List.class, new Class[] { String.class }));
        itemTypeCreateInput.setDropdown(true);
        itemTypeCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "itemType", String.class));
        itemTypeCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{itemType.itemCode} #{itemType.itemDescription}", String.class));
        itemTypeCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{itemType}", ItemType.class));
        itemTypeCreateInput.setConverter(new ItemTypeConverter());
        itemTypeCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(itemTypeCreateInput);
        
        Message itemTypeCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        itemTypeCreateInputMessage.setId("itemTypeCreateInputMessage");
        itemTypeCreateInputMessage.setFor("itemTypeCreateInput");
        itemTypeCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(itemTypeCreateInputMessage);
        
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
        paidByEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{paidBy.username} #{paidBy.password} #{paidBy.lastLogin} #{paidBy.role}", String.class));
        paidByEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{paidBy}", Login.class));
        paidByEditInput.setConverter(new LoginConverter());
        paidByEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(paidByEditInput);
        
        Message paidByEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        paidByEditInputMessage.setId("paidByEditInputMessage");
        paidByEditInputMessage.setFor("paidByEditInput");
        paidByEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(paidByEditInputMessage);
        
        OutputLabel xpDateEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        xpDateEditOutput.setFor("xpDateEditInput");
        xpDateEditOutput.setId("xpDateEditOutput");
        xpDateEditOutput.setValue("Xp Date:");
        htmlPanelGrid.getChildren().add(xpDateEditOutput);
        
        Calendar xpDateEditInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        xpDateEditInput.setId("xpDateEditInput");
        xpDateEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.xpDate}", Date.class));
        xpDateEditInput.setNavigator(true);
        xpDateEditInput.setEffect("slideDown");
        xpDateEditInput.setPattern("dd/MM/yyyy");
        xpDateEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(xpDateEditInput);
        
        Message xpDateEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        xpDateEditInputMessage.setId("xpDateEditInputMessage");
        xpDateEditInputMessage.setFor("xpDateEditInput");
        xpDateEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(xpDateEditInputMessage);
        
        OutputLabel itemTypeEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        itemTypeEditOutput.setFor("itemTypeEditInput");
        itemTypeEditOutput.setId("itemTypeEditOutput");
        itemTypeEditOutput.setValue("Item Type:");
        htmlPanelGrid.getChildren().add(itemTypeEditOutput);
        
        AutoComplete itemTypeEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        itemTypeEditInput.setId("itemTypeEditInput");
        itemTypeEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.itemType}", ItemType.class));
        itemTypeEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{expenseBean.completeItemType}", List.class, new Class[] { String.class }));
        itemTypeEditInput.setDropdown(true);
        itemTypeEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "itemType", String.class));
        itemTypeEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{itemType.itemCode} #{itemType.itemDescription}", String.class));
        itemTypeEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{itemType}", ItemType.class));
        itemTypeEditInput.setConverter(new ItemTypeConverter());
        itemTypeEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(itemTypeEditInput);
        
        Message itemTypeEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        itemTypeEditInputMessage.setId("itemTypeEditInputMessage");
        itemTypeEditInputMessage.setFor("itemTypeEditInput");
        itemTypeEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(itemTypeEditInputMessage);
        
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
        
        HtmlOutputText xpDateLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        xpDateLabel.setId("xpDateLabel");
        xpDateLabel.setValue("Xp Date:");
        htmlPanelGrid.getChildren().add(xpDateLabel);
        
        HtmlOutputText xpDateValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        xpDateValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.xpDate}", Date.class));
        DateTimeConverter xpDateValueConverter = (DateTimeConverter) application.createConverter(DateTimeConverter.CONVERTER_ID);
        xpDateValueConverter.setPattern("dd/MM/yyyy");
        xpDateValue.setConverter(xpDateValueConverter);
        htmlPanelGrid.getChildren().add(xpDateValue);
        
        HtmlOutputText itemTypeLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        itemTypeLabel.setId("itemTypeLabel");
        itemTypeLabel.setValue("Item Type:");
        htmlPanelGrid.getChildren().add(itemTypeLabel);
        
        HtmlOutputText itemTypeValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        itemTypeValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{expenseBean.expense.itemType}", ItemType.class));
        itemTypeValue.setConverter(new ItemTypeConverter());
        htmlPanelGrid.getChildren().add(itemTypeValue);
        
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
            String loginStr = String.valueOf(login.getUsername() +  " "  + login.getPassword() +  " "  + login.getLastLogin() +  " "  + login.getRole());
            if (loginStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(login);
            }
        }
        return suggestions;
    }
    
    public List<ItemType> ExpenseBean.completeItemType(String query) {
        List<ItemType> suggestions = new ArrayList<ItemType>();
        for (ItemType itemType : ItemType.findAllItemTypes()) {
            String itemTypeStr = String.valueOf(itemType.getItemCode() +  " "  + itemType.getItemDescription());
            if (itemTypeStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(itemType);
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
