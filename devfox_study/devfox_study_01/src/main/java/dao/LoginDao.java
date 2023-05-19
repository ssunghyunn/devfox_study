package dao;

import model.LoginUser;
import model.Member;

public interface LoginDao {
	LoginUser findByIdPwd(LoginUser user);//ログイン用メソッド
	Integer getIdCount(String id);//ID重複検査用メソッド
	void create(Member member);//会員登録用メソッド
}
