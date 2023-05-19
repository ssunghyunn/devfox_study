package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.LoginDao;
import model.Member;

@Controller
public class UserEntryController {
	@Autowired
	private LoginDao loginDao;
	
	@RequestMapping(value="/userentry/userEntry.html")
	public ModelAndView userEntry(Member member) {
		//DBに顧客情報を挿入
		this.loginDao.create(member);
		ModelAndView mav = new ModelAndView("redirect:/userentry/toHome.html");
		return mav;
	}
	
	@RequestMapping(value="/userentry/toHome.html")
	   public ModelAndView toHome() {
	      ModelAndView mav = new ModelAndView("home/index");
	      mav.addObject("BODY","userEntryResult.jsp");
	      return mav;
	   }
	
	@RequestMapping(value="/userentry/idCheck.html")
	public ModelAndView idCheck(String USER_ID) {
		ModelAndView mav = new ModelAndView("home/idCheckResult");
		//DBでUSER_IDに保存されているアカウントで検索する
		Integer cnt = this.loginDao.getIdCount(USER_ID);
		if(cnt == 0) mav.addObject("DUP","NO");//使用可能を意味
		else mav.addObject("DUP","YES");//使用中であることを意味
		mav.addObject("ID",USER_ID);
		return mav;
	}
	
	@RequestMapping(value="/userentry/entry.html")
	public ModelAndView entry(Member member) {
		ModelAndView mav = new ModelAndView("home/index");
		mav.addObject("BODY","userEntry.jsp");
		mav.addObject(new Member());
		return mav;
	}
}
