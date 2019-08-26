package mycom.shopping.util;

import java.math.BigInteger;
import java.security.MessageDigest;

public class MD5 {
	public static final String KEY_MD5 = "MD5";   


    public static String encode(String message)    {
        BigInteger bigInteger=null;
        try {
         MessageDigest md = MessageDigest.getInstance(KEY_MD5);
         byte[] inputData = message.getBytes(); 
         md.update(inputData);   
         bigInteger = new BigInteger(md.digest());   
        } catch (Exception e) {e.printStackTrace();} 
        return bigInteger.toString(16);
    }
}
