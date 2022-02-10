package servlet;

import dao.OrderDetailDAO;
import dao.OrderIndexDAO;
import dao.impl.OrderDetailDAOImpl;
import dao.impl.OrderIndexDAOImpl;
import entity.Goods;
import entity.OrderDetail;
import entity.OrderIndex;
import entity.People;
import service.GoodsService;
import service.OrderService;
import service.impl.GoodsServiceImpl;
import service.impl.OrderServiceImpl;
import util.CustomUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

@WebServlet(name = "OrderServlet", urlPatterns = "/OrderServlet/*")
public class OrderServlet extends HttpServlet {

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
            if ("submit".equals(target)) {
                path = this.submit(request, response);
            }
        }
        response.sendRedirect(request.getContextPath() + path);
    }

    public String submit(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();//从当前request中获取或创建一个session
        GoodsService goodsService = new GoodsServiceImpl();
        OrderService orderService = new OrderServiceImpl();

        People people = (People) session.getAttribute("now_people");
        OrderIndex orderIndex = new OrderIndex(0, people.getId(), 0, people.getAddress(), new Date(), 0);
        List<OrderDetail> orderDetailList = new ArrayList<>();

        CustomUtil.outPosition("green", "OrderServlet.submit()");
        CustomUtil.outParameter("green", "people", people.toString());

        Cookie cookies[] = request.getCookies();
        Pattern pattern = Pattern.compile("[0-9]{3}");//通过正则表达式过滤cookie

        int sum = 0;//订单总价
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (pattern.matcher(cookies[i].getName()).matches()) {
                    Goods goods = goodsService.find(Integer.parseInt(cookies[i].getName()));
                    if (goods.getId() != 0) {
                        /*通过cookie实例化订单详情信息*/
                        OrderDetail orderDetail = new OrderDetail();
                        orderDetail.setGoods_id(goods.getId());
                        orderDetail.setGoods_name(goods.getName());
                        orderDetail.setNumber(Integer.parseInt(cookies[i].getValue()));
                        orderDetail.setPrice(goods.getNew_price() * orderDetail.getNumber());
                        orderDetailList.add(orderDetail);
                        sum += orderDetail.getPrice();
                        /*清空cookie*/
                        cookies[i].setMaxAge(0);
                        cookies[i].setPath(request.getContextPath());
                        response.addCookie(cookies[i]);
                    }
                }
            }
        }
        if (sum != 0) {
            /*购物车不为空*/
            orderIndex.setPrice(sum);
            int order_index_id = orderService.addOrderIndex(orderIndex);
            for (OrderDetail o : orderDetailList) {
                o.setOrder_index_id(order_index_id);
                orderService.addOrderDetail(o);
            }
            session.setAttribute("submit_info", "alert(\"订单提交成功!\");");
        } else {
            session.setAttribute("submit_info", "alert(\"购物车为空!\");");
        }

        return "/page/shopCar.jsp";
    }
}
