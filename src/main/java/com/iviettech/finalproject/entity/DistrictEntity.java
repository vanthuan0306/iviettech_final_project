package com.iviettech.finalproject.entity;

import lombok.Data;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.List;

@Entity
@Data
@Table(name = "districts")
public class DistrictEntity {
    @Id
    @Column(name = "code")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "name_en")
    private String nameEn;

    @Column(name = "full_name")
    private String fullName;

    @Column(name = "full_name_en")
    private String fullNameEn;

    @Column(name = "code_name")
    private String codeName;

    @ManyToOne
    @JoinColumn(name = "administrative_unit_id")
    private UnitEntity unitEntity;

    @ManyToOne
    @JoinColumn(name = "province_code")
    private ProvinceEntity provinceEntity;

    @OneToMany(mappedBy = "districtEntity")
    //@LazyCollection(LazyCollectionOption.FALSE)
    private List<WardEntity> wardEntityList;

    @OneToMany(mappedBy = "district")
    //@LazyCollection(LazyCollectionOption.FALSE)
    private List<OrderEntity> orderList;

    @OneToMany(mappedBy = "district")
    //@LazyCollection(LazyCollectionOption.FALSE)
    private List<UserEntity> userList;
}
