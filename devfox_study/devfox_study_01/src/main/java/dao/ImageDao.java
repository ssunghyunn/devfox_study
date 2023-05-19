package dao;

import java.util.List;

import model.FromTo;
import model.ImageBBS;

public interface ImageDao {
	Integer getMaxId();
	void putImageBBS(ImageBBS bbs);//文を挿入するメソッド
	List<ImageBBS> getAllImages(FromTo ft);//イメージ投稿リストを表示するメソッド
	Integer getImageCount();//ページ番号メソッド
	ImageBBS getImage(Integer id);
	void deleteImage(Integer id);//投稿の番号で画像投稿削除メソッド
	void updateImage(ImageBBS bbs);//画像投稿の修正（タイトル、ファイル名、内容）メソッド
	void updateOrderNo(ImageBBS bbs);//答文の場合、順序番号変更メソッド
}
