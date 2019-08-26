package mycom.shopping.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import mycom.shopping.dao.INewsDao;
import mycom.shopping.domain.Goods;
import mycom.shopping.domain.News;
import mycom.shopping.domain.ResultObject;
import mycom.shopping.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import static mycom.shopping.filter.loginFilter.flag_Session;

@Controller
@RequestMapping(path = "goodsController")
public class GoodsController {
    @Autowired
    private ObjectMapper mapper;
    @Autowired
    private GoodsService goodsService;

    @Autowired
    private INewsDao iNewsDao;
    /**
     * 向前端返回josn数据结果集
     * @param resultObject
     * @param response
     * @throws Exception
     */
    private void Returnresult(ResultObject resultObject, HttpServletResponse response) throws Exception {
        String json = mapper.writeValueAsString(resultObject);
        System.out.println("json:" + json);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }

    private ResultObject NewResultObject(boolean result, Object data, String msg){
        return new ResultObject(result,data,msg);
    }

    @RequestMapping(path = "sousuo")
    public void sousuo(String key, HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Goods> byNamemohu = goodsService.findByNamemohu(key);
        Returnresult(NewResultObject(true,byNamemohu,null),response);
        return;
    }


    @RequestMapping(path = "resou")
    public void resou(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Goods> 衣服 = goodsService.findReSou("衣服");
        List<Goods> 家电 = goodsService.findReSou("家电");
        List<Goods> 图书 = goodsService.findReSou("图书");
        List<Goods> 电脑 = goodsService.findReSou("电脑");
        List<Goods> 手机 = goodsService.findReSou("手机");
        List<Goods> 食品 = goodsService.findReSou("食品");

        showList(衣服);
        showList(家电);
        showList(图书);
        showList(电脑);
        showList(手机);
        showList(食品);




        List< List<Goods>> resou = new ArrayList< List<Goods>>();
        resou.add(衣服.subList(0,8));
        resou.add(家电.subList(0,8));
        resou.add(图书.subList(0,8));
        resou.add(电脑.subList(0,8));
        resou.add(手机.subList(0,8));
        resou.add(食品.subList(0,8));


        Returnresult(NewResultObject(true,resou,null),response);
        return;
    }

    public void showList(List<Goods> list){
        for(Goods goods:list){
            System.out.print(goods);
        }
        System.out.println();
        System.out.println();
        System.out.println();
    }

    @RequestMapping(path = "news")
    public void news(HttpServletResponse response) throws Exception {
        List<News> resou = iNewsDao.findAll("热搜");
        List<News> shehui = iNewsDao.findAll("社会");
        List<News> guonei = iNewsDao.findAll("国内");
        List<News> guowai = iNewsDao.findAll("国外");
        List<List<News>> allnews= new ArrayList<List<News>>();
        allnews.add(resou);
        allnews.add(shehui);
        allnews.add(guonei);
        allnews.add(guowai);

        Returnresult(NewResultObject(true,allnews,null),response);
        return;
    }


    @RequestMapping(path = "xiangxi")
    public void xiangxi(String id,HttpServletResponse response) throws Exception {
        Goods byGoods_name = goodsService.findByGoods_id(id);
        System.out.println("详细查询结果"+byGoods_name);
        Returnresult(NewResultObject(true,byGoods_name,null),response);
        return;
    }



    @RequestMapping(path = "toshow")
    public void toshow(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        System.out.println("转发中");
        request.setAttribute("id",id);
        request.getRequestDispatcher("WEB-INF/jsp/show.jsp").forward(request,response);
        return;
    }


    @RequestMapping(path = "isLogin")
    public void isLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("查看是否登录ID标识");
        String Session_username = (String) request.getSession().getAttribute("username");
        System.out.println("查看是否登录ID标识" + Session_username);
        if (flag_Session.contains(Session_username)) {
            System.out.println("ID标识是" + Session_username);
            Returnresult(NewResultObject(true,Session_username,null),response);
        }else {
            Returnresult(NewResultObject(false,null,null),response);
        }
    }
}
