package com.qms.user.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qms.table.vo.user.UserInfoVO;
import com.qms.user.vo.UserVO;

@Repository
public interface UserDao {
	public List<UserInfoVO> selectUserSearch(UserInfoVO vo) throws Exception;
	
	public int selectUserSearchCount(UserVO vo) throws Exception;
}
