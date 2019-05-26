package com.ysd.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Component;

import sun.misc.BASE64Encoder;
@Component
public class MD5 {
public  String MD5jia(String inStr) {
	String pwd2="";
	try {
		MessageDigest md5=MessageDigest.getInstance("MD5");
		/*inStr=new BigInteger(1,md5.digest(inStr.getBytes())).toString(30);
		inStr=new String(inStr.getBytes());*/
	        byte b1[] = inStr.getBytes();
	        byte[] b2 = md5.digest( b1 );
		BASE64Encoder en = new BASE64Encoder();
		pwd2 = en.encode(b2);
	} catch (NoSuchAlgorithmException e) {
		
		e.printStackTrace();
	}
	
	return pwd2;
}
public String MD5jie(String inStr) {
	char[] c=inStr.toCharArray();
	for (int i = 0; i < c.length; i++) {
		c[i]=(char) (c[i]^'t');
	}
	String s=new String(c);
	return s;
}
}
