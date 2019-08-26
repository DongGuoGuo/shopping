package mycom.shopping.util;

public class StringToDouble {
    public static double toDouble(String string){
        try {
            Double aDouble = Double.valueOf(string);
            return aDouble;
        }catch (Exception e){
            e.getStackTrace();
            return 0;
        }
    }
    public static int toInt(String string){
        try {
            int a = Integer.parseInt(string);
            return a;
        }catch (Exception e){
            e.getStackTrace();
            return 0;
        }
    }
}
