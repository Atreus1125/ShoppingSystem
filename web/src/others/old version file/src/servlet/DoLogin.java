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
		HttpSession session = request.getSession();// ʵ����session
		String answer_code = (String)session.getAttribute("checkcode");// ��session��ȡ����֤��
		
		/*ͨ��name����ȡ��input��ǩ�е�ֵ*/
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String code = request.getParameter("code");
		
		/*�ڿ���̨�����ǰ��������*/
		System.out.println(
			"��ǰ��½ҳ��������ϢΪ:" +
			"id:" + id + " " + 
			"password:" + password + " " + 
			"code:" + code + " ");
		
		/**
		 * ��������Ϣ��һУ��, �����մ���̶�����, ֻ��ʾ���ȼ���ߵ���ʾ��Ϣ
		 * 1.��������򲻵�Ϊ��
		 * 2.��֤����д����
		 * 3.����ԭ���̨���ݿ�������ִ��ʧ��
		 */
		String error_sign = null;
		int tag = 0;
		if (id == "" || password == "" || code == "") {
			error_sign = "<h4 class=\"lead\">��δ��д�ĵ�½��Ϣ!</h4>";
			tag = 1;
		}
		if (!code.equals(answer_code) && tag == 0) {
			error_sign = "<h4 class=\"lead\">��½��֤����д����!</h4>";
			tag = 1;
		}
		if (tag == 0) {
			if (peopleService.checkPeople(id, password) == null) {
				error_sign = "<h4 class=\"lead\">��½��Ϣ��д����!</h4>";
				tag = 1;
			}
		}
		
		/*ͨ��tag�ж��Ƿ�ע��ɹ�*/
		if (tag == 0) {
			session.setAttribute("login_state", 1);
			session.setAttribute("login_name", peopleService.checkPeople(id, password).getName());
			session.setAttribute("login_id", peopleService.checkPeople(id, password).getId());
			session.setAttribute("login_address", peopleService.checkPeople(id, password).getAddress());
			session.setAttribute("error_state", null);
			/*����һ����Ʒ����ȫ��Ϊ��Ķ�����д��session*/
			HashMap<String, Goods> order = new HashMap<>();
			/*order.put("1", new Goods("1", "HUAWEI P40 Pro 5G", 5988, 0, "image/phone1.png"));
			order.put("2", new Goods("2", "HUAWEI P40 Pro+ 5G", 7988, 0, "image/phone2.png"));
			order.put("3", new Goods("3", "��ҫ30", 3298, 0, "image/phone3.png"));
			order.put("4", new Goods("4", "HUAWEI Mate 30E Pro 5G", 5299, 0, "image/phone4.png"));
			order.put("5", new Goods("5", "HUAWEI Mate 40 Pro+ 5G", 8999, 0, "image/phone5.png"));*/
			session.setAttribute("order", order);
			
			request.getRequestDispatcher("LoginCorrect.jsp").forward(request, response);// ������½�ɹ�����
		}
		else {
			session.setAttribute("login_state", 0);
			System.out.println("��ǰ��½ʧ��ԭ��:" + error_sign);// �ڿ���̨�����½ʧ��ԭ��
			session.setAttribute("error_sign", error_sign);// ��ʧ��ԭ����session
			request.getRequestDispatcher("Login.jsp").forward(request, response);// ���ص�½����
		}
	}

}
