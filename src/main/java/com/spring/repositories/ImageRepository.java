package com.spring.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.spring.entities.Images;


@Repository
public interface ImageRepository extends CrudRepository<Images, Integer> {

}
