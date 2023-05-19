package dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.FromTo;
import model.Notice;
@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	private SqlSession session;
	public Integer getMaxNo() {
		return session.selectOne("mapper.mapper.getMaxNotice");
	}

	public void putNotice(Notice notice) {
		session.insert("mapper.mapper.putNotice", notice);
	}

	public ArrayList<Notice> getAllNotice(FromTo ft) {
		ArrayList<Notice> noticeList =
				(ArrayList)session.selectList("mapper.mapper.getAllNotice",ft);
		return noticeList;
	}
	public void deleteNotice(Integer seqno) {
		session.delete("mapper.mapper.deleteNotice",seqno);
	}

	public void updateNotice(Notice notice) {
		session.update("mapper.mapper.updateNotice",notice);
	}

	public Integer getNoticeCount() {
		return session.selectOne("mapper.mapper.getNoticeCount");
	}

	public Notice getNotice(Integer seqno) {
		return session.selectOne("mapper.mapper.getNotice",seqno);
	}
}