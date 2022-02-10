package servlet;

import entity.People;
import service.PeopleService;
import service.impl.PeopleServiceImpl;
import util.CustomUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "PeopleServlet", urlPatterns = "/PeopleServlet/*")
public class PeopleServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*适配汉字*/
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String path = "/page/404.jsp";

        CustomUtil.outPosition("green", "PeopleServlet.doPost()");
        CustomUtil.outParameter("green", "request.getRequestURI()", request.getRequestURI());
        CustomUtil.outParameter("green", "request.getServletPath()", request.getServletPath());
        CustomUtil.outParameter("green", "request.getRequestURL()", String.valueOf(request.getRequestURL()));

        /*取出路径"/web_war_exploded/page/PeopleServlet/..."中的最右侧字符串*/
        String target = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);
        if (target != null) {
            if ("register".equals(target)) {
                path = this.register(request);
            } else if ("login".equals(target)) {
                path = this.login(request);
            } else if ("logout".equals(target)) {
                path = this.logout(request);
            }
        }
        request.getRequestDispatcher(path).forward(request, response);
    }

    /**
     * 1.接收客户端提交到服务端的表单数据
     * 2.校验表单数据的合法性，如果校验失败跳回到register.jsp，并回显错误信息
     * 3.如果校验通过，调用service层向数据库中注册用户，若注册成功跳转至loginCorrect.jsp
     * @return 跳转路径
     */
    public String register(HttpServletRequest request) {
        PeopleService peopleService = new PeopleServiceImpl();
        HttpSession session = request.getSession();//从当前request中获取或创建一个session
        String checkcode = (String) session.getAttribute("checkcode");//从session中取出验证码

        /*通过name属性取得input标签中的值*/
        String id = request.getParameter("id");
        String password_once = request.getParameter("password_once");
        String password_twice = request.getParameter("password_twice");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String code = request.getParameter("code");

        People people = new People(0, password_once, name, email, address, 0);
        if (id != "") {
            people.setId(Integer.parseInt(id));
        }

        /*在控制台输出当前输入内容*/
        CustomUtil.outPosition("green", "PeopleServlet.register()");
        CustomUtil.outParameter("green", "people", people.toString());

        /**
         * 对输入信息逐一校验，并按照错误程度排序，只显示优先级最高的提示信息
         * 1.有输入框为空（js已经处理，正常不会显示）
         * 2.两次密码输入不一致（js已经处理，正常不会显示）
         * 3.验证码填写错误
         * 4.重复注册等原因导致后台数据库插入语句执行失败
         */
        String register_error_info = null;//注册错误信息
        int tag = 0;
        if (id == "" || password_once == "" || password_twice == "" || name == "" || email == "" || address == "" || code == "") {
            register_error_info = "<h4 class=\"lead\">有未填写的注册信息!</h4>";
            tag = 2;
        } else if (!password_once.equals(password_twice)) {
            register_error_info = "<h4 class=\"lead\">两次输入密码不一致!</h4>";
            tag = 1;
        } else if (!code.equals(checkcode)) {
            register_error_info = "<h4 class=\"lead\">注册验证码填写有误!</h4>";
            tag = 1;
        } else {
            switch (peopleService.register(people)) {
                case (2):
                    register_error_info = "<h4 class=\"lead\">注册失败!</h4>";
                    tag = 1;
                    break;
                case (1):
                    register_error_info = "<h4 class=\"lead\">对不起, 此账号已被注册!</h4>";
                    tag = 1;
                    break;
                case (0):
            }
        }

        /*通过tag判断是否注册成功*/
        if (tag == 0) {
            session.setAttribute("register_error_info", null);//session置空
            session.setAttribute("error_people", null);//session置空
            return "/page/registerCorrect.jsp";//跳至注册成功界面
        }
        else {
            /*在控制台输出注册失败原因*/
            CustomUtil.outPosition("green", "PeopleServlet.register()");
            CustomUtil.outParameter("green", "register_error_info", register_error_info);

            session.setAttribute("register_error_info", register_error_info);//将失败原因存进session
            session.setAttribute("error_people", people);//将注册信息存进session
            return "/page/register.jsp";//对应完整路径为：http://localhost:8080/web_war_exploded/PeopleServlet/../page/register.jsp
        }
    }

    public String login(HttpServletRequest request) {
        PeopleService peopleService = new PeopleServiceImpl();
        HttpSession session = request.getSession();//从当前request中获取或创建一个session
        String checkcode = (String) session.getAttribute("checkcode");//从session中取出验证码

        /*通过name属性取得input标签中的值*/
        String code = request.getParameter("code");
        People people = new People(Integer.parseInt(request.getParameter("id")), request.getParameter("password"),
                null, null, null, 0);

        /*在控制台输出当前输入内容*/
        CustomUtil.outPosition("green", "PeopleServlet.login()");
        CustomUtil.outParameter("green", "people", people.toString());

        /**
         * 对输入信息逐一校验, 并按照错误程度排序, 只显示优先级最高的提示信息
         * 1.验证码填写错误
         * 2.其他原因后台数据库插入语句执行失败
         */
        String login_error_info = null;
        int tag = 0;
        if (!code.equals(checkcode)) {
            login_error_info = "<h4 class=\"lead\">登陆验证码填写错误!</h4>";
            tag = 1;
        }
        if (peopleService.login(people) == false) {
            login_error_info = "<h4 class=\"lead\">信息填写有误!</h4>";
            tag = 1;
        }

        /*通过tag判断是否登录成功*/
        if (tag == 0) {
            session.setAttribute("login_error_info", null);//session置空
            session.setAttribute("now_people", peopleService.find(people.getId()));//将当前登录用户信息存入session

            return "/page/loginCorrect.jsp";//跳至登录成功界面
        }
        else {
            /*在控制台输出注册失败原因*/
            CustomUtil.outPosition("green", "PeopleServlet.login()");
            CustomUtil.outParameter("green", "login_error_info", login_error_info);

            session.setAttribute("login_error_info", login_error_info);//将失败原因存进session
            return "/page/login.jsp";
        }
    }

    public String logout(HttpServletRequest request) {
        return "/page/logoutCorrect.jsp";
    }
}
