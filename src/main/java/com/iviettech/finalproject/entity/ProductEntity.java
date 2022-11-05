package com.iviettech.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@Table(name = "products")
public class ProductEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name", length = 1024)
    private String name;

    @ManyToOne
    @JoinColumn(name = "category_detail_id")
    private CategoryDetailEntity categoryDetail;

    @Column(name = "description", length = 40000)
    private String description;

    @Column(name = "addition_info", length = 40000)
    private String additionInfo;

    @Column(name = "orginal_price")
    private double original_price;

    @Column(name = "actual_price")
    private double actual_price;

    @Column(name = "add_date")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="dd/MM/yyyy")
    private Date addDate;

    @ManyToOne
    @JoinColumn(name = "manufactor_id")
    private ManufactorEntity manufactor;

    @Column(name = "status", columnDefinition = "integer default 0")
    private int status;

    @OneToMany(mappedBy = "product")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<ProductDetailEntity> productDetailEntityList;

    @OneToMany(mappedBy = "product")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<ProductImageEntity> productImageEntityList;

    @OneToMany(mappedBy = "product")
    private List<ProductPromotionEntity> productPromotionEntityList;

    @OneToMany(mappedBy = "product")
    private List<OrderDetailEntity> orderDetailEntityList;



    @OneToMany(mappedBy = "product")
    private List<RatingEntity> ratingEntityList;

    public ProductEntity(){

    }

    //private String mainProductImageURL;
    public String getMainProductImageURL() {
        String url = "";
        for(ProductImageEntity productImageEntity : this.productImageEntityList) {
            if (productImageEntity.getIsMainImage() == 1) {
                url = productImageEntity.getImageUrl();
                break;
            }
        }
        return url;
    }

}
