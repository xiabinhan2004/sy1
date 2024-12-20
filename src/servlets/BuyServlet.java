package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import bean.*;

public class BuyServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BuyServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//���ձ�����������
		String address=Tools.CodeToString(request.getParameter("address"));
		String receivename=Tools.CodeToString(request.getParameter("receivename"));
		String tele=request.getParameter("tele");
		String zipcode=request.getParameter("zipcode");
		String paymode=Tools.CodeToString(request.getParameter("paymode"));
		//��ȡ��ǰ��ʱ��
		java.util.Date day=new java.util.Date();
		//��ʽ����yyyyMMdd��ʽ��ע���Сд
		SimpleDateFormat format=new SimpleDateFormat("yyyyMMdd");
		String orderdate=format.format(day);
		String now=(String)(day.toLocaleString());  //��ǰ������ʱ��
		//��ѯ����Ķ�����Ŀ
		String sql="select count(*) from ordertable where orderdate='"+orderdate+"'";
		DB db=new DB();
		ResultSet rs=null;	int i=0;
		try{
			rs=db.executeQuery(sql);
			if(rs.next()){
				i=rs.getInt(1); //��ȡ�˵���Ķ�����Ŀ
			}
			i++;	//�˶��������
		}catch(Exception e){e.printStackTrace();}finally{db.close();}
		String str_i=String.valueOf(i); //ת���ַ�����ʽ
		while(str_i.length()<3){	//��ʽ������λ���ַ���
		str_i="0"+str_i;
		}
		String orderid=now+str_i;	
		orderid=orderid.replace("-","");	//�����ڸ�ʽ�е��ر���ţ��ո�ȣ���ȥ
		orderid=orderid.replace(" ","");
		orderid=orderid.replace(":","");

		HttpSession session=request.getSession();
		String username=(String)session.getAttribute("username");
		String orderstate="δ����";
		
		//��orderBean��װ�Ÿ�����
		OrderBean order=new OrderBean();
		order.setAddress(address);
		order.setOrderdate(orderdate);
		order.setOrderid(orderid);
		order.setOrderstate(orderstate);
		order.setPaymode(paymode);
		order.setReceivename(receivename);
		order.setTele(tele);
		order.setUsername(username);
		order.setZipcode(zipcode);
		
		//��ȡ��ǰ�Ĺ��ﳵ����
		ArrayList cart=(ArrayList)session.getAttribute("cart");
		boolean a=order.add(cart);
		if(a)
		{
			//��չ��ﳵ
			session.setAttribute("cart", null);
			response.sendRedirect("userinfo.jsp");
		}
		else
		{
			response.sendRedirect("cart.jsp");
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
