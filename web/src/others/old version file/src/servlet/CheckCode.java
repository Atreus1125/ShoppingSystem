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
		 * request是客户端浏览器发出的请求被封装形成的一个HttpServletRequest公共接口类对象
		 * session对象存储特定用户会话所需的属性及配置信息, 这样当用户在应用程序的Web页之间跳转时, 存储在session对象中的变量将不会丢失, 而是在整个用户会话中一直存在下去
		 * getSession()与getSession(true)一样, 获取request对象关联的session对象, 如果没有session, 则返回一个新的session
		 */
		HttpSession session=request.getSession();
		response.setContentType("image/jpeg");// 设置生成的文档类型为jpg
		ServletOutputStream servletOutputStream = response.getOutputStream();
		
		/*设置浏览器不要缓存此图片*/
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		
		/**
		 * 创建内存图片并获得其图形上下文
		 * Image是一个抽象类, BufferedImage是其实现类, 是一个带缓冲区图像类, 主要作用是将一幅图片加载到内存中
		 * BufferedImage生成的图片在内存里有一个图像缓冲区, 利用这个缓冲区我们可以很方便地操作这个图片
		 */
		BufferedImage image=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics graphics=image.getGraphics();
		
		char[] rands=generCode();// 产生随机的验证码
		drawRands(graphics, rands);// 产生图像
		graphics.dispose();// 结束图像的绘制过程，完成图像
		
		/*将图像输出到客户端*/
		ByteArrayOutputStream byteArrayOutputStream=new ByteArrayOutputStream();
		ImageIO.write(image, "jpeg", byteArrayOutputStream);
		byte[] buf=byteArrayOutputStream.toByteArray();
		response.setContentLength(buf.length);
		servletOutputStream.write(buf);
		byteArrayOutputStream.close();
		servletOutputStream.close();
		
		session.setAttribute("checkcode", new String(rands));// 将当前的验证码写入到session中	
		
	}
	
	private char[] generCode() {
    	//定义验证码的字符表
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
		
		/*在不同高度上输出验证码的每个字符*/
		g.drawString("" + rands[0], 0, 18);
		g.drawString("" + rands[1], 14, 18);
		g.drawString("" + rands[2], 28, 18);
		g.drawString("" + rands[3], 42, 18);
		g.drawString("" + rands[4], 56, 18);
		System.out.print("当前验证码:");
		System.out.println(rands);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
