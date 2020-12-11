package gimsehyeon.yoyangscombine.service.mail;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {
	@Autowired
	private JavaMailSender javaMailSender;

	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	@Override
	public boolean sendMail(String subject, String text, String from, String to, String filePath) {
		MimeMessage message = javaMailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject(subject);
			helper.setText(text, true);
			helper.setFrom(from);
			helper.setTo(to);
			
			// 첨부 파일 처리
			if (filePath != null) {
				File file = new File(filePath);
				if (file.exists()) {
					helper.addAttachment(file.getName(), new File(filePath));
				}
			}
			
			javaMailSender.send(message);
			
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public String createMailContent(String authCode) {
		String mailContent = "";
		
		mailContent += "<meta name='viewport' content='width=device-width, initial-scale=1' charset='utf-8'>";
		mailContent += "<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>";
		mailContent += "<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>";
		mailContent += "<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>";
		mailContent += "<link rel='stylesheet'href='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>";
		mailContent += "<link rel='stylesheet' href='../common/lib.css' type='text/css'>";
		mailContent += "<style> #accredit_img {	width: 100px; height: 100px; border: 1px solid black; } </style>";
		mailContent += "<div class='container'>";
		mailContent += "<div class='row'>";
		mailContent += "	<div class='col-10' style='text-align:center;'>";
		mailContent += "		<a href='../main.html'><div id='login_img' style='float:left;'>로고이미지 150x80</div></a>";
		mailContent += "		<div style='padding:50 65 0 0;'><h4>가입 인증 메일</h4></div>";
		mailContent += "	</div>";
		mailContent += "</div>";
		mailContent += "<hr size='2' color='gray' align='left'>";
		mailContent += "<div class='row'>";
		mailContent += "	<div class='ml-2'>";
		mailContent += "		<h4><i>요양스컴바인에 지대한 관심 감사합니다!</i></h4><br>";
		mailContent += "	요양스컴바인 가입 인증번호입니다.<br>";
		mailContent += "	인증번호란에 아래 인증번호를 입력하시고<br>";
		mailContent += "	본인인증 및 회원가입을 완료해주세요!<br><br>";
		mailContent += "	<h4>" + authCode + "</h4>";
		mailContent += "	<br><br>";
		mailContent += "	</div>";
		mailContent += "</div>";
		mailContent += "<div class='row justify-content-center'>";
		mailContent += "	<div>";
		mailContent += "	<h5>좋은 하루 되세요!</h5>";
		mailContent += "	<div id='accredit_img'>홍보이미지 100x100</div>";
		mailContent += "	</div>";
		mailContent += "</div>";
		mailContent += "<hr size='2' color='gray' align='left'>";
		mailContent += "<pre>";
		mailContent += "INFO: ";
		mailContent += "(주)요양스컴바인 대표 김세현 서울시 00동 00로 00길 00-00 ";
		mailContent += "고객문의: 대표번호 0000-0000 | 이메일 yoyangsCombined@yoyang.kr 2020ⓒ All rights reserved<br>";
		mailContent += "</pre>";
		mailContent += "</div>";
		
		return mailContent;
	}
}