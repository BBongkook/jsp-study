package test.jsp.study.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import test.jsp.study.dao.UserDAO;
import test.jsp.study.db.DBCon;

public class UserDAOImpl implements UserDAO {

	@Override
	public List<Map<String, String>> selectUserList(Map<String, String> user) {
		String sql = "select ui_num, ui_name, ui_age, ui_id, ui_etc";
		sql += " from user_info";
		List<Map<String,String>> userList = new ArrayList<>();
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Map<String,String> userMap = new HashMap<>();
				userMap.put("ui_num", rs.getString("ui_num"));
				userMap.put("ui_name", rs.getString("ui_name"));
				userMap.put("ui_age", rs.getString("ui_age"));
				userMap.put("ui_id", rs.getString("ui_id"));
				userMap.put("ui_etc", rs.getString("ui_etc"));
				userList.add(userMap);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userList;
	}

	@Override
	public Map<String, String> selectUser(Map<String, String> user) {
		String sql = "select ui_num, ui_name, ui_age, ui_id, ui_etc";
		sql += " from user_info where ui_num=?";
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			ps.setString(1, user.get("ui_num"));
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Map<String,String> userMap = new HashMap<>();
				userMap.put("ui_num", rs.getString("ui_num"));
				userMap.put("ui_name", rs.getString("ui_name"));
				userMap.put("ui_age", rs.getString("ui_age"));
				userMap.put("ui_id", rs.getString("ui_id"));
				userMap.put("ui_etc", rs.getString("ui_etc"));
				return userMap;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int insertUser(Map<String, String> user) {
		String sql = "insert into user_info(ui_num, ui_name, ui_age, ui_id, ui_etc)";
		sql += " values((select nvl(max(ui_num),0)+1 from user_info),?,?,?,?)";
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			ps.setString(1, user.get("ui_name"));
			ps.setString(2, user.get("ui_age"));
			ps.setString(3, user.get("ui_id"));
			ps.setString(4, user.get("ui_etc"));
			return ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateUser(Map<String, String> user) {
		String sql = "update user_info set";
		
		if(user.get("ui_name")!=null && !"".equals(user.get("ui_name"))) {
			sql += " ui_name=?,";
		}
		if(user.get("ui_age")!=null && !"".equals(user.get("ui_age"))) {
			sql += " ui_age=?,";
		}
		if(user.get("ui_id")!=null && !"".equals(user.get("ui_id"))) {
			sql += " ui_id=?,";
		}
		if(user.get("ui_etc")!=null && !"".equals(user.get("ui_etc"))) {
			sql += " ui_etc=?,";
		}
		sql = sql.substring(0, sql.length()-1);
		sql += " where ui_num=?";
		
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			int cnt=1;
			if(user.get("ui_name")!=null && !"".equals(user.get("ui_name"))) {
				ps.setString(cnt++, user.get("ui_name"));
			}
			if(user.get("ui_age")!=null && !"".equals(user.get("ui_age"))) {
				ps.setString(cnt++, user.get("ui_age"));
			}
			if(user.get("ui_id")!=null && !"".equals(user.get("ui_id"))) {
				ps.setString(cnt++, user.get("ui_id"));
			}
			if(user.get("ui_etc")!=null && !"".equals(user.get("ui_etc"))) {
				ps.setString(cnt++, user.get("ui_etc"));
			}
			ps.setString(cnt, user.get("ui_num"));
			return ps.executeUpdate();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int deleteUser(Map<String, String> user) {
		String sql = "delete from user_info where ui_num=?";
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			ps.setString(1, user.get("ui_num"));
			return ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public static void main(String[] args) {
		UserDAO udao = new UserDAOImpl();
//		System.out.println(udao.selectUserList(null));
//		Map<String,String> d = new HashMap<>();
//		d.put("ui_num", "53");
//		System.out.println(udao.selectUser(d));
		Map<String,String> e = new HashMap<>();
//		e.put("ui_num", "65");
//		System.out.println(udao.deleteUser(e));
		e.put("ui_age", "4");
		e.put("ui_num", "54");
		System.out.println(udao.updateUser(e));
		
	}
}
