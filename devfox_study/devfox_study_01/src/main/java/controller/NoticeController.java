package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.aspectj.apache.bcel.generic.I2F;
import org.hibernate.hql.internal.ast.DetailedSemanticException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.NoticeDao;
import model.FromTo;
import model.LoginUser;
import model.Notice;

@Controller
public class NoticeController {
	@Autowired
	private NoticeDao NoticeDao;
	
	@RequestMapping(value="/notice/noticeModify.html")
	public ModelAndView modify(Integer SEQNO, String TITLE, String CONTENT, String BTN) {//form:form を使わないときは、このようにパラメータを受け取ってくる。
		if(BTN.equals("削除")){
			this.NoticeDao.deleteNotice(SEQNO);
		}else if(BTN.equals("修整")) {
			Notice notice = new Notice();
			notice.setSeqno(SEQNO);
			notice.setTitle(TITLE);
			notice.setContent(CONTENT);
			this.NoticeDao.updateNotice(notice);
		}
		ModelAndView mav = new ModelAndView("redirect:/notice/noticeList.html");
		return mav;
	}
	
	
	@RequestMapping(value="/notice/noticeRead.html")
	public ModelAndView Detaile(Integer SEQNO, HttpSession session) {
		Notice notice = this.NoticeDao.getNotice(SEQNO);
		ModelAndView mav = new ModelAndView("home/index");
		mav.addObject("notice",notice);
		LoginUser user = (LoginUser)session.getAttribute("ADMIN");
		if(user != null)
			mav.addObject("BODY","noticeDetailOwner.jsp");
		else
			mav.addObject("BODY","noticeDetail.jsp");
		return mav;
	}
	
	
	@RequestMapping(value="/notice/noticeList.html")
	public ModelAndView List(Integer PAGE_NO) {
		ModelAndView mav = new ModelAndView("home/index");
		int currentPage = 1;
		if(PAGE_NO != null) currentPage = PAGE_NO;
		int from = (currentPage - 1) * 5;
		int to = ((currentPage - 1) * 5) +6;
		FromTo ft = new FromTo();
		ft.setFrom(from);
		ft.setTo(to);
		int totalCount = this.NoticeDao.getNoticeCount();//お知らせの本数
		int pageCount = totalCount / 5;
		if(totalCount % 5 > 0) pageCount++;
		ArrayList<Notice> noticeList = this.NoticeDao.getAllNotice(ft);
		mav.addObject("noticeList",noticeList);
		mav.addObject("currentPage",currentPage);//currentPageに希望するページ（定数）を入れて
		mav.addObject("pageCount",pageCount);//pageCountに総ページ数を入れると確認できる
		mav.addObject("BODY","noticeList.jsp");
		return mav;
	}
	
	@RequestMapping(value="/notice/postNotice.html", method=RequestMethod.POST)
	public ModelAndView putNotice(Notice notice, HttpSession session) {
		LoginUser id = (LoginUser)session.getAttribute("ADMIN");//作成者
		int seqno = this.NoticeDao.getMaxNo() + 1;//お知らせの番号
		notice.setSeqno(seqno);//お知らせの番号を挿入
		notice.setId(id.getId());//作成者挿入
		this.NoticeDao.putNotice(notice);//お知らせ登録
		ModelAndView mav = new ModelAndView("redirect:/notice/toHome.html");
		return mav;
	}
	@RequestMapping(value="/notice/toHome.html")
	public ModelAndView toHome() {//リロード時にお知らせが再登録される現象を防止するコード
		ModelAndView mav = new ModelAndView("home/index");
		mav.addObject("BODY","noticeInputResult.jsp");
		return mav;
	}
	
	@RequestMapping(value="/notice/input.html")
	public ModelAndView input() {
		ModelAndView mav = new ModelAndView("home/index");
		mav.addObject("BODY","noticeInput.jsp");
		mav.addObject(new Notice());
		return mav;
	}
}
