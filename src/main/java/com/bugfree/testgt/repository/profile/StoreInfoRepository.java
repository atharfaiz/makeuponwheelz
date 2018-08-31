package com.bugfree.testgt.repository.profile;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.bugfree.testgt.model.profile.StoreInfo;

public interface StoreInfoRepository extends PagingAndSortingRepository<StoreInfo, Integer>{

	@Query(value="select * from store_info as s ORDER BY s.store_info_id DESC limit 1;", nativeQuery=true)
	StoreInfo findLastStore();

}
