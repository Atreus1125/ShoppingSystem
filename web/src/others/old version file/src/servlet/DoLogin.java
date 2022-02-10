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
import service.InterfacePeopleService;
import service.PeopleService;

/**
 * Servlet implementation class DoLogin
 */
@WebServlet("/DoLogin")
public class DoLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InterfacePeopleService peopleService;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoLogin() {
    	peopleService = new PeopleService();
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
		HttpSession session = request.getSession();// 实例化session
		String answer_code = (String)session.getAttribute("checkcode");// 从session中取出验证码
		
		/*通过name属性取得input标签中的值*/
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String code = request.getParameter("code");
		
		/*在控制台输出当前输入内容*/
		System.out.println(
			"当前登陆页面输入信息为:" +
			"id:" + id + " " + 
			"password:" + password + " " + 
			"code:" + code + " ");
		
		/**
		 * 对输入信息逐一校验, 并按照错误程度排序, 只显示优先级最高的提示信息
		 * 1.所有输入框不得为空
		 * 2.验证码填写错误
		 * 3.其他原因后台数据库插入语句执行失败
		 */
		String error_sign = null;
		int tag = 0;
		if (id == "" || password == "" || code == "") {
			error_sign = "<h4 class=\"lead\">有未填写的登陆信息!</h4>";
			tag = 1;
		}
		if (!code.equals(answer_code) && tag == 0) {
			error_sign = "<h4 class=\"lead\">登陆验证码填写错误!</h4>";
			tag = 1;
		}
		if (tag == 0) {
			if (peopleService.checkPeople(id, password) == null) {
				error_sign = "<h4 class=\"lead\">登陆信息填写有误!</h4>";
				tag = 1;
			}
		}
		
		/*通过tag判断是否注册成功*/
		if (tag == 0) {
			session.setAttribute("login_state", 1);
			session.setAttribute("login_name", peopleService.checkPeople(id, password).getName());
			session.setAttribute("login_id", peopleService.checkPeople(id, password).getId());
			session.setAttribute("login_address", peopleService.checkPeople(id, password).getAddress());
			session.setAttribute("error_state", null);
			/*创建一个物品数量全部为零的订单并写入session*/
			HashMap<String, Goods> order = new HashMap<>();
			/*order.put("1", new Goods("1", "HUAWEI P40 Pro 5G", 5988, 0, "image/phone1.png"));
			order.put("2", new Goods("2", "HUAWEI P40 Pro+ 5G", 7988, 0, "image/phone2.png"));
			order.put("3", new Goods("3", "荣耀30", 3298, 0, "image/phone3.png"));
			order.put("4", new Goods("4", "HUAWEI Mate 30E Pro 5G", 5299, 0, "image/phone4.png"));
			order.put("5", new Goods("5", "HUAWEI Mate 40 Pro+ 5G", 8999, 0, "image/phone5.png"));*/
			session.setAttribute("order", order);
			
			request.getRequestDispatcher("LoginCorrect.jsp").forward(request, response);// 跳至登陆成功界面
		}
		else {
			session.setAttribute("login_state", 0);
			System.out.println("当前登陆失败原因:" + error_sign);// 在控制台输出登陆失败原因
			session.setAttribute("error_sign", error_sign);// 将失败原因存进session
			request.getRequestDispatcher("Login.jsp").forward(request, response);// 跳回登陆界面
		}
	}

}
