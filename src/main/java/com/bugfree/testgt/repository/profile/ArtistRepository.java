package com.bugfree.testgt.repository.profile;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.bugfree.testgt.model.profile.Artist;

public interface ArtistRepository extends PagingAndSortingRepository<Artist, Integer>{

	List<Artist> findByStatus(String activeStatus);

}
