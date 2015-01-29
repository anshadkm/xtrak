// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nbad.xtrak.web;

import com.nbad.xtrak.domain.ItemType;
import com.nbad.xtrak.web.ItemTypeBean;
import com.nbad.xtrak.web.util.MessageFactory;
import java.util.ArrayList;
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
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.message.Message;
import org.primefaces.component.outputlabel.OutputLabel;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;

privileged aspect ItemTypeBean_Roo_ManagedBean {
    
    declare @type: ItemTypeBean: @ManagedBean(name = "itemTypeBean");
    
    declare @type: ItemTypeBean: @SessionScoped;
    
    private String ItemTypeBean.name = "ItemTypes";
    
    private ItemType ItemTypeBean.itemType;
    
    private List<ItemType> ItemTypeBean.allItemTypes;
    
    private boolean ItemTypeBean.dataVisible = false;
    
    private List<String> ItemTypeBean.columns;
    
    private HtmlPanelGrid ItemTypeBean.createPanelGrid;
    
    private HtmlPanelGrid ItemTypeBean.editPanelGrid;
    
    private HtmlPanelGrid ItemTypeBean.viewPanelGrid;
    
    private boolean ItemTypeBean.createDialogVisible = false;
    
    @PostConstruct
    public void ItemTypeBean.init() {
        columns = new ArrayList<String>();
        columns.add("itemCode");
        columns.add("itemDescription");
    }
    
    public String ItemTypeBean.getName() {
        return name;
    }
    
    public List<String> ItemTypeBean.getColumns() {
        return columns;
    }
    
    public List<ItemType> ItemTypeBean.getAllItemTypes() {
        return allItemTypes;
    }
    
    public void ItemTypeBean.setAllItemTypes(List<ItemType> allItemTypes) {
        this.allItemTypes = allItemTypes;
    }
    
    public String ItemTypeBean.findAllItemTypes() {
        allItemTypes = ItemType.findAllItemTypes();
        dataVisible = !allItemTypes.isEmpty();
        return null;
    }
    
    public boolean ItemTypeBean.isDataVisible() {
        return dataVisible;
    }
    
    public void ItemTypeBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid ItemTypeBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void ItemTypeBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid ItemTypeBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void ItemTypeBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid ItemTypeBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void ItemTypeBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid ItemTypeBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel itemCodeCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        itemCodeCreateOutput.setFor("itemCodeCreateInput");
        itemCodeCreateOutput.setId("itemCodeCreateOutput");
        itemCodeCreateOutput.setValue("Item Code:");
        htmlPanelGrid.getChildren().add(itemCodeCreateOutput);
        
        InputText itemCodeCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        itemCodeCreateInput.setId("itemCodeCreateInput");
        itemCodeCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{itemTypeBean.itemType.itemCode}", String.class));
        itemCodeCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(itemCodeCreateInput);
        
        Message itemCodeCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        itemCodeCreateInputMessage.setId("itemCodeCreateInputMessage");
        itemCodeCreateInputMessage.setFor("itemCodeCreateInput");
        itemCodeCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(itemCodeCreateInputMessage);
        
        OutputLabel itemDescriptionCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        itemDescriptionCreateOutput.setFor("itemDescriptionCreateInput");
        itemDescriptionCreateOutput.setId("itemDescriptionCreateOutput");
        itemDescriptionCreateOutput.setValue("Item Description:");
        htmlPanelGrid.getChildren().add(itemDescriptionCreateOutput);
        
        InputText itemDescriptionCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        itemDescriptionCreateInput.setId("itemDescriptionCreateInput");
        itemDescriptionCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{itemTypeBean.itemType.itemDescription}", String.class));
        itemDescriptionCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(itemDescriptionCreateInput);
        
        Message itemDescriptionCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        itemDescriptionCreateInputMessage.setId("itemDescriptionCreateInputMessage");
        itemDescriptionCreateInputMessage.setFor("itemDescriptionCreateInput");
        itemDescriptionCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(itemDescriptionCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid ItemTypeBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel itemCodeEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        itemCodeEditOutput.setFor("itemCodeEditInput");
        itemCodeEditOutput.setId("itemCodeEditOutput");
        itemCodeEditOutput.setValue("Item Code:");
        htmlPanelGrid.getChildren().add(itemCodeEditOutput);
        
        InputText itemCodeEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        itemCodeEditInput.setId("itemCodeEditInput");
        itemCodeEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{itemTypeBean.itemType.itemCode}", String.class));
        itemCodeEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(itemCodeEditInput);
        
        Message itemCodeEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        itemCodeEditInputMessage.setId("itemCodeEditInputMessage");
        itemCodeEditInputMessage.setFor("itemCodeEditInput");
        itemCodeEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(itemCodeEditInputMessage);
        
        OutputLabel itemDescriptionEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        itemDescriptionEditOutput.setFor("itemDescriptionEditInput");
        itemDescriptionEditOutput.setId("itemDescriptionEditOutput");
        itemDescriptionEditOutput.setValue("Item Description:");
        htmlPanelGrid.getChildren().add(itemDescriptionEditOutput);
        
        InputText itemDescriptionEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        itemDescriptionEditInput.setId("itemDescriptionEditInput");
        itemDescriptionEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{itemTypeBean.itemType.itemDescription}", String.class));
        itemDescriptionEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(itemDescriptionEditInput);
        
        Message itemDescriptionEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        itemDescriptionEditInputMessage.setId("itemDescriptionEditInputMessage");
        itemDescriptionEditInputMessage.setFor("itemDescriptionEditInput");
        itemDescriptionEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(itemDescriptionEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid ItemTypeBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText itemCodeLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        itemCodeLabel.setId("itemCodeLabel");
        itemCodeLabel.setValue("Item Code:");
        htmlPanelGrid.getChildren().add(itemCodeLabel);
        
        HtmlOutputText itemCodeValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        itemCodeValue.setId("itemCodeValue");
        itemCodeValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{itemTypeBean.itemType.itemCode}", String.class));
        htmlPanelGrid.getChildren().add(itemCodeValue);
        
        HtmlOutputText itemDescriptionLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        itemDescriptionLabel.setId("itemDescriptionLabel");
        itemDescriptionLabel.setValue("Item Description:");
        htmlPanelGrid.getChildren().add(itemDescriptionLabel);
        
        HtmlOutputText itemDescriptionValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        itemDescriptionValue.setId("itemDescriptionValue");
        itemDescriptionValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{itemTypeBean.itemType.itemDescription}", String.class));
        htmlPanelGrid.getChildren().add(itemDescriptionValue);
        
        return htmlPanelGrid;
    }
    
    public ItemType ItemTypeBean.getItemType() {
        if (itemType == null) {
            itemType = new ItemType();
        }
        return itemType;
    }
    
    public void ItemTypeBean.setItemType(ItemType itemType) {
        this.itemType = itemType;
    }
    
    public String ItemTypeBean.onEdit() {
        return null;
    }
    
    public boolean ItemTypeBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void ItemTypeBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String ItemTypeBean.displayList() {
        createDialogVisible = false;
        findAllItemTypes();
        return "itemType";
    }
    
    public String ItemTypeBean.displayCreateDialog() {
        itemType = new ItemType();
        createDialogVisible = true;
        return "itemType";
    }
    
    public String ItemTypeBean.persist() {
        String message = "";
        if (itemType.getId() != null) {
            itemType.merge();
            message = "message_successfully_updated";
        } else {
            itemType.persist();
            message = "message_successfully_created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialogWidget.hide()");
        context.execute("editDialogWidget.hide()");
        
        FacesMessage facesMessage = MessageFactory.getMessage(message, "ItemType");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllItemTypes();
    }
    
    public String ItemTypeBean.delete() {
        itemType.remove();
        FacesMessage facesMessage = MessageFactory.getMessage("message_successfully_deleted", "ItemType");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllItemTypes();
    }
    
    public void ItemTypeBean.reset() {
        itemType = null;
        createDialogVisible = false;
    }
    
    public void ItemTypeBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}