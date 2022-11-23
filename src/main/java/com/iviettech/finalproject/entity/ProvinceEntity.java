package com.iviettech.finalproject.entity;

import lombok.Data;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.List;

@Entity
@Data
@Table(name = "provinces")
public class ProvinceEntity {
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
    @JoinColumn(name = "administrative_region_id")
    private RegionEntity regionEntity;

    @ManyToOne
    @JoinColumn(name = "administrative_unit_id")
    private UnitEntity unitEntity;

    @OneToMany(mappedBy = "provinceEntity")
    //@LazyCollection(LazyCollectionOption.FALSE)
    private List<DistrictEntity> districtEntityList;

    @OneToMany(mappedBy = "province")
    //@LazyCollection(LazyCollectionOption.FALSE)
    private List<OrderEntity> orderList;

    @OneToMany(mappedBy = "province")
    //@LazyCollection(LazyCollectionOption.FALSE)
    private List<UserEntity> userList;

}
