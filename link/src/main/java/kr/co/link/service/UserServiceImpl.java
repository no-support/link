package kr.co.link.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.UserDao;
import kr.co.link.vo.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;
	
	// 로그인 시도한 아이디의 사용자정보 가져오기
	@Override 
	public User login(String userId, String password) throws Exception {
		User user = userDao.getUserById(userId);
		if(user==null) {
			throw new Exception("아이디가 없습니다.");
		}
		if(!password.equals( user.getPassword() )) {
			throw new Exception("비밀번호가 틀립니다.");
		}
		return user;
	}

	@Override
	public User getUserById(String userId) {
		User user = userDao.getUserById(userId);
		return user;
	}

	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	// 회원가입
	@Override
	public void addUser(User user) {
		userDao.addUser(user);
	}
	
	@Override
	public String profileImageSaveDirectory() {
		String profileImageSaveDirectory = "C:/Users/allma/git/link/link/src/main/webapp/resources/images";
		
		return profileImageSaveDirectory;
	}
}
