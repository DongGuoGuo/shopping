package mycom.shopping;

import mycom.checkEmail.CheckEmail;
import org.junit.Test;

public class test {
    @Test
//    测试查询邮箱地址是否正确
    public void test(){
        boolean b = CheckEmail.checkEmail("16@qq.com");
        System.out.println(b);
    }
}
