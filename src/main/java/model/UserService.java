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

	public boolean check(String username) {
		boolean r = false;
		String sql = "select username from user where username=?";
		Map<String, String> u = db.getMap(sql, new String[] { username });
		if (u == null) {
			r = true;
		}
		return r;
	}

	public int register(String un, String pw, String tel, String addr) {
		String sql = "insert into user values(null,?,?,0,?,?)";
		String[] params = { un, pw, tel, addr };
		return db.update(sql, params);
	}

	//读取用户信息
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

	//根据id读取用户信息
	public Map<String, String> getUserById(String id){
		String sql = "select * from user where id=?";
		String[] params = {id};
		return db.getMap(sql, params);
	}

	// 用户信息修改
	public int updateUser(String pw, String tel, String addr,String id) {
		String sql = "update user set password=?,telephone=?,address=? where id=?";
		String[] params = { pw, tel, addr, id };
		return db.update(sql, params);
	}

}
