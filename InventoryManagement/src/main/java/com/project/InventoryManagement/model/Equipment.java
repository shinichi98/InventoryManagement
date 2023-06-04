package com.project.InventoryManagement.model;



import jakarta.persistence.*;

@Entity
@Table(name = "Equipment")
public class Equipment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long equipmentID;
    
    private String name;
    
    private String category;
    
    private String description;
    
    private int quantity;

	public Equipment() {
		
	}

	public Equipment(Long equipmentID, String name, String category, String description, int quantity) {
		super();
		this.equipmentID = equipmentID;
		this.name = name;
		this.category = category;
		this.description = description;
		this.quantity = quantity;
	}

	public Long getEquipmentID() {
		return equipmentID;
	}

	public void setEquipmentID(Long equipmentID) {
		this.equipmentID = equipmentID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
    
    
}
