package servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CheckCode")
public class CheckCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static int width=70;
    private static int height=25;
       
	public CheckCode() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**
		 * request�ǿͻ�����������������󱻷�װ�γɵ�һ��HttpServletRequest�����ӿ������
		 * session����洢�ض��û��Ự��������Լ�������Ϣ, �������û���Ӧ�ó����Webҳ֮����תʱ, �洢��session�����еı��������ᶪʧ, �����������û��Ự��һֱ������ȥ
		 * getSession()��getSession(true)һ��, ��ȡrequest���������session����, ���û��session, �򷵻�һ���µ�session
		 */
		HttpSession session=request.getSession();
		response.setContentType("image/jpeg");// �������ɵ��ĵ�����Ϊjpg
		ServletOutputStream servletOutputStream = response.getOutputStream();
		
		/*�����������Ҫ�����ͼƬ*/
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		
		/**
		 * �����ڴ�ͼƬ�������ͼ��������
		 * Image��һ��������, BufferedImage����ʵ����, ��һ����������ͼ����, ��Ҫ�����ǽ�һ��ͼƬ���ص��ڴ���
		 * BufferedImage���ɵ�ͼƬ���ڴ�����һ��ͼ�񻺳���, ����������������ǿ��Ժܷ���ز������ͼƬ
		 */
		BufferedImage image=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics graphics=image.getGraphics();
		
		char[] rands=generCode();// �����������֤��
		drawRands(graphics, rands);// ����ͼ��
		graphics.dispose();// ����ͼ��Ļ��ƹ��̣����ͼ��
		
		/*��ͼ��������ͻ���*/
		ByteArrayOutputStream byteArrayOutputStream=new ByteArrayOutputStream();
		ImageIO.write(image, "jpeg", byteArrayOutputStream);
		byte[] buf=byteArrayOutputStream.toByteArray();
		response.setContentLength(buf.length);
		servletOutputStream.write(buf);
		byteArrayOutputStream.close();
		servletOutputStream.close();
		
		session.setAttribute("checkcode", new String(rands));// ����ǰ����֤��д�뵽session��	
		
	}
	
	private char[] generCode() {
    	//������֤����ַ���
    	String chars="0123456789";
    	char[] rands=new char[5];
    	for(int i=0;i<5;i++) {
    		int rand=(int)(Math.random()*10);
    		rands[i]=chars.charAt(rand);
    	}
    	return rands;
    }
	
	private void drawRands(Graphics g,char[] rands) {
		g.setColor(Color.WHITE);
		g.setFont(new Font(null, Font.ITALIC|Font.BOLD, 18));
		
		/*�ڲ�ͬ�߶��������֤���ÿ���ַ�*/
		g.drawString("" + rands[0], 0, 18);
		g.drawString("" + rands[1], 14, 18);
		g.drawString("" + rands[2], 28, 18);
		g.drawString("" + rands[3], 42, 18);
		g.drawString("" + rands[4], 56, 18);
		System.out.print("��ǰ��֤��:");
		System.out.println(rands);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
