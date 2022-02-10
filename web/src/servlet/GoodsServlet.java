package servlet;

import entity.Goods;
import util.CustomUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "GoodsServlet", urlPatterns = "/GoodsServlet/*")
public class GoodsServlet extends HttpServlet {

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

        String target = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);
        if (target != null) {
            if ("add".equals(target)) {
                path = this.add(request, response);
            } else if ("delete".equals(target)) {
                path = this.delete(request, response);
            }
        }
        response.sendRedirect(request.getContextPath() + path);
    }

    public String add(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();//从当前request中获取或创建一个session
        Goods goods = (Goods) session.getAttribute("now_goods");
        int number = Integer.parseInt(request.getParameter("number"));

        CustomUtil.outPosition("green", "GoodsServlet.add()");
        CustomUtil.outParameter("green", "request.getContextPath()", request.getContextPath());

        /*cookie实现购物车，cookie格式为：Cookie(id, number)*/
        Cookie cookie = new Cookie(String.valueOf(goods.getId()), String.valueOf(number));
        Cookie cookies[] = request.getCookies();

        int is_exist = 0;
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals(String.valueOf(goods.getId()))) {
                    /*此商品已经存在*/
                    int previous_number = Integer.parseInt(cookies[i].getValue());
                    number = number + previous_number;
                    cookies[i].setValue(String.valueOf(number));
                    cookies[i].setMaxAge(60*60);
                    cookies[i].setPath(request.getContextPath());
                    response.addCookie(cookies[i]);
                    is_exist = 1;
                }
            }
            if (is_exist == 0) {
                cookie.setMaxAge(60*60);//设置cookie过期时间为60min
                cookie.setPath(request.getContextPath());
                response.addCookie(cookie);//在响应头部添加cookie
            }
        }

        return "/page/shopCar.jsp";
    }

    public String delete(HttpServletRequest request, HttpServletResponse response) {
        CustomUtil.outPosition("green", "GoodsServlet.delete()");
        CustomUtil.outParameter("green", "goods_id", request.getParameter("goods_id"));

        Cookie cookies[] = request.getCookies();
        String goods_id = request.getParameter("goods_id");

        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals(goods_id)) {
                    cookies[i].setMaxAge(0);
                    CustomUtil.outParameter("green", "cookies[i].getPath()", cookies[i].getPath());
                    cookies[i].setPath(request.getContextPath());
                    response.addCookie(cookies[i]);
                }
            }
        }
        return "/page/shopCar.jsp";
    }
}
