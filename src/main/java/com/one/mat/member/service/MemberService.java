package com.one.mat.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.one.mat.member.dao.MemberDAO;
import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.ProfileDTO;

@Service
public class MemberService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberDAO dao;
	
	public MemberDTO login(String member_id, String member_pw) {
		return dao.login(member_id, member_pw);
	}

	public boolean overlayId(String member_id) {
		boolean use = false;
		int cnt = dao.overlayId(member_id);
		if(cnt==0) {
			use=true;
		}
		return use;
	}

	public boolean overlayNick(String member_nickName) {
		boolean use = false;
		int cnt = dao.overlayNick(member_nickName);
		if(cnt==0) {
			use=true;
		}		
		return use;
	}

	public int join(MemberDTO dto) {
		int cnt = dao.join(dto);
		int member_idx = dto.getMember_idx();
		int subsType_code = dto.getSubsType_code();
		setSubsType_code(member_idx, subsType_code);		
		return cnt;
	}
	
	private void setSubsType_code(int member_idx, int subsType_code) {
		dao.setSubsType_code(member_idx, subsType_code);
	}


	public ArrayList<ProfileDTO> loginProf(String member_id, String member_pw) {
		return dao.loginProf(member_id, member_pw);
	}

	public int nameMailChk(MemberDTO dto) {
		return dao.nameMailChk(dto);
	}

	public int userMailChk(MemberDTO dto) {
		return dao.userMailChk(dto);
	}

	public String informId(MemberDTO dto) {
		return dao.informId(dto);
	}

	
	

}
