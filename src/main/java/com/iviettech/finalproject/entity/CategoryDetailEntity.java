package com.iviettech.finalproject.entity;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "category_detail")
public class CategoryDetailEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @OneToMany(mappedBy = "categoryDetail", fetch = FetchType.EAGER)
    private List<ProductEntity> productEntityList;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private CategoryEntity category;
}
