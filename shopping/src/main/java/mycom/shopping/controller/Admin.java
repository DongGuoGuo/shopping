package mycom.shopping.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import mycom.shopping.domain.Goods;
import mycom.shopping.domain.ResultObject;
import mycom.shopping.domain.Shop;
import mycom.shopping.service.AdminService;
import mycom.shopping.service.GoodsService;
import mycom.shopping.util.StringToDouble;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(path = "admin")
public class Admin {
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private ObjectMapper mapper;
    @Autowired
    private AdminService adminService;

    private void Returnresult(ResultObject resultObject, HttpServletResponse response) throws Exception {
        String json = mapper.writeValueAsString(resultObject);
        System.out.println("json:" + json);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }

    private ResultObject NewResultObject(boolean result, Object data, String msg) {
        return new ResultObject(result, data, msg);
    }


    @RequestMapping(path = "addGoods")
    public void addGoods(Goods goods, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String Session_username = (String) request.getSession().getAttribute("shop_name");
        goods.setGoods_shop(StringToDouble.toInt(Session_username));
        boolean b = goodsService.saveUser(goods);
        if (b) {
            Returnresult(NewResultObject(true, null, "添加成功"), response);
            return;
        } else {
            Returnresult(NewResultObject(false, null, "添加失败"), response);
            return;
        }
    }


    @RequestMapping(path = "deleteGoods")
    public void deleteGoods(String str_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        int i = StringToDouble.toInt(str_id);
        System.out.println("i的值为" + i);
        boolean b = goodsService.deleteGoods(i);
        if (b) {
            Returnresult(NewResultObject(true, null, "删除成功"), response);
            return;
        } else {
            Returnresult(NewResultObject(false, null, "删除失败"), response);
            return;
        }
    }


    @RequestMapping(path = "updataGoods")
    public void updataGoods(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String goods_name = request.getParameter("mingcheng");
        String goods_price = request.getParameter("danjia");
        String id = request.getParameter("id");


        Goods byGoods_id = goodsService.findByGoods_id(id);
        System.out.println(byGoods_id);

        byGoods_id.setGoods_name(goods_name);
        byGoods_id.setGoods_price(goods_price);
        boolean b = goodsService.updataUser(byGoods_id);
        if (b) {
            Returnresult(NewResultObject(true, null, "更新成功"), response);
            return;
        } else {
            Returnresult(NewResultObject(false, null, "更新失败"), response);
            return;
        }

    }


    @RequestMapping(path = "queryGoods")
    public void queryGoods(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String shop_name = (String) request.getSession().getAttribute("shop_name");
        List<Goods> b = goodsService.findShopAll(shop_name);
        if (b.size() > 0) {
            Returnresult(NewResultObject(true, b, "查询成功"), response);
            return;
        } else {
            Returnresult(NewResultObject(false, null, "查询失败，或者没有数据"), response);
            return;
        }
    }

    @RequestMapping(path = "adminlogin")
    public void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String adminname = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(adminname + "  " + password);
        Shop byAdminname = adminService.findByAdminname(adminname);
        System.out.println(byAdminname);
        if (byAdminname.getShop_password().equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("shop_name", byAdminname.getShop_name());
            Returnresult(NewResultObject(true, null, "登录成功"), response);
            return;
        } else {
            Returnresult(NewResultObject(false, null, "用户不存在"), response);
            return;
        }

    }

    @RequestMapping(path = "manage")
    public String toManage() {
        return "manage";
    }


    @RequestMapping(path = "toadminlogin")
    public String toAdminlogin() {
        return "login1";
    }


}
