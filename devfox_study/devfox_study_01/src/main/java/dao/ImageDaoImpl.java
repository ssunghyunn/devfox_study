package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.FromTo;
import model.ImageBBS;
@Repository
public class ImageDaoImpl implements ImageDao {
	
	@Autowired
	private SqlSession session;
	public Integer getMaxId() {
		Integer maxId =  this.session.selectOne("mapper.imageMapper.getMaxId");
		if(maxId == null) maxId = 0;
			return maxId;
	}//投稿の番号で検索

	public void putImageBBS(ImageBBS bbs) {//投稿の挿入
		this.session.insert("mapper.imageMapper.putImageBBS", bbs);
	}

	public List<ImageBBS> getAllImages(FromTo ft) {
		List<ImageBBS> list = session.selectList("mapper.imageMapper.getAllImages",ft);
		return list;
	}

	public Integer getImageCount() {
		return session.selectOne("mapper.imageMapper.getImageCount");
	}

	public ImageBBS getImage(Integer id) {
		return session.selectOne("mapper.imageMapper.getImage",id);
	}

	public void deleteImage(Integer id) {
		session.delete("mapper.imageMapper.deleteImage", id);
	}

	public void updateImage(ImageBBS bbs) {
		session.update("mapper.imageMapper.updateImage", bbs);
	}

	public void updateOrderNo(ImageBBS bbs) {
		session.update("mapper.imageMapper.updateOrderNo",bbs);
	}
	
}
