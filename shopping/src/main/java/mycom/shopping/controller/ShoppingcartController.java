package mycom.shopping.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import mycom.shopping.domain.Goods;
import mycom.shopping.domain.ResultObject;
import mycom.shopping.domain.ShoppingCart;
import mycom.shopping.service.CartService;
import mycom.shopping.service.GoodsService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping(path = "ShoppingcartController")
public class ShoppingcartController {
    @Autowired
    private CartService cartService;
    @Autowired
    private ObjectMapper mapper;
    @Autowired
    private GoodsService goodsService;
    private void Returnresult(ResultObject resultObject, HttpServletResponse response) throws Exception {
        String json = mapper.writeValueAsString(resultObject);
        System.out.println("json:" + json);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }

    private ResultObject NewResultObject(boolean result, Object data, String msg){
        return new ResultObject(result,data,msg);
    }

    @RequestMapping(path = "saveShoppingCart")
    public void saveShoppingCart( String id, String size, String goodnum, HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println(id);
        System.out.println(size);
        System.out.println(goodnum);
        String Session_username = (String) request.getSession().getAttribute("username");

        Goods byGoods_id = goodsService.findByGoods_id(id);
        System.out.println(byGoods_id);
        ShoppingCart shoppingCart = new ShoppingCart();
        shoppingCart.setGoods_name(byGoods_id.getGoods_name());
        shoppingCart.setGoods_img(byGoods_id.getGoods_img());
        shoppingCart.setGoods_price(byGoods_id.getGoods_price());
        shoppingCart.setGoods_size(size);
        shoppingCart.setGoods_amount(goodnum);
        shoppingCart.setCart_is("N");
        shoppingCart.setUser_name(Session_username);
        System.out.println(shoppingCart);
        cartService.saveShoppingCart(shoppingCart);
        response.sendRedirect(request.getContextPath()+"/transpond/gouwuche");
        return;
    }


    @RequestMapping(path = "saveShoppingCart1")
    public void saveShoppingCart1( String id, String size, String goodnum, HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println(id);
        System.out.println(size);
        System.out.println(goodnum);
        String Session_username = (String) request.getSession().getAttribute("username");

        Goods byGoods_id = goodsService.findByGoods_id(id);
        System.out.println(byGoods_id);
        ShoppingCart shoppingCart = new ShoppingCart();
        shoppingCart.setGoods_name(byGoods_id.getGoods_name());
        shoppingCart.setGoods_img(byGoods_id.getGoods_img());
        shoppingCart.setGoods_price(byGoods_id.getGoods_price());
        shoppingCart.setGoods_size(size);
        shoppingCart.setGoods_amount(goodnum);
        shoppingCart.setCart_is("N");
        shoppingCart.setUser_name(Session_username);
        System.out.println(shoppingCart);
        cartService.saveShoppingCart(shoppingCart);

        try {
            Returnresult(NewResultObject(true,null,"添加购物车成功！！！"),response);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return;
    }


    @RequestMapping(path = "findAll1")
    public void findAll1(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String Session_username = (String) request.getSession().getAttribute("username");

        List<ShoppingCart> all1 = cartService.findAll1(Session_username);
        if(all1.size()!=0){
            Returnresult(NewResultObject(true,all1,null),response);
        }else {
            Returnresult(NewResultObject(false,null,"您的购物车是空的！！！"),response);
        }

    }



    @RequestMapping(path = "findAll")
    public void findAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String Session_username = (String) request.getSession().getAttribute("username");
        List<ShoppingCart> all = cartService.findAll(Session_username);
        Returnresult(NewResultObject(true,all,null),response);
    }

    @RequestMapping(path = "deleteShoppingCart")
    public void deleteShoppingCart(int cart_id){
        cartService.deleteShoppingCart(cart_id);
    }



    @RequestMapping(path = "pay")
    public void pay(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("pay");
        String b1 = request.getParameter("b");
        String c1 = request.getParameter("c");
        String[] b = b1.split(",");
        String[] c = c1.split(",");
        for(int i=0;i<b.length;i++){
            System.out.println("开始查找"+b[i]);

            ShoppingCart byGoods_name = cartService.findByGoods_name(b[i]);
            System.out.println(byGoods_name);
            if(byGoods_name!=null){
                byGoods_name.setGoods_amount(c[i]);
                byGoods_name.setCart_is("Y");
                cartService.updataShoppingCart(byGoods_name);


            }
            Goods byGoods_name1 = goodsService.findByGoods_name(b[i]);
            System.out.println("正在给商品加点击量"+byGoods_name1);
            byGoods_name1.setGoods_hits(byGoods_name1.getGoods_hits()+1);
            goodsService.updataUser(byGoods_name1);
        }
        Returnresult(NewResultObject(true,null,"付款成功"),response);

    }
}
