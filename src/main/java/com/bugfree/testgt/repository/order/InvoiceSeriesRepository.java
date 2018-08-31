package com.bugfree.testgt.repository.order;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.bugfree.testgt.model.order.InvoiceSeries;

public interface InvoiceSeriesRepository extends CrudRepository<InvoiceSeries, Integer>{

	@Query(value="select * from invoice_series as invoice ORDER BY invoice.series_id DESC limit 1", nativeQuery=true)
	InvoiceSeries findByLastInvoice();

}
