package mycom.shopping.spider;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import mycom.shopping.domain.Goods;
import mycom.shopping.domain.Jingdong;
import mycom.shopping.domain.ResultObject;
import mycom.shopping.service.GoodsService;
import mycom.shopping.util.StringToDouble;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static mycom.shopping.util.HttpClient.getBody;


public class JingdongPachong {




    @Test
    public void jingdongPachong() {
        GoodsService goodsService = new GoodsService();
        List<Goods> all = goodsService.findAll();
        System.out.println("jieguo"+all.get(0));


//        String path="https://search.jd.com/Search?keyword="+"衣服"+"&enc=utf-8";
//        Element body = getBody(path);
//        Elements j_goodsList = body.getElementsByClass("gl-item");
//        List<Goods> list=new ArrayList<>();
//        Jingdong jingdong = getJingdong(j_goodsList.get(9));
//        Goods goods = new Goods(jingdong.getName(),jingdong.getTupian_uri(),StringToDouble.toDouble(jingdong.getPrice()),1,"衣服",0);
//        list.add(goods);
//        boolean save = save(list);
//        System.out.println(save+"   "+goods);
//        ResultObject resultObject=new ResultObject();
//        if(save){
//            resultObject.setResult(true);
//        }else {
//            resultObject.setResult(false);
//            resultObject.setMsg("保存数据库失败");
//        }
//


    }
    public Jingdong getJingdong(Element element){
        Elements img = element.getElementsByClass("p-img");
        String title = img.select("a").attr("title");
        String img_uri = img.select("img").attr("source-data-lazy-img");
        Elements price = element.getElementsByClass("p-price");
        String i = price.select("i").text();
        return new Jingdong(title,img_uri,i);
    }
    public boolean save(List<Goods> list){
        try{
            for(Goods goods:list){
//                goodsService.saveUser(goods);
            }
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
