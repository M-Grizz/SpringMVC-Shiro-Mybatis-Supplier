package com.github.grizz.supplier.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import com.github.grizz.supplier.mapper.SupplierMapper;
import com.github.grizz.supplier.model.PageBean;
import com.github.grizz.supplier.model.Supplier;

/**
 * 列表相关的业务功能
 */
@Service
public class ListService {

	@Resource
	SupplierMapper supplierMapper;

	// 分页查找
	public PageBean<Supplier> queryListFenye(int pc, int ps, String name,
			String code) {

		// 获取当前用户权限加以控制
		Subject subject = SecurityUtils.getSubject();

		PageBean<Supplier> pb = new PageBean<Supplier>();

		pb.setPc(pc);
		pb.setPs(ps);
		pb.setNameSearch(name);
		pb.setCodeSearch(code);
		int tr = (Integer) supplierMapper.selectCount();
		pb.setTr(tr);
		if (pb.getPc() > pb.getTp()) {
			pb.setPc(pb.getTp());
		}
		List<Supplier> beanList = null;
		// 权限为admin、user、游客是返回的列表
		if (subject.hasRole("admin")) {
			pb.setNameSearch(null);
			beanList = supplierMapper.queryListFenye(pb);
		} else if (subject.hasRole("user")) {
			pb.setNameSearch(subject.getPrincipals().toString());
			beanList = supplierMapper.queryListFenye(pb);
		}

		pb.setBeanList(beanList);

		return pb;

	}

	// 查找单条数据
	public Supplier selectOneList(String id) {
		return supplierMapper.selectOne(Integer.valueOf(id));
	}

	// 插入
	public void insertOne(String id, String name, String code, String jtype,
			String zhuangtai, String ps, String report, String dboss,
			String xboss) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.isPermitted("user:create")) {
			Supplier supplier = new Supplier();
			supplier.setId(Integer.valueOf(id));
			supplier.setName(name);
			supplier.setCode(code);			
			supplier.setJtype(jtype);
			supplier.setZhuangtai(zhuangtai);
			supplier.setPs(ps);
			supplier.setReport(report);
			supplier.setDboss(dboss);
			supplier.setXboss(xboss);
			supplierMapper.insert(supplier);
			System.out.println(subject.getPrincipal() + "进行了添加操作");
		}
	}

	// 删除
	public void updateOne(String id, String name, String code, String jtype,
			String zhuangtai, String ps, String report, String dboss,
			String xboss) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.isPermitted("user:create")) {
			Supplier supplier = new Supplier();
			supplier.setId(Integer.valueOf(id));
			supplier.setName(name);
			supplier.setCode(code);			
			supplier.setJtype(jtype);
			supplier.setZhuangtai(zhuangtai);
			supplier.setPs(ps);
			supplier.setReport(report);
			supplier.setDboss(dboss);
			supplier.setXboss(xboss);
			supplierMapper.update(supplier);
			System.out.println(subject.getPrincipal() + "进行了修改操作");

		}
	}

}
