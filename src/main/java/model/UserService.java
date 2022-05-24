package model;

import java.util.List;
import java.util.Map;
import util.DBUtil;

public class UserService {

	private DBUtil db;

	public UserService() {
		db = new DBUtil();
	}

	public Map<String, String> login(String username, String password) {
		String sql = "select * from user where username=? and password=?";
		return db.getMap(sql, new String[] { username, password });
	}
	// 读取用户信息
	public List<Map<String, String>> getUsers(String username) {
		String sql = "select * from user";
		String[] params = null;
		if (username != null) {
			sql = sql + " where username like ?";
			params = new String[] { "%" + username + "%" };
		}
		return db.getList(sql, params);
	}
	// 删除用户信息
	public int delUser(String id) {
		String[] params = {id};
		// 删除用户信息前先删除用户的点餐信息
		String sql = "delete from diningcar where userid=?";
		db.update(sql, params);
		sql = "delete from user where id=?";
		return db.update(sql, params);
	}

}
