package servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Goods;
import service.GoodsService;
import service.InterfaceGoodsService;

/**
 * Servlet implementation class DoPhone
 */
@WebServlet("/DoPhone")
public class DoPhone extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InterfaceGoodsService goodsService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoPhone() {
    	goodsService = new GoodsService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		try {
			HashMap<String, Goods> order = (HashMap<String, Goods>)session.getAttribute("order");
			// ��ʼ��������Ϣ
			String id = null;
			String name = null;
			int price = 0;
			int number = 0;
			String picture = null;
			// ��session�б��ϼӳ��ֻ��ͺ�
			id = "" + session.getAttribute("phone_number") + "";
			// �жϵ�ǰ�ֻ��Ƿ��Ѿ�����
			if (order.get(id) == null) {
				name = "" + goodsService.findGoods(id).getId() + "";
				price = goodsService.findGoods(id).getPrice();
				number = Integer.parseInt(request.getParameter("number"));
				picture = "image/phone" + id + ".png";
				order.put(id, new Goods(id, name, price, number, picture));
			}
			else {
				name = "" + goodsService.findGoods(id).getId() + "";
				price = order.get(id).getPrice();
				number = Integer.parseInt(request.getParameter("number")) + order.get(id).getNumber();
				picture = "image/phone" + id + ".png";
				order.replace(id, new Goods(id, name, price, number, picture));
			}
			session.setAttribute("order", order);
			
			System.out.println(
					"��ǰ�ӳ���ϢΪ:" + 
					"id:" + id + " " + 
					"name:" + name + " " +
					"price:" + price + " " + 
					"number:" + number + " " + 
					"picture:" + picture + " " + 
					"sum:" + number*price + " ");
			request.getRequestDispatcher("Phone.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error_sign", "<h4 class=\"lead\">���ȵ�¼�ټ��빺�ﳵ!</h4>");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
	}

}
