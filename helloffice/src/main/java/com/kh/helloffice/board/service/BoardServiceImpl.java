package com.kh.helloffice.board.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.board.dao.BoardDao;
import com.kh.helloffice.board.entity.PageVo;
import com.kh.helloffice.board.entity.PostDto;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao dao;

	@Override
	public List<PostDto> getList(PageVo pageVo, String category) throws Exception {
		
		List<PostDto> postList = dao.getList(pageVo);
		postList = formatPost(postList);
		
		return postList;
	}

	@Override
	public int post(PostDto post) throws Exception {
		return dao.post(post);
	}

	@Override
	public PostDto getPost(long no) throws Exception {
		return dao.getPost(no);
	}

	@Override
	public int editPost(PostDto post) throws Exception {
		return dao.editPost(post);
	}

	@Override
	public int deletePost(long no) throws Exception {
		return dao.deletePost(no);
	}

	@Override
	public int getTotalPostNum(long boardNo) throws Exception {
		return dao.getTotalPostNum(boardNo);
	}

	@Override
	public List<PostDto> getRecentList() throws Exception {
		
		List<PostDto> postList = dao.getRecentList();
		postList = formatPost(postList);
		
		return postList;
	}
	
	private List<PostDto> formatPost(List<PostDto> postList){
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
		
		for (PostDto post : postList) {
			Date createdTime = post.getCreatedTime();
			post.setDateString(dateFormat.format(createdTime));
			post.setTimeString(timeFormat.format(createdTime));
		}
		
		return postList;
	}

}
