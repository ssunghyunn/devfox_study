package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.LoginDao;
import model.LoginUser;

@Controller
public class LoginController {
   @Autowired
   private LoginDao loginDao;
   
   @RequestMapping(value="/login/home.html",method=RequestMethod.POST)
   public ModelAndView doLogin(@Valid LoginUser loginUser, BindingResult br,HttpSession session) {//@Validというアノテーションを通じてフォームチェックが実施
      ModelAndView mav = new ModelAndView("home/index");
      if(br.hasErrors()) {
         mav.getModel().putAll(br.getModel());
         mav.addObject("RELOGIN","login.jsp");//("名前","経路")エラーメッセージを持ってくるjspをRELOGINという名前で表示
         return mav;
      }
      LoginUser user = this.loginDao.findByIdPwd(loginUser);
      if(user==null) {//ログイン失敗
         mav.addObject("NOLOGIN","YES");
      }else {//ログイン成功
    	  if(loginUser.getId().contentEquals("admin")) {
    		  session.setAttribute("ADMIN", user);
    	  }else {
			session.setAttribute("LoginUser", user);
		}
         //セッションにLoginUserオブジェクトを保存
         session.setAttribute("LoginUser", user);
         mav.addObject("LOGIN","YES");
      }
      
      mav.addObject("BODY","loginResult.jsp");
      return mav;
   }
   
   @RequestMapping(value="/login/login.html")
   public ModelAndView login() {
      ModelAndView mav = new ModelAndView("home/login");
      mav.addObject(new LoginUser());
      return mav;
   }
}