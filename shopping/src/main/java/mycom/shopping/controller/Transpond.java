package mycom.shopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "transpond")
public class Transpond {
    @RequestMapping(path = "login")
    public String login(){
        return "login";
    }

    @RequestMapping(path = "register")
    public String register(){
        return "register";
    }

    @RequestMapping(path = "index")
    public String index(){
        return "index";
    }

    @RequestMapping(path = "search")
    public String search(){
        return "search";
    }

    @RequestMapping(path = "show")
    public String show(){
        return "show";
    }

    @RequestMapping(path = "test")
    public String totest(){
        return "test";
    }


    @RequestMapping(path = "order")
    public String order(){
        return "order";
    }


    @RequestMapping(path = "gouwuche")
    public String gouwuche(){
        return "gouwuche";
    }


    @RequestMapping(path = "xiugai")
    public String xiugai(){
        return "xiugai";
    }

    @RequestMapping(path = "allorder")
    public String allorder(){
        return "allorder";
    }


    @RequestMapping(path = "admin")
    public String admin(){
        return "manage";
    }
    @RequestMapping(path = "goodstianjia")
    public String goodstianjia(){
        return "goodstianjia";
    }
    @RequestMapping(path = "goodsxiugai")
    public String goodsxiugai(){
        return "goodsxiugai";
    }
    @RequestMapping(path = "goodsshanchu")
    public String goodsshanchu(){
        return "goodsshanchu";
    }
    @RequestMapping(path = "goodsmanage")
    public String goodsmanage(){
        return "goodsmanage";
    }

    @RequestMapping(path = "toadminlogin")
    public String toAdminlogin(){
        return "login1";
    }


}
