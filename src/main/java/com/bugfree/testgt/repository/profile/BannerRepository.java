package com.bugfree.testgt.repository.profile;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.bugfree.testgt.model.profile.Banner;

public interface BannerRepository extends PagingAndSortingRepository<Banner, Integer>{

	List<Banner> findByStatus(String activeStatus);

}
