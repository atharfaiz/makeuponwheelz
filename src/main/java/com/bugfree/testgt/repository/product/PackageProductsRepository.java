package com.bugfree.testgt.repository.product;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.bugfree.testgt.model.product.PackageDetails;
import com.bugfree.testgt.model.product.PackageProducts;

public interface PackageProductsRepository extends PagingAndSortingRepository<PackageProducts, Long>{

	List<PackageProducts> findByPackageDetails(PackageDetails packageDetails);

	List<PackageProducts> findByPackageDetailsIn(List<PackageDetails> activePackageList);

}
