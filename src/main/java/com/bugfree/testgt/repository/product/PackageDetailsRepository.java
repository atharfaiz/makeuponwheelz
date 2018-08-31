package com.bugfree.testgt.repository.product;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.bugfree.testgt.model.product.Category;
import com.bugfree.testgt.model.product.PackageDetails;

public interface PackageDetailsRepository extends PagingAndSortingRepository<PackageDetails, Integer>{

	List<PackageDetails> findByFeaturedAndStatus(boolean b, String activeStatus);

	List<PackageDetails> findByStatus(String activeStatus);

	List<PackageDetails> findByStatusAndCategory(String activeStatus, Category category);

}
