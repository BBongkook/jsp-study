package test.jsp.study.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import test.jsp.study.dao.UserDAO;
import test.jsp.study.dao.impl.UserDAOImpl;
import test.jsp.study.service.UserService;

public class UserServiceImpl implements UserService {
	private UserDAO udao = new UserDAOImpl();
	@Override
	public List<Map<String, String>> selectUserList(Map<String, String> user) {
		// TODO Auto-generated method stub
		return udao.selectUserList(user);
	}

	@Override
	public Map<String, String> selectUser(Map<String, String> user) {
		// TODO Auto-generated method stub
		return udao.selectUser(user);
	}

	@Override
	public int insertUser(Map<String, String> user) {
		// TODO Auto-generated method stub
		return udao.insertUser(user);
	}

	@Override
	public int updateUser(Map<String, String> user) {
		// TODO Auto-generated method stub
		return udao.updateUser(user);
	}

	@Override
	public int deleteUser(Map<String, String> user) {
		// TODO Auto-generated method stub
		return udao.deleteUser(user);
	}

	public static void main(String[] args) {
		UserService us = new UserServiceImpl();
		Map<String,String> map = new HashMap<>();
		System.out.println(us.selectUserList(null));
//		map.put("ui_num", "64");
//		map.put("ui_name", "개나리");
//		map.put("ui_age", "23");
//		map.put("ui_id", "power");
//		System.out.println(us.insertUser(map));
//		System.out.println(us.selectUser(map));
//		System.out.println(us.deleteUser(map));
		
		
		
	}
}
