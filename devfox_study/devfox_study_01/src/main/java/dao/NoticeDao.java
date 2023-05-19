package dao;

import java.util.ArrayList;

import model.FromTo;
import model.Notice;

public interface NoticeDao {
	Integer getMaxNo();//最大のお知らせ番号検索
	void putNotice(Notice notice);//お知らせの登録
	ArrayList<Notice> getAllNotice(FromTo ft);//お知らせリスト検索
	Integer getNoticeCount();//お知らせの数を検索
	Notice getNotice(Integer seqno);//番号でお知らせを検索
	void deleteNotice(Integer seqno);//番号でお知らせを削除
	void updateNotice(Notice notice);//DTOでお知らせを修正
}
