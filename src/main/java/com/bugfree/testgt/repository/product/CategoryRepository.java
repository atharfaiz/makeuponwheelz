package com.bugfree.testgt.repository.product;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.bugfree.testgt.model.product.Category;

public interface CategoryRepository extends PagingAndSortingRepository<Category, Integer> {

	Category findByCategoryAlias(String parameter);

	List<Category> findByStatus(String activeStatus);

	
}
