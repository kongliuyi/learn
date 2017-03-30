package com.pocket.service.iface;

import java.util.List;

import com.pocket.sql.bean.Basket;

public interface  BasketService {

	public void myAdd(Basket basket);

	public List myshow();

}
