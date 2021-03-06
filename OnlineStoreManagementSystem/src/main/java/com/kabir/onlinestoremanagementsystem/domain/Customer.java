package com.kabir.onlinestoremanagementsystem.domain;
// Generated Jul 28, 2018 1:01:38 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Customer generated by hbm2java
 */
@Entity
@Table(name="customer"
    ,catalog="online_store_management"
)
public class Customer  implements java.io.Serializable {


     private Integer customerId;
     private String customerFname;
     private String customerLname;
     private Date dateOfBirth;
     private String customerGender;
     private String email;
     private String password;
     private String customerUserName;
     private String address1;
     private String address2;
     private String city;
     private String state;
     private String zip;
     private String phoneNumber;
     private String customerImage;
     private Set<Payment> payments = new HashSet<Payment>(0);
     private Set<Orders> orderses = new HashSet<Orders>(0);
     private Set<OrderItems> orderItemses = new HashSet<OrderItems>(0);

    public Customer() {
    }

	
    public Customer(String customerFname, String customerLname, Date dateOfBirth, String customerGender, String email, String password, String customerUserName, String address1, String address2, String city, String state, String zip, String phoneNumber, String customerImage) {
        this.customerFname = customerFname;
        this.customerLname = customerLname;
        this.dateOfBirth = dateOfBirth;
        this.customerGender = customerGender;
        this.email = email;
        this.password = password;
        this.customerUserName = customerUserName;
        this.address1 = address1;
        this.address2 = address2;
        this.city = city;
        this.state = state;
        this.zip = zip;
        this.phoneNumber = phoneNumber;
        this.customerImage = customerImage;
    }
    public Customer(String customerFname, String customerLname, Date dateOfBirth, String customerGender, String email, String password, String customerUserName, String address1, String address2, String city, String state, String zip, String phoneNumber, String customerImage, Set<Payment> payments, Set<Orders> orderses, Set<OrderItems> orderItemses) {
       this.customerFname = customerFname;
       this.customerLname = customerLname;
       this.dateOfBirth = dateOfBirth;
       this.customerGender = customerGender;
       this.email = email;
       this.password = password;
       this.customerUserName = customerUserName;
       this.address1 = address1;
       this.address2 = address2;
       this.city = city;
       this.state = state;
       this.zip = zip;
       this.phoneNumber = phoneNumber;
       this.customerImage = customerImage;
       this.payments = payments;
       this.orderses = orderses;
       this.orderItemses = orderItemses;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="customer_id", unique=true, nullable=false)
    public Integer getCustomerId() {
        return this.customerId;
    }
    
    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    
    @Column(name="customer_fname", nullable=false, length=50)
    public String getCustomerFname() {
        return this.customerFname;
    }
    
    public void setCustomerFname(String customerFname) {
        this.customerFname = customerFname;
    }

    
    @Column(name="customer_lname", nullable=false, length=50)
    public String getCustomerLname() {
        return this.customerLname;
    }
    
    public void setCustomerLname(String customerLname) {
        this.customerLname = customerLname;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="date_of_birth", nullable=false, length=10)
    public Date getDateOfBirth() {
        return this.dateOfBirth;
    }
    
    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    
    @Column(name="customer_gender", nullable=false, length=30)
    public String getCustomerGender() {
        return this.customerGender;
    }
    
    public void setCustomerGender(String customerGender) {
        this.customerGender = customerGender;
    }

    
    @Column(name="email", nullable=false, length=100)
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    
    @Column(name="password", nullable=false, length=100)
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    
    @Column(name="customer_user_name", nullable=false, length=100)
    public String getCustomerUserName() {
        return this.customerUserName;
    }
    
    public void setCustomerUserName(String customerUserName) {
        this.customerUserName = customerUserName;
    }

    
    @Column(name="address_1", nullable=false, length=200)
    public String getAddress1() {
        return this.address1;
    }
    
    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    
    @Column(name="address_2", nullable=false, length=200)
    public String getAddress2() {
        return this.address2;
    }
    
    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    
    @Column(name="city", nullable=false, length=45)
    public String getCity() {
        return this.city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }

    
    @Column(name="state", nullable=false, length=45)
    public String getState() {
        return this.state;
    }
    
    public void setState(String state) {
        this.state = state;
    }

    
    @Column(name="zip", nullable=false, length=45)
    public String getZip() {
        return this.zip;
    }
    
    public void setZip(String zip) {
        this.zip = zip;
    }

    
    @Column(name="phone_number", nullable=false, length=15)
    public String getPhoneNumber() {
        return this.phoneNumber;
    }
    
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    
    @Column(name="customer_image", nullable=false, length=100)
    public String getCustomerImage() {
        return this.customerImage;
    }
    
    public void setCustomerImage(String customerImage) {
        this.customerImage = customerImage;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="customer")
    public Set<Payment> getPayments() {
        return this.payments;
    }
    
    public void setPayments(Set<Payment> payments) {
        this.payments = payments;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="customer")
    public Set<Orders> getOrderses() {
        return this.orderses;
    }
    
    public void setOrderses(Set<Orders> orderses) {
        this.orderses = orderses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="customer")
    public Set<OrderItems> getOrderItemses() {
        return this.orderItemses;
    }
    
    public void setOrderItemses(Set<OrderItems> orderItemses) {
        this.orderItemses = orderItemses;
    }




}


