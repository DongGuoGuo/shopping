package mycom.shopping;

import mycom.checkEmail.CheckEmail;
import org.junit.Test;

public class test {
    @Test
    public void test(){
        boolean b = CheckEmail.checkEmail("16@qq.com");
        System.out.println(b);
    }
}
