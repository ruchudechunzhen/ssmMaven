package com.zhiyou100.Util;

import java.security.GeneralSecurityException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


import com.sun.mail.util.MailSSLSocketFactory;

/**
 * @author: Qiushiju
 * @Description:邮件发送
 */  
public class EmailUtil {

	/**
	 * @param toEmailAddress 邮件接收人的地址
	 * @param emailTitle	邮件标题
	 * @param emailContent 	邮件内容
	 * @throws GeneralSecurityException 
	 * @throws MessagingException 
	 */
	public static void sendEmail(String toEmailAddress,String emailTitle,String emailContent) throws GeneralSecurityException, MessagingException{
		// 定义Properties对象,设置环境信息
		Properties props = new Properties();
		
		// 开启debug调试
		props.setProperty("mail.debug", "true");
		// 发送邮件的服务需要验证-->目前是以qq邮件作为邮件服务器
		props.setProperty("mail.smtp.auth", "true");
		// 设置邮件服务器主机名
		props.setProperty("mail.host", "smtp.qq.com");
		// 发送邮件协议名称
        props.setProperty("mail.transport.protocol", "smtp");
        /**SSL认证，注意腾讯邮箱是基于SSL加密的，所有需要开启才可以使用**/
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.socketFactory", sf);
        // 创建会话
        Session session = Session.getInstance(props);
        // Message的实例对象表示一封电子邮件
        Message msg = new MimeMessage(session);
        // 设置邮件主题
        msg.setSubject(emailTitle);
        // 设置邮件的文本内容
        msg.setText(emailContent);
        // 设置发件人邮箱
        msg.setFrom(new InternetAddress("975903522@qq.com"));
        // 从session的环境中获取发送邮件的对象
        Transport transport = session.getTransport();
        // 连接邮件服务器
        /*参数的意思:
         * host: 邮件服务器
         * user: 发件人邮箱
         * password: 开启smtp服务,返回的授权码
         */
        transport.connect("smtp.qq.com", "975903522@qq.com", "xuhoooycxabnbeic");
        // 发送邮件: 参数1 邮件对象 参数2 接收人地址数组
        transport.sendMessage(msg, new Address[]{new InternetAddress(toEmailAddress)});
        // 关闭
        transport.close();
	}
	
	
	public static void main(String[] args) throws GeneralSecurityException, MessagingException {
		int floor = (int) Math.floor(Math.random()*999999);
		String random = String.valueOf(floor);
		sendEmail("a975903522@163.com", "验证码",random);
	}

}