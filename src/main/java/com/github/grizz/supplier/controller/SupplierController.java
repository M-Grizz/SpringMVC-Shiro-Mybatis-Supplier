package com.github.grizz.supplier.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.grizz.supplier.model.PageBean;
import com.github.grizz.supplier.model.Supplier;
import com.github.grizz.supplier.service.ListService;


@Controller
public class SupplierController {

	@Resource
	ListService listService;

	@RequestMapping("/List.action")
	public ModelAndView getList(HttpServletRequest request) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}

		String name = request.getParameter("name");
		String code = request.getParameter("code");
		int pc = getPc(request);

		if (pc <= 0) {
			pc = 1;
		}
		int ps = getPs(request);
		PageBean<Supplier> pb = null;
		try {
			pb = listService.queryListFenye(pc, ps, name, code);

		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("pb", pb);

		return new ModelAndView("list", "url", "/List.do");

	}

	// 获取当前页
	private int getPc(HttpServletRequest request) {
		String value = request.getParameter("pc");
		if (value == null || value.trim().isEmpty()) {
			return 1;
		}
		return Integer.parseInt(value);
	}

	// 获取每页显示条数
	private int getPs(HttpServletRequest request) {
		String value = request.getParameter("ps");
		if (value == null || value.trim().isEmpty()) {
			return 4;
		}
		return Integer.parseInt(value);
	}

	@RequestMapping("/Add.action")
	public String add() {
		return "add";
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/Output.action")
	public ModelAndView output(HttpServletRequest req, HttpServletResponse resp)
			throws InvalidFormatException {
		// 设置编码
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String name = req.getParameter("name");
		String code = req.getParameter("code");

		int pc = getPc(req);
		int ps = getPs(req);
		if (pc <= 0) {
			pc = 1;
		}
		PageBean<Supplier> pb = null;
		try {
			pb = listService.queryListFenye(pc, ps, name, code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.setAttribute("pb", pb);

		String templateFileName = "C:/Users/magsh/Desktop/templates/supplier.xls";
		String destFileName = "C:/Users/magsh/Desktop/templates/supilier_output.xls";
		Map beans = new HashMap();
		beans.put("list", pb.getBeanList());
		XLSTransformer transformer = new XLSTransformer();
		try {
			transformer.transformXLS(templateFileName, beans, destFileName);
		} catch (ParsePropertyException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 向页面跳转
		return new ModelAndView("list", "url", "/List.do");
	}

	@RequestMapping("/Boss.action")
	public String boss(HttpServletRequest req, HttpServletResponse resp) {

		// 设置编码
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String id = req.getParameter("id");
		Supplier supplier = new Supplier();
		try {
			supplier = listService.selectOneList(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.setAttribute("supplier", supplier);

		// 向页面跳转
		return "bossinf";
	}

	@RequestMapping("/UpdateOneServlet.action")
	public ModelAndView updateOneServlet(HttpServletRequest req,
			HttpServletResponse resp) {
		// 设置编码
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 接收页面的值
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String code = req.getParameter("code");
		String jtype = req.getParameter("jtype");
		String zhuangtai = req.getParameter("zhuangtai");
		String pss = req.getParameter("pss");
		String report = req.getParameter("report");
		String dboss = req.getParameter("dboss");
		String xboss = req.getParameter("xboss");

		listService.updateOne(id, name, code, jtype, zhuangtai, pss,
				report, dboss, xboss);

		// 向页面跳转
		return new ModelAndView("list", "url", "/List.do");
	}

	@RequestMapping("/UpdateServlet.action")
	public String UpdateServlet(HttpServletRequest req, HttpServletResponse resp) {
		// 设置编码
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 接收页面的值
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		// 向页面跳转
		// 查询消息列表并传给页面
		req.setAttribute("supplier", listService.selectOneList(id));
		// 向页面跳转
		return "update";
	}

	@RequestMapping("/Detail.action")
	public String detail(HttpServletRequest req, HttpServletResponse resp) {
		// 设置编码
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String id = req.getParameter("id");
		Supplier supplier = new Supplier();
		try {
			supplier = listService.selectOneList(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.setAttribute("supplier", supplier);

		return "detail";
	}

	@RequestMapping("/InsertOneServlet.action")
	public ModelAndView InsertOneServlet(HttpServletRequest req,
			HttpServletResponse resp) {
		// 设置编码
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 接收页面的值
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String code = req.getParameter("code");
		String jtype = req.getParameter("jtype");
		String zhuangtai = req.getParameter("zhuangtai");
		String pss = req.getParameter("pss");
		String report = req.getParameter("report");
		String dboss = req.getParameter("dboss");
		String xboss = req.getParameter("xboss");

		listService.insertOne(id, name, code, jtype, zhuangtai, pss,
				report, dboss, xboss);

		// 向页面跳转
		return getList(req);
	}

}