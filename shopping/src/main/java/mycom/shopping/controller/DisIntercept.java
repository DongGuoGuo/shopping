package mycom.shopping.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import mycom.shopping.domain.ResultObject;
import mycom.shopping.domain.User;
import mycom.shopping.filter.loginFilter;
import mycom.shopping.service.DisInterceptUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping(path = "disIntercept")
public class DisIntercept {

    @Autowired
    private DisInterceptUserService disInterceptUserService;
    @Autowired
    private ObjectMapper mapper;

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


    /**
     * 跳转到登陆界面
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    @RequestMapping(path = "toLogin")
    public void ToLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("转发中");
        request.getRequestDispatcher("/login.jsp").forward(request,response);
        return;
    }

    /**
     * 跳转到注册界面
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    @RequestMapping(path = "toRegister")
    public void ToRegister(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("转发中");
        request.getRequestDispatcher("/register.jsp").forward(request,response);
        return;
    }

    /**
     * 用户注册处理
     * @param user
     * @param response
     * @throws Exception
     */
    @RequestMapping(path = "register")
    public void register(User user, HttpServletResponse response) throws Exception {
        System.out.println("用户处理"+user);
        ResultObject resultObject = disInterceptUserService.registerUser(user);
        System.out.println(resultObject);
        Returnresult(resultObject,response);
        return;
    }

    /**
     * 用户激活处理
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(path = "userActivate")
    public void userActivate(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String email = request.getParameter("email");
        String code = request.getParameter("code");
        System.out.println("收到激活信息");
        System.out.println(email+":"+code);
        ResultObject resultObject = disInterceptUserService.activateUser(email, code);
        Returnresult(resultObject,response);
        return;
    }

    /**
     * 用户登陆处理
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(path = "userLogin")
    public void userLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String username = request.getParameter("username");
        String password1 = request.getParameter("password");
//        String id = request.getParameter("id");

        System.out.println("来到用户登陆"+username+password1);
//        String password = MD5.getResult(password1);
        ResultObject resultObject=new ResultObject();
        boolean isUser = disInterceptUserService.isUser(username,password1);
        System.out.println("查找结果"+isUser);
        if(isUser){
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            loginFilter.flag_Session.add(username);
            resultObject.setResult(true);
            System.out.println("存在");
        }else {
            resultObject.setResult(false);
            resultObject.setMsg("账户或密码错误");
            System.out.println("bu 存在");
        }
        Returnresult(resultObject,response);
    }


}
