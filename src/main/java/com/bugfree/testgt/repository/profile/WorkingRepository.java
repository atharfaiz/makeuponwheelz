package com.bugfree.testgt.repository.profile;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.bugfree.testgt.model.profile.Working;

public interface WorkingRepository extends PagingAndSortingRepository<Working, Integer>{

	Working findByDayInt(int day);

	List<Working> findByOpen(boolean b);

}
