package com.pocket.service.iface;

import java.util.List;

import com.pocket.sql.bean.Review;
import com.pocket.util.Pagination;

public interface ReviewService {
	public List myShow(Integer id);

	public void myAdd(Review review);

	public Pagination findUserinfoByPage(int pageSize, Integer currentIndex);
}
