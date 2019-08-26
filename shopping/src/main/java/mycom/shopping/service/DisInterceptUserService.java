package mycom.shopping.service;

import mycom.shopping.dao.IUserDao;
import mycom.shopping.domain.ResultObject;
import mycom.shopping.domain.User;
import mycom.shopping.util.Sendmail;
import mycom.shopping.util.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DisInterceptUserService {
    @Autowired
    private UserService userService;

    @Autowired
    private IUserDao iUserDao;

    /**
     * 用户注册，返回结果对象
     * @param user
     * @return ResultObject结果
     */
    public ResultObject registerUser(User user){
        System.out.println("zhuce"+user);
        ResultObject resultObject=new ResultObject();
        if(user.getUsername().equals("")||user.getEmail().equals("")){
            resultObject.setResult(false);
            resultObject.setMsg("用户注册失败，填写的内容不规范");
        }else {
            user.setStatus("N");
            user.setCode(UuidUtil.getUuid());

            String subject="资源分享网新用户激活验证";
            String content="请点击下面的链接激活用户。http://22683cf223.imwork.net:34068/disIntercept/userActivate?email="+user.getEmail()+"&code="+user.getCode();
            //模拟保存用户
            System.out.println("模拟保存用户 ："+user);
            try {
                Sendmail sendmail=new Sendmail();
                sendmail.Send(subject,content,user.getEmail());
                try{
                    System.out.println("保存用户 ："+user);
                    boolean save = userService.save(user);
                    if(save){
                        System.out.println("保存结果"+save);
                        resultObject.setResult(true);
                        return resultObject;
                    }else {
                        System.out.println("保存结果"+save);
                        resultObject.setResult(false);
                        resultObject.setMsg("用户注册失败，保存数据库失败，请稍后重试");
                        return resultObject;
                    }
                }catch (Exception a){
                    //删除掉刚刚保存的信息jquery-3.3.1.js
                }
            }catch (Exception e){
                System.out.println("保存出错了");
                resultObject.setResult(false);
                resultObject.setMsg("用户注册失败，请稍后重试");
                return resultObject;
            }
        }
        return resultObject;
    }

    /**
     * 用户激活
     * @param email
     * @param code
     * @return
     */
    public ResultObject activateUser(String email, String code){
        ResultObject resultObject=new ResultObject();

        List<User> byEmail = iUserDao.findByEmail(email);

        System.out.println("激活的用户"+byEmail.get(0));


        if(byEmail.size()==1){
            if(byEmail.get(0).getCode().equals(code)){
                byEmail.get(0).setStatus("Y");
                userService.updateUser(byEmail.get(0));
                resultObject.setResult(true);
            }else {
                resultObject.setResult(false);
                resultObject.setMsg("此链接已经失效或者错误");
            }
        }
        return resultObject;
    }


    /**
     * 用户登陆 判断是否存在该用户
     * @return
     */
    public boolean isUser(String user,String password){
        User byUsername = findByUsername(user);
        if(byUsername!=null){
            if(byUsername.getPassword().equals(password)){
                return true;
            }
        }else {
            User byEmail = findByEmail(user);
            if (byEmail!=null){
                if (byEmail.getPassword().equals(password)){
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 根据用户名查找用户   用于登录
     * @param username
     * @return
     */
    public User findByUsername(String username){
        List<User> byUsername = iUserDao.findByUsername(username);
        if (byUsername.size()==1){
            System.out.println("据用户名查找用户"+username);
            return byUsername.get(0);
        }
        return null;
    }

    /**
     * 根据邮箱查找用户   用于登录
     * @param email
     * @return
     */
    public User findByEmail(String email){
        List<User> byEmail = iUserDao.findByEmail(email);
        if (byEmail.size()==1){
            return byEmail.get(0);
        }
        return null;
    }


    /**
     * 查找所有的用户名
     * @return
     */
    public List<String> findAllUsername(){
        System.out.println("Service层");
        List<String> allName = iUserDao.findAllName();
        for (String s:allName){
            System.out.println(s);
        }
        return allName;
    }

    /**
     * 查找所有的邮箱地址
     * @return
     */
    public List<String> findAllEmail(){
        System.out.println("Service层");
        List<String> allEmail = iUserDao.findAllEmail();
        for (String s:allEmail){
            System.out.println(s);
        }
        return allEmail;
    }

}
