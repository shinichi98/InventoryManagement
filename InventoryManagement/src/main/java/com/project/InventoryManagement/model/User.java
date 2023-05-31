package com.project.InventoryManagement.model;



import jakarta.persistence.*;



@Entity
@Table(name = "User")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userID;
    
    private String username;
    
    private String password;
    
    private String firstName;
    
    private String lastName;
    
    private String email;
    
    private String phoneNumber;
    
    private String equipmentIds;
    
    @Enumerated(EnumType.STRING)
    private UserRole role;

	

	public User() {
		
	}

	public User(Long userID, String username, String password, String firstName, String lastName, String email,
			String phoneNumber,String equipmentIds, UserRole role) {
		super();
		this.userID = userID;
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.role = role;
		this.equipmentIds=equipmentIds;
	}

	public Long getUserID() {
		return userID;
	}
	public void setUserID(long userID) {
		this.userID=userID;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getEmail() {
		return email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public UserRole getRole() {
		return role;
	}
	
	public String getEquipmentIds() {
		return equipmentIds;
	}

	public void setEquipmentIds(String equipmentIds) {
		this.equipmentIds = equipmentIds;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public void setRole(UserRole role) {
		this.role = role;
	}
}
