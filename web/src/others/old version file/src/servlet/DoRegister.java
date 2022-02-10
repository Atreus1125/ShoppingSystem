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
	 * 1.���տͻ����ύ������˵ı�����
	 * 2.У������ݵĺϷ���, ���У��ʧ�����ص�Register.jsp, �����Դ�����Ϣ
	 * 3.���У��ͨ��, ����service�������ݿ���ע���û�
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*���人��*/
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();// ʵ����session
		String answer_code = (String)session.getAttribute("checkcode");// ��session��ȡ����֤��
		
		/*ͨ��name����ȡ��input��ǩ�е�ֵ*/
		String id = request.getParameter("id");
		String password_once = request.getParameter("password_once");
		String password_twice = request.getParameter("password_twice");
		String name = new String(request.getParameter("name").getBytes("utf-8"), "utf-8");
		String email = request.getParameter("email");
		String address = new String(request.getParameter("address").getBytes("utf-8"), "utf-8");
		String code = request.getParameter("code");
		
		/*�ڿ���̨�����ǰ��������*/
		System.out.println(
			"��½ҳ��������ϢΪ:" + 
			"id:" + id + " " + 
			"password_once:" + password_once + " " + 
			"password_twice:" + password_twice + " " + 
			"name:" + name + " " + 
			"email:" + email + " " + 
			"address:" + address + " " + 
			"code:" + code + " ");
		
		/*��HashMap�洢��һ�ε���������*/
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
		 * ��������Ϣ��һУ��, �����մ���̶�����, ֻ��ʾ���ȼ���ߵ���ʾ��Ϣ
		 * 1.��������򲻵�Ϊ��
		 * 2.�����������벻һ��
		 * 3.��֤����д����
		 * 4.�ظ�ע���ԭ���º�̨���ݿ�������ִ��ʧ��
		 */
		String error_sign = null;
		int tag = 0;
		if (id == "" || password_once == "" || password_twice == "" || name == "" || email == "" || address == "" || code == "") {
			error_sign = "<h4 class=\"lead\">��δ��д��ע����Ϣ!</h4>";
			tag = 1;
		}
		if (!password_once.equals(password_twice) && tag == 0) {
			error_sign = "<h4 class=\"lead\">�����������벻һ��!</h4>";
			tag = 1;
		}
		if (!code.equals(answer_code) && tag == 0) {
			error_sign = "<h4 class=\"lead\">ע����֤����д����!</h4>";
			tag = 1;
		}
		System.out.println(code.equals(answer_code));
		if (tag == 0) {
			if (peopleService.insertPeople(id, password_once, name, email, address) != 1) {
				error_sign = "<h4 class=\"lead\">�Բ���, ���˺��ѱ�ע��!</h4>";
				tag = 1;
			}
		}
		
		/*ͨ��tag�ж��Ƿ�ע��ɹ�*/
		if (tag == 0) {
			register_hashmap.replace("sign", "correct");// ��HashMap�е�sign��Ϊcorrect
			session.setAttribute("register_hashmap", null);
			request.getRequestDispatcher("RegisterCorrect.jsp").forward(request, response);// ����ע��ɹ�����
		}
		else {
			register_hashmap.replace("sign", "error");// ��HashMap�е�sign��Ϊerror
			System.out.println("��ǰע��ʧ��ԭ��:" + error_sign);// �ڿ���̨���ע��ʧ��ԭ��
			session.setAttribute("error_sign", error_sign);// ��ʧ��ԭ����session
			session.setAttribute("register_hashmap", register_hashmap);// ��HashMap���session
			request.getRequestDispatcher("Register.jsp").forward(request, response);// ����ע�����
		}
	}

}
