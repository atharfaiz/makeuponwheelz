package com.bugfree.testgt.repository.product;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.bugfree.testgt.model.product.Category;
import com.bugfree.testgt.model.product.SubCategory;

public interface SubCategoryRepository extends PagingAndSortingRepository<SubCategory, Integer>{

	SubCategory findBySubCategoryAliasAndCategory(String parameter, Category category);

	List<SubCategory> findByCategory(Category cat);

	SubCategory findBySubCategoryAliasOrSubCategoryName(String subcat, String subcat2);

	List<SubCategory> findByStatus(String activeStatus);

	List<SubCategory> findByStatusAndCategoryIn(String activeStatus, List<Category> catList);

	List<SubCategory> findByCategoryAndStatus(Category cat, String activeStatus);

}
