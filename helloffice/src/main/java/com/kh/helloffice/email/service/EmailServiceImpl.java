package com.kh.helloffice.email.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.groovy.util.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.kh.helloffice.email.dao.EmailDao;
import com.kh.helloffice.email.handler.MailHandler;
import com.kh.helloffice.hr.entity.DeptDto;

@Service
public class EmailServiceImpl implements EmailService{
	
	@Autowired
	private EmailDao dao;
	
	@Autowired
	private JavaMailSender sender;

	@Override
	public Map<String, Object> send(String title, String body, String empName, String email, String empRank, int adminLevel, String empPosition, String depName, int depNo) {
		
		
		
		MailHandler mail;
		
		MimeMessage message = sender.createMimeMessage();
		
		try {
			
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setSubject("Welcome to Helloffice! "+ empName +"님, 회원가입을 진행해주세요!");
			
			String htmlStr = body + "<div style=\"margin: auto; height: 300px; width: 300px; background-color: white; border-radius: 20px; box-shadow: 1px 1px 5px rgb(215, 215, 215);\"><a style=\"font-size: x-large; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; display: block; text-align: center; padding-top: 30px; color: rgb(234, 50, 4); font-weight: 600;\" href='http://127.0.0.1:8888/helloffice/member/join?empName="+empName+"&empRank="+empRank+"&adminLevel="+adminLevel+"&empPosition="+empPosition+"&depName="+depName+"&depNo="+depNo+"'>Click Me!</a></div>";
			messageHelper.setText(htmlStr, true);
			
			messageHelper.setFrom("forkhacademy@gmail.com", "Helloffice");
			
			messageHelper.setTo(new InternetAddress(email, empName, "UTF-8"));
			// 첨부할 파일 객체 생성
//			DataSource dataSource = new FileDataSource("C:\\Users\\ekdms\\Desktop\\warm.gif"); //절대경로
			// MimeMessageHelper 파일 객체를 추가
//			messageHelper.addAttachment(MimeUtility.encodeText("warm.gif", "UTF-8", "B"), dataSource);
			
			// 전송
			sender.send(message);
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		try {
//			mail = new MailHandler(sender);
//			mail.setFrom("no-reply@noreply.com", "Helloffice");
//			mail.setTo(email);
//			mail.setSubject(title);
//			mail.setText(body+"<a>안</a>");
//			mail.send();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		String resultCode = "S-1";
		String msg = "메일이 발송되었습니다.";
		return Maps.of("resultCode", resultCode, "msg", msg);
	}

	
	
	
	@Override
	public List<DeptDto> getDeptList() throws Exception {
		return dao.getDeptList();
	}

}

