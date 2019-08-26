package mycom.shopping.util;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import java.io.IOException;

public class HttpClient {
    public static Element getBody(String uri) {
        CloseableHttpClient closeableHttpClient = HttpClients.createDefault();//创建客户端
        HttpGet httpGet = new HttpGet(uri);//创建请求Get实例
        //添加头部信息模拟浏览器访问
        httpGet.setHeader("Accept", "text/html,application/xhtml+xml," +
                "application/xml;q=0.9,image/webp,*/*;q=0.8");
        httpGet.setHeader("Accept-Encoding", "gzip, deflate, sdch, br");
        httpGet.setHeader("Accept-Language", "zh-CN,zh;q=0.8");
        httpGet.setHeader("User-Agent", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36"
                + " (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36");
        try {
            //客户端执行httpGet方法，返回响应
            CloseableHttpResponse closeableHttpResponse = closeableHttpClient.execute(httpGet);
            //得到服务响应状态码
            if (closeableHttpResponse.getStatusLine().getStatusCode() == 200) {
                //得到响应实体
                String entity = EntityUtils.toString(closeableHttpResponse.getEntity(), "utf-8");
//                System.out.println("得到的响应实体 ");
                Document doc = Jsoup.parseBodyFragment(entity);
                Element body = doc.body();
                return body;
            } else {
                //如果是其他状态码则做其他处理
                System.out.println("请求异常!!!");
            }
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
