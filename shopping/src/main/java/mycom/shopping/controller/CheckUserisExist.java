package mycom.shopping.controller;

import com.fasterxml.jackson.databind.ObjectMapper;

import mycom.checkEmail.CheckEmail;
import mycom.shopping.domain.ResultObject;
import mycom.shopping.domain.User;
import mycom.shopping.service.DisInterceptUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping(path = "checkUserisExist")
public class CheckUserisExist {

    @Autowired
    DisInterceptUserService disInterceptUserService;
    @Autowired
    private ObjectMapper mapper;

    /**
     * 检查用户名是否重复
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping(path = "checkUsername")
    public void CheckUsername(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //设置字符编码集
        System.out.println("已经到了username查重这里啦");
        String username = request.getParameter("username");
        User byUsername = disInterceptUserService.findByUsername(username);
        ResultObject resultObject = new ResultObject();
        if (byUsername != null) {
            resultObject.setResult(true);
            resultObject.setMsg("该用户名已经被占用");
        } else {
            resultObject.setResult(false);
        }
        String json = mapper.writeValueAsString(resultObject);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }


    /**
     * 检查邮箱是否重复
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping(path = "checkEmail")
    public void CheckEmail(HttpServletRequest request, HttpServletResponse response) throws IOException {


        String email = request.getParameter("email");
        System.out.println(email + "已经到了email查重这里啦");
        ResultObject resultObject = new ResultObject();
//
        System.out.println("邮箱存在");
        User byEmail = disInterceptUserService.findByUsername(email);
        if (byEmail != null) {
            resultObject.setResult(true);
            resultObject.setMsg("该邮箱已经被注册过");
        } else {
            resultObject.setResult(false);
        }
//

        String json = mapper.writeValueAsString(resultObject);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }
}
