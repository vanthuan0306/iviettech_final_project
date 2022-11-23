package com.iviettech.finalproject.repository;

import com.iviettech.finalproject.entity.UserEntity;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

public interface UserRepository extends CrudRepository<UserEntity, Integer> {
    @Transactional
    @Modifying
    @Query("update UserEntity u set u.activationCode = null where u.email = ?1 and u.activationCode = ?2")
    int activateUser(String email, String activationCode);

    UserEntity findByEmail(String email);
    UserEntity findByEmailAndPassword(String email, String password);
    UserEntity findByEmailAndActivationCodeNotNull(String email);

    @Transactional
    @Modifying
    @Query(value = "update accounts set first_name = ?1, last_name = ?2, phone_number = ?3, address_detail = ?4,\n" +
            "province = ?5, district = ?6, ward = ?7 where id = ?8",
            nativeQuery = true)
    void updateUser(String firstName, String lastName, String phoneNumber, String addressDetail, int provinceId, int districtId, int wardId, int id);


    @Transactional
    @Modifying
    @Query(value = "update accounts set password = ?1 where id = ?2",
            nativeQuery = true)
    void updatePassword(String password, int id);


}
