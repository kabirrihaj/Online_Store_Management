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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Product generated by hbm2java
 */
@Entity
@Table(name="product"
    ,catalog="online_store_management"
)
public class Product  implements java.io.Serializable {


     private Integer productId;
     private ProCategory proCategory;
     private ProSubCategory proSubCategory;
     private String productName;
     private String manufacture;
     private int productQuantity;
     private double productPurPrice;
     private double productSelPrice;
     private String description;
     private String productImage;
     private String featured;
     private Date createDate;
     private Set<Orders> orderses = new HashSet<Orders>(0);
     private Set<OrderItems> orderItemses = new HashSet<OrderItems>(0);

    public Product() {
    }

	
    public Product(ProCategory proCategory, ProSubCategory proSubCategory, String productName, String manufacture, int productQuantity, double productPurPrice, double productSelPrice, String description, String productImage, String featured, Date createDate) {
        this.proCategory = proCategory;
        this.proSubCategory = proSubCategory;
        this.productName = productName;
        this.manufacture = manufacture;
        this.productQuantity = productQuantity;
        this.productPurPrice = productPurPrice;
        this.productSelPrice = productSelPrice;
        this.description = description;
        this.productImage = productImage;
        this.featured = featured;
        this.createDate = createDate;
    }
    public Product(ProCategory proCategory, ProSubCategory proSubCategory, String productName, String manufacture, int productQuantity, double productPurPrice, double productSelPrice, String description, String productImage, String featured, Date createDate, Set<Orders> orderses, Set<OrderItems> orderItemses) {
       this.proCategory = proCategory;
       this.proSubCategory = proSubCategory;
       this.productName = productName;
       this.manufacture = manufacture;
       this.productQuantity = productQuantity;
       this.productPurPrice = productPurPrice;
       this.productSelPrice = productSelPrice;
       this.description = description;
       this.productImage = productImage;
       this.featured = featured;
       this.createDate = createDate;
       this.orderses = orderses;
       this.orderItemses = orderItemses;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="product_id", unique=true, nullable=false)
    public Integer getProductId() {
        return this.productId;
    }
    
    public void setProductId(Integer productId) {
        this.productId = productId;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="category_id", nullable=false)
    public ProCategory getProCategory() {
        return this.proCategory;
    }
    
    public void setProCategory(ProCategory proCategory) {
        this.proCategory = proCategory;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="sub_category_id", nullable=false)
    public ProSubCategory getProSubCategory() {
        return this.proSubCategory;
    }
    
    public void setProSubCategory(ProSubCategory proSubCategory) {
        this.proSubCategory = proSubCategory;
    }

    
    @Column(name="product_name", nullable=false, length=100)
    public String getProductName() {
        return this.productName;
    }
    
    public void setProductName(String productName) {
        this.productName = productName;
    }

    
    @Column(name="manufacture", nullable=false, length=100)
    public String getManufacture() {
        return this.manufacture;
    }
    
    public void setManufacture(String manufacture) {
        this.manufacture = manufacture;
    }

    
    @Column(name="product_quantity", nullable=false)
    public int getProductQuantity() {
        return this.productQuantity;
    }
    
    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    
    @Column(name="product_pur_price", nullable=false, precision=22, scale=0)
    public double getProductPurPrice() {
        return this.productPurPrice;
    }
    
    public void setProductPurPrice(double productPurPrice) {
        this.productPurPrice = productPurPrice;
    }

    
    @Column(name="product_sel_price", nullable=false, precision=22, scale=0)
    public double getProductSelPrice() {
        return this.productSelPrice;
    }
    
    public void setProductSelPrice(double productSelPrice) {
        this.productSelPrice = productSelPrice;
    }

    
    @Column(name="description", nullable=false, length=200)
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }

    
    @Column(name="product_image", nullable=false, length=100)
    public String getProductImage() {
        return this.productImage;
    }
    
    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    
    @Column(name="featured", nullable=false, length=45)
    public String getFeatured() {
        return this.featured;
    }
    
    public void setFeatured(String featured) {
        this.featured = featured;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="create_date", nullable=false, length=10)
    public Date getCreateDate() {
        return this.createDate;
    }
    
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="product")
    public Set<Orders> getOrderses() {
        return this.orderses;
    }
    
    public void setOrderses(Set<Orders> orderses) {
        this.orderses = orderses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="product")
    public Set<OrderItems> getOrderItemses() {
        return this.orderItemses;
    }
    
    public void setOrderItemses(Set<OrderItems> orderItemses) {
        this.orderItemses = orderItemses;
    }




}


