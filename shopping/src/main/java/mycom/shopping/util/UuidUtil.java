package mycom.shopping.util;

import java.util.UUID;

public class UuidUtil {
    public static String getUuid(){
        return UUID.randomUUID().toString().replace("-","");
    }
    public static void main(String[] args) {
        System.out.println(UuidUtil.getUuid()+ UuidUtil.getUuid());
        System.out.println(UuidUtil.getUuid());
        System.out.println(UuidUtil.getUuid());
        System.out.println(UuidUtil.getUuid());
    }
}
