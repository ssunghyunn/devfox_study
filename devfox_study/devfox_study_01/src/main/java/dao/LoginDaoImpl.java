package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.LoginUser;
import model.Member;

@Repository//daoオブジェクトを自動生成するためのアノテーション
public class LoginDaoImpl implements LoginDao {
	@Autowired
	private SqlSession session;
	public LoginUser findByIdPwd(LoginUser user) {
		return session.selectOne("mapper.mapper.getUser",user);
	}
	public Integer getIdCount(String id) {
		return session.selectOne("mapper.mapper.getIdCount",id);
	}
	public void create(Member member) {
		session.insert("mapper.mapper.putUser",member);
	}
}