package servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.InterfacePeopleService;
import service.PeopleService;

/**
 * Servlet implementation class DoRegister
 */
@WebServlet("/DoRegister")
public class DoRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InterfacePeopleService peopleService;

    public DoRegister() {
        peopleService = new PeopleService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * 1.接收客户端提交到服务端的表单数据
	 * 2.校验表单数据的合法性, 如果校验失败跳回到Register.jsp, 并回显错误信息
	 * 3.如果校验通过, 调用service层向数据库中注册用户
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*适配汉字*/
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();// 实例化session
		String answer_code = (String)session.getAttribute("checkcode");// 从session中取出验证码
		
		/*通过name属性取得input标签中的值*/
		String id = request.getParameter("id");
		String password_once = request.getParameter("password_once");
		String password_twice = request.getParameter("password_twice");
		String name = new String(request.getParameter("name").getBytes("utf-8"), "utf-8");
		String email = request.getParameter("email");
		String address = new String(request.getParameter("address").getBytes("utf-8"), "utf-8");
		String code = request.getParameter("code");
		
		/*在控制台输出当前输入内容*/
		System.out.println(
			"登陆页面输入信息为:" + 
			"id:" + id + " " + 
			"password_once:" + password_once + " " + 
			"password_twice:" + password_twice + " " + 
			"name:" + name + " " + 
			"email:" + email + " " + 
			"address:" + address + " " + 
			"code:" + code + " ");
		
		/*用HashMap存储上一次的输入内容*/
		HashMap<String, String> register_hashmap = new HashMap<>();
		register_hashmap.put("sign", "correct");
		register_hashmap.put("id", id);
		register_hashmap.put("password_once", password_once);
		register_hashmap.put("password_twice", password_twice);
		register_hashmap.put("name", name);
		register_hashmap.put("email", email);
		register_hashmap.put("address", address);
		register_hashmap.put("code", code);
		
		/**
		 * 对输入信息逐一校验, 并按照错误程度排序, 只显示优先级最高的提示信息
		 * 1.所有输入框不得为空
		 * 2.两次密码输入不一致
		 * 3.验证码填写错误
		 * 4.重复注册等原因导致后台数据库插入语句执行失败
		 */
		String error_sign = null;
		int tag = 0;
		if (id == "" || password_once == "" || password_twice == "" || name == "" || email == "" || address == "" || code == "") {
			error_sign = "<h4 class=\"lead\">有未填写的注册信息!</h4>";
			tag = 1;
		}
		if (!password_once.equals(password_twice) && tag == 0) {
			error_sign = "<h4 class=\"lead\">两次输入密码不一致!</h4>";
			tag = 1;
		}
		if (!code.equals(answer_code) && tag == 0) {
			error_sign = "<h4 class=\"lead\">注册验证码填写有误!</h4>";
			tag = 1;
		}
		System.out.println(code.equals(answer_code));
		if (tag == 0) {
			if (peopleService.insertPeople(id, password_once, name, email, address) != 1) {
				error_sign = "<h4 class=\"lead\">对不起, 此账号已被注册!</h4>";
				tag = 1;
			}
		}
		
		/*通过tag判断是否注册成功*/
		if (tag == 0) {
			register_hashmap.replace("sign", "correct");// 将HashMap中的sign置为correct
			session.setAttribute("register_hashmap", null);
			request.getRequestDispatcher("RegisterCorrect.jsp").forward(request, response);// 跳至注册成功界面
		}
		else {
			register_hashmap.replace("sign", "error");// 将HashMap中的sign置为error
			System.out.println("当前注册失败原因:" + error_sign);// 在控制台输出注册失败原因
			session.setAttribute("error_sign", error_sign);// 将失败原因存进session
			session.setAttribute("register_hashmap", register_hashmap);// 将HashMap存进session
			request.getRequestDispatcher("Register.jsp").forward(request, response);// 跳回注册界面
		}
	}

}
