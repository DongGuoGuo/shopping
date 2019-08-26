package mycom.shopping.filter;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * 拦截器必须实现HandlerInterceptor接口
 */
public class loginFilter implements HandlerInterceptor {
    public static List<String> flag_Session = new ArrayList<String>();

    public loginFilter() {
        System.out.println("登录控制器执行了");
    }

    //设置不拦截的请求
    private static final String[] IGNORE_URI = {
            "/transpond/shoppingcart",
            "/transpond/gouwuche",
            "/transpond/allorder"}; //重置密码
//    private static final String[] IGNORE_URI = {"index.jsp"};

    /**
     * 该方法将在整个请求完成之后执行， 主要作用是用于清理资源的，
     * 该方法也只能在当前Interceptor的preHandle方法的返回值为true时才会执行。
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception exception) throws Exception {
//        System.out.println("这里是1AuthorizationInterceptor afterCompletion --> ");
    }

    /**
     * 该方法将在Controller的方法调用之后执行， 方法中可以对ModelAndView进行操作 ，
     * 该方法也只能在当前Interceptor的preHandle方法的返回值为true时才会执行。
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mv) throws Exception {
//        System.out.println("这里是2AuthorizationInterceptor postHandle --> ");
    }

    /**
     * preHandle方法是进行处理器拦截用的，该方法将在Controller处理之前进行调用，
     * 该方法的返回值为true拦截器才会继续往下执行，该方法的返回值为false的时候整个请求就结束了。
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        System.out.println("这里是3AuthorizationInterceptor preHandle --> ");
        //获取请求的路径进行判断
        String servletPath = request.getServletPath();
        System.out.println("请求的路径" + servletPath);

        for (String string : flag_Session) {
            System.out.println("所有标志" + string);
        }
        boolean flag = false;    //true为拦截
        //判断请求是否需要拦截
        for (String s : IGNORE_URI) {
            if (servletPath.contains(s)) {
                System.out.println(servletPath.contains(s));
                System.out.println("该请求不需要拦截验证");
                flag = true;
                break;
            }
            flag = false;
        }

        if (flag) {
            //拦截
            String Session_username = (String) request.getSession().getAttribute("username");
            System.out.println("ID标识" + Session_username);
            if (flag_Session.contains(Session_username)) {
                System.out.println("ID标识是" + Session_username);
                return true;
            } else {
                System.out.println("ID标识不对或不存在");
                System.out.println("请先登录再访问网站");
                request.setAttribute("message", "请先登录再访问网站");
                request.getRequestDispatcher("/transpond/login").forward(request, response);
                return false;
            }
        }else {
            //不拦截
            return true;
        }
    }
}