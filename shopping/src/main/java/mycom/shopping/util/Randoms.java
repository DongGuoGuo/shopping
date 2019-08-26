package mycom.shopping.util;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Random;
public class Randoms {

    /**
     * 该方法是通过Math.random()获取[0.0, 1.0)的随机数，再乘以需要的位数。这里用乘9，再加1，
     * 而没有用乘10的方式，是为了防止生成的随机数比较小，导致乘以位数后小于指定位数。
     * @param len
     * @return
     */
    public static String getRandom1(int len) {
        int rs = (int) ((Math.random() * 9 + 1) * Math.pow(10, len - 1));
        return String.valueOf(rs);
    }

    /**
     * 通过Random类
     * 该方法是通过Random类的nextInt(9)方法可以直接获取一个[0,9]的随机整数，然后通过指定次数的循环，
     * 来拼接随机数。Random类其实还有一些的生成随机数的方法，有兴趣可以了解一下。
     * @param len
     * @return
     */
    public static String getRandom2(int len) {
        Random r = new Random();
        StringBuilder rs = new StringBuilder();
        for (int i = 0; i < len; i++) {
            rs.append(r.nextInt(10));
        }
        return rs.toString();
    }

    /**
     * 过Random类
     * 该方法也是通过Random类，不同的是，通过指定随机数的最大值，来生成指定位数的随机整数，
     * 因为有可能位数不足，所以当小于指定位数的时候需要加上指定位数的值。举例：要生成一个4位数的随机值，
     * 那么就是生成一个小于10000的随机整数，当随机数小于1000时，加上1000，来确保位数。
     * @param len
     * @return
     */
    public static String getRandom3(int len) {
        int digit = (int) Math.pow(10, len - 1);
        int rs = new Random().nextInt(digit * 10);
        if (rs < digit) {
            rs += digit;
        }
        return String.valueOf(rs);
    }


    /**
     * 通过指定数据源
     * 该方法是预设一个数据源，然后通过Random类的nextInt方法获取到一个随机整数，将这个整数作为数据源数组的下标，
     * 再通过循环的方法来组成一个随机数。这里还可以在数据源中补充上字母，就相当于生成带字母的验证码。
     * @param len
     * @return
     */
    public static String getRandom4(int len) {
        String source = "0123456789";
        Random r = new Random();
        StringBuilder rs = new StringBuilder();
        for (int j = 0; j < len; j++) {
            rs.append(source.charAt(r.nextInt(10)));
        }
        return rs.toString();
    }


    /**
     * PS：获取不重复的随机值
     * 前面几种方法获取指定个数的随机数，其中是有可能有重复值的。如果想要获取不重复的随机值，
     * 也很简单，获取随机值的方式可以不变，只要把获取到的随机值都放进Set集合，直到达到需要的个数就ok了。
     * @param len
     * @param num
     * @return
     */
    public static List<String> getDistinctRandom(int len, int num) {
        Set<String> s = new HashSet<>();
        while (s.size() < num) {
            s.add(getRandom4(len));
        }
        return new ArrayList<>(s);
    }
}
