package gimsehyeon.yoyangscombine.service.mail;

public interface MailService {
	boolean sendMail(String subject, String text, String from, String to, String filePath);
	String createMailContent(String authCode);
}