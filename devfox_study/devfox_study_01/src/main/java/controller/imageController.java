package controller;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.border.TitledBorder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ImageDao;
import model.FromTo;
import model.ImageBBS;
import model.LoginUser;

@Controller
public class imageController {
	@Autowired
	private ImageDao imageDao;
	
	
	@RequestMapping(value="/image/imageReplyForm.html")
	public ModelAndView reply(Integer id, Integer parentid, Integer groupid) {
		ModelAndView mav = new ModelAndView("home/index");
		ImageBBS original = this.imageDao.getImage(id);//番号で投稿を検索
		original.setContent(null);
		original.setParent_id(parentid);
		original.setGroup_id(groupid);
		String title = "RE]" + original.getTitle();
		mav.addObject("BODY","imageWriteForm.jsp");
		mav.addObject("title",title);
		mav.addObject(original);
		return mav;
	}
	
	@RequestMapping(value="/image/update.html")
	   public ModelAndView update(ImageBBS imageBBS,HttpServletRequest request) {
	      ModelAndView mav = new ModelAndView("home/index");
	      String encTyp="euc-kr";
	      int maxSiez = 5 * 1024 * 1024;//5メガバイト
	      ServletContext ctx = request.getSession().getServletContext();
	      String realPath = ctx.getRealPath("/upload");
	      System.out.println("アップロードフォルダの位置:"+realPath);
	      ImageBBS old = null;
	      MultipartRequest mr = null;
	      try {
	         mr = new MultipartRequest(request,realPath,maxSiez,encTyp,
	            new DefaultFileRenamePolicy());
	         old = this.imageDao.getImage(Integer.parseInt(mr.getParameter("writing_id")));
	         String fileName = mr.getFilesystemName("image_name");
	         if(fileName == null || fileName.equals("")) {//アップロード失敗
	            imageBBS.setImage_name(old.getImage_name());
	         }else{//イメージ変更
	            imageBBS.setImage_name(fileName);
	         }
	      }catch(Exception e){}
	      imageBBS.setPassword(mr.getParameter("password"));
	      if(old.getPassword().equals(imageBBS.getPassword())) {//パスワードが一致する場合
	         imageBBS.setTitle(mr.getParameter("title"));
	         imageBBS.setContent(mr.getParameter("content"));
	         imageBBS.setWriting_id(old.getWriting_id());
	         this.imageDao.updateImage(imageBBS);//update実行
	         mav.addObject("BODY","imageUpdateResult.jsp");
	      }else {
	         mav.addObject("BODY","imageUpdateResult.jsp?id="+imageBBS.getWriting_id());
	      }
	      return mav;
	   }
	   
	
	@RequestMapping(value="/image/imageModifyForm.html")
	public ModelAndView modifyForm(Integer WID) {
		ModelAndView mav = new ModelAndView("home/index");
		ImageBBS bbs = this.imageDao.getImage(WID);
		mav.addObject(bbs);
		mav.addObject("BODY","imageModifyForm.jsp");
		return mav;
	}
	
	@RequestMapping(value="image/delete.html")
	public ModelAndView delete(ImageBBS imageBBS) {
		ImageBBS old = this.imageDao.getImage(imageBBS.getWriting_id());//投稿の番号で検索
		ModelAndView mav = new ModelAndView("home/index");
		if(old.getPassword().equals(imageBBS.getPassword())) {//パスワードが一致する場合
			this.imageDao.deleteImage(imageBBS.getWriting_id());//投稿の番号で投稿を削除
			mav.addObject("BODY","imageDeleteResult.jsp");
		}else {//パスワードが異なる場合
			mav.addObject("BODY","imageDeleteResult.jsp?id="+imageBBS.getWriting_id());			
		}
		return mav;
	}
	
	@RequestMapping(value="/image/imageDeleteForm.html")
	public ModelAndView deleteForm(Integer WID) {
		ModelAndView mav = new ModelAndView("home/index");
		ImageBBS bbs = this.imageDao.getImage(WID);
		mav.addObject(bbs);
		mav.addObject("BODY","imageDeleteForm.jsp");
		return mav;
	}
	
	@RequestMapping(value="/image/imageRead.html")
	public ModelAndView read(Integer W_ID, HttpSession session) {
		LoginUser user = (LoginUser)session.getAttribute("LoginUser");
		ImageBBS bbs = this.imageDao.getImage(W_ID);
		ModelAndView mav = new ModelAndView("home/index");
		if(user == null) {
			//ログインしていない場合
			mav.addObject("BODY", "imageDetailNoLogin.jsp");
		}else if(user == null || ! user.getId().equals(bbs.getId())) {
			//ログインしていない、またはログインアカウントとユーザーが異なる場合
			mav.addObject("BODY", "imageDetail.jsp");
		}else if (user.getId().equals(bbs.getId())) {
			//ログインアカウントとユーザーが同じ場合
			mav.addObject("BODY", "imageDetailOwner.jsp");
		}
		mav.addObject("BBS", bbs);
		return mav;
	}
	
	@RequestMapping(value="/image/imageList.html")
	public ModelAndView List(Integer PAGE_NO) {
		int currentPage = 1;//現在のページ
		if(PAGE_NO != null) currentPage = PAGE_NO;
		int from = (currentPage - 1) * 5;
		int to = ((currentPage - 1 ) * 5 ) + 6;
		FromTo ft = new FromTo();
		ft.setFrom(from);
		ft.setTo(to);
		imageDao.getAllImages(ft);
		ArrayList<ImageBBS> list = (ArrayList)imageDao.getAllImages(ft);
		int totalCount = this.imageDao.getImageCount();
		int pageCount = totalCount / 5;
		if(totalCount % 5 > 0) pageCount++;
		ModelAndView mav = new ModelAndView("home/index");
		mav.addObject("BODY","imageList.jsp");
		mav.addObject("currentPage",currentPage);
		mav.addObject("pageCount",pageCount);
		mav.addObject("LIST",list);
		return mav;
	}
	
	@RequestMapping(value="/image/upload.html",method=RequestMethod.POST)//COSライブラリを使ったアップロード。
	public ModelAndView upload(ImageBBS imageBBS, HttpSession session, HttpServletRequest request) throws Exception{
		String encTyp = "utf-8";
		int maxSize = 5 * 1024 * 1024;//5メガバイト = (5　*　1024バイト = 5キロバイト )*1024　=　5メガバイト
		ServletContext ctx = request.getSession().getServletContext();
		String realPath = ctx.getRealPath("/upload");
		System.out.println("업로드 폴더위치: " + realPath);
		MultipartRequest mr = new MultipartRequest(request, realPath, maxSize, encTyp, new DefaultFileRenamePolicy());
		//MultipartRequest(HttpServletRequest, 絶対パス、最大サイズ、言語コード、同一ファイル名の自動変更オブジェクト);
		String fileName = mr.getFilesystemName("IMAGENAME");//アップロードメソッド
		ModelAndView mav = new ModelAndView("home/index");
		if(fileName == null || fileName.equals("")) {//アップロード失敗
			mav.addObject("BODY","imageUploadResult.jsp?R=NOK");			
		}else {//アップロード成功
			int seqno = this.imageDao.getMaxId() + 1;
			LoginUser user = (LoginUser)session.getAttribute("LoginUser");
			String id = user.getId();
			imageBBS.setWriting_id(seqno);//投稿の番号でをDTOに設定
			if(mr.getParameter("parent_id") == null) {//元来の文の場合
				System.out.println("元来の文です。");
				imageBBS.setGroup_id(seqno);//グループ番号をDTOに設定
				imageBBS.setParent_id(0);
				imageBBS.setOrder_no(0);
			}else {//答文の場合
				System.out.println("答文です。");
				imageBBS.setParent_id(Integer.parseInt(mr.getParameter("parent_id")));
				imageBBS.setGroup_id(Integer.parseInt(mr.getParameter("group_id")));
				imageBBS.setOrder_no(Integer.parseInt(mr.getParameter("order_no")));
				this.imageDao.updateOrderNo(imageBBS);//order_no増加update実行。 同じ投稿に返事をいくつかつけてorder_noが増加するか確認
				
			}
			imageBBS.setId(id);//作成者をDTOに設定
			imageBBS.setImage_name(fileName);//ファイル名をDTOに設定
			imageBBS.setPassword(mr.getParameter("password"));
			imageBBS.setTitle(mr.getParameter("title"));
			imageBBS.setContent(mr.getParameter("content"));
			this.imageDao.putImageBBS(imageBBS);//DBにイメージ投稿を挿入
			mav.addObject("BODY","imageUploadResult.jsp?R=OK");
		}
		return mav;
	}
	
	@RequestMapping(value="/image/imageForm.html")
	public ModelAndView form() {
		ModelAndView mav = new ModelAndView("home/index");
		mav.addObject("BODY","imageWriteForm.jsp");
		mav.addObject(new ImageBBS());//form:formにImageBBSオブジェクトを注入
		return mav;
	}
}
