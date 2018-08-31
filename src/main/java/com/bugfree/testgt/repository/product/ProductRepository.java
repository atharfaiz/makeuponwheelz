package com.bugfree.testgt.repository.product;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.bugfree.testgt.model.product.Category;
import com.bugfree.testgt.model.product.PackageDetails;
import com.bugfree.testgt.model.product.PackageProducts;
import com.bugfree.testgt.model.product.Product;
import com.bugfree.testgt.model.product.SubCategory;

public interface ProductRepository extends PagingAndSortingRepository<Product, Long>{

	List<Product> findBySubCategory(SubCategory subCategory);

	List<Product> findBySubCategoryAndCategory(SubCategory sc, Category cat);

	List<Product> findByCategory(Category category);

	List<Product> findByProductIdIn(List<Long> productList);


}
