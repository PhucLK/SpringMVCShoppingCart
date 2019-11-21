package com.spring.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.spring.entities.Category;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Integer>{

}
