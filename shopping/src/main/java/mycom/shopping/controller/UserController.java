package mycom.shopping.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import mycom.shopping.domain.ResultObject;
import mycom.shopping.domain.User;
import mycom.shopping.service.UserService;
import mycom.shopping.util.Randoms;
import mycom.shopping.util.Sendmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping(path = "UserController")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private ObjectMapper mapper;

    private void Returnresult(ResultObject resultObject, HttpServletResponse response) throws Exception {
        String json = mapper.writeValueAsString(resultObject);
        System.out.println("json:" + json);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }

    private ResultObject NewResultObject(boolean result, Object data, String msg){
        return new ResultObject(result,data,msg);
    }

    @RequestMapping(path = "gerenEmail")
    public void gerenEmail(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String Session_username = (String) request.getSession().getAttribute("username");
        String newemail = request.getParameter("newemail");
        String code = request.getParameter("code");

        System.out.println(code);
        System.out.println(newemail);
        User userByUsername = userService.findUserByUsername(Session_username);
        System.out.println(userByUsername);
        if(userByUsername.getCode().equals(code)){
            userByUsername.setEmail(newemail);
            boolean b = userService.updateUser(userByUsername);
            if(b){
                Returnresult(NewResultObject(true,null,"邮箱修改成功"),response);
                return;
            }
        }
        Returnresult(NewResultObject(false,null,"邮箱修改失败"),response);
        return;
    }

    @RequestMapping(path = "getEmailCode")
    public void getEmailCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String Session_username = (String) request.getSession().getAttribute("username");

        User userByUsername = userService.findUserByUsername(Session_username);
        System.out.println(userByUsername);
        String random2 = Randoms.getRandom2(4);
        System.out.println();
        userByUsername.setCode(random2);
        System.out.println(userByUsername);
        boolean b = userService.updateUser(userByUsername);
        if(b){
            Sendmail sendmail=new Sendmail();
            String str="操作验证码为:" +
                    random2+
                    "   此次操作为更换邮箱，更换成功后可以使用新邮箱登录。";
            try {
                sendmail.Send("邮箱更换验证",str,userByUsername.getEmail());
                Returnresult(NewResultObject(true,null,"邮箱验证码发送成功，请查收"),response);
                return;
            }catch (Exception e){

            }
        }
        Returnresult(NewResultObject(false,null,"邮箱验证码发送失败，请稍后再试"),response);
        return;
    }

    @RequestMapping(path = "xiugaimima")
    public void xiugaimima(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String jiu = request.getParameter("jiu");
        String xin = request.getParameter("xin");
        System.out.println(jiu+"    "+xin);
        String Session_username = (String) request.getSession().getAttribute("username");
        User userByUsername = userService.findUserByUsername(Session_username);
        System.out.println(userByUsername);
        if(userByUsername.getPassword().equals(jiu)){
            userByUsername.setPassword(xin);
            userService.updateUser(userByUsername);
            Returnresult(NewResultObject(true,null,"密码修改成功"),response);
            return;
        }else {
            Returnresult(NewResultObject(false,null,"密码修改失败"),response);
            return;
        }
    }



    @RequestMapping(path = "getxinxi")
    public void getxinxi(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String Session_username = (String) request.getSession().getAttribute("username");
        User userByUsername = userService.findUserByUsername(Session_username);
        System.out.println(userByUsername);

        Returnresult(NewResultObject(true,userByUsername,"密码修改成功"),response);

    }




    @RequestMapping(path = "logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        session.removeAttribute("username");
        Returnresult(NewResultObject(true,null,"成功退出登录"),response);
    }


    @RequestMapping(path = "mytest")
    public void mytest(HttpServletRequest request, HttpServletResponse response){
        String jiu1 = request.getParameter("jiu1");
        String jiu2 = request.getParameter("jiu2");
        String jiu3 = request.getParameter("jiu3");
        System.out.println("123123"+jiu1+" "+jiu2+" "+jiu3);
    }
}
