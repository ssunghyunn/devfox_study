package model;

import org.hibernate.validator.constraints.NotEmpty;

public class LoginUser {
	@NotEmpty(message="IDを入力してください。")
	private String id;
	@NotEmpty(message="パスワードを入力してください。")//アノテーションを利用したフォームチェック、pom.xmlでライブラリ作成が必要(3つ)
	private String pwd;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
}
