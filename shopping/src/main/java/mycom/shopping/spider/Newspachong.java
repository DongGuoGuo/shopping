//package mycom.shopping.spider;
//
//
//import mycom.shopping.domain.News;
//import org.jsoup.nodes.Element;
//import org.jsoup.select.Elements;
//
//import java.util.ArrayList;
//import java.util.List;
//import static mycom.shopping.util.HttpClient.getBody;
//
//
//public class Newspachong {
//    static int i=0;
//
//    public static Elements getNews(Element body, String className){
//        Elements elements = body.getElementsByClass(className);
//        Elements ul = elements.select("ul");
//        return ul;
//    }
//
//    public static List<News> getInfo(Element body, String className){
//        System.out.println((i++));
//        List<News> list = new ArrayList<News>();
//        Elements elements = body.select("li");
////        System.out.println(elements);
////        System.out.println("......................................");
//        for(Element element:elements){
//            String href = element.select("a").attr("href");
//            String info = element.select("a").text();
////            System.out.println(href);
////            System.out.println(info);
////            System.out.println("------------------------------------");
//            list.add(new News(href,info));
//        }
//        return list;
//    }
//
//
//    public static void main(String[] args) {
//        Element body = getBody("https://www.sina.com.cn/");
//        Elements news = getNews(body,"top_newslist");
//        System.out.println(news);
//        List<News> guowai = getInfo(news.get(0), "news_top");
//        List<News> guonei = getInfo(news.get(2), "news_top");
//        List<News> shehui = getInfo(news.get(4), "news_top");
//        List<News> redian = getInfo(news.get(1), "news_top");
//    }
//}
