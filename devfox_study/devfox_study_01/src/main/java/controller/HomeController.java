package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@RequestMapping
	public ModelAndView intro(String BODY) {
		ModelAndView mav = new ModelAndView("home/index");//ビュー設定
		mav.addObject("BODY",BODY);
		return mav;
	}
	
	@RequestMapping(value="/home/index.html")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
