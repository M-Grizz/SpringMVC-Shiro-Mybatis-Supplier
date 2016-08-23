package com.github.grizz.supplier.mapper;

import java.util.List;

import com.github.grizz.supplier.model.PageBean;
import com.github.grizz.supplier.model.Supplier;

public interface SupplierMapper {
	boolean update(Supplier supplier);
	boolean delete(int id);
	boolean insert(Supplier supplier);
	
	List<Supplier> queryListFenye(PageBean<Supplier> pb);
	int selectCount();
	Supplier selectOne(int id);
}
