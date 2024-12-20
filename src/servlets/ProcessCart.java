package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.*;
import java.util.ArrayList;

public class ProcessCart extends HttpServlet {

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

		//response.setContentType("text/html");
		//PrintWriter out = response.getWriter();
		
		String action=Tools.CodeToString(request.getParameter("action"));
		String cid=request.getParameter("cid");
		
		String quantity=null;
		//����JavaBean����
		CartManager cartManager=new CartManager();
		HttpSession session=request.getSession(true);
		//�õ����ﳵ����
		ArrayList cart=(ArrayList)session.getAttribute("cart");
		cartManager.setCart(cart);
		
		if("�޸�".equals(action)){
			quantity=request.getParameter("quantity");
			cartManager.update(cid,Integer.parseInt(quantity));
			request.setAttribute("info","�޸ĳɹ���");
		}else{
			cartManager.delete(cid);
			request.setAttribute("info","ɾ���ɹ���");
		}
		session.setAttribute("cart",cartManager.getCart());
		RequestDispatcher rd=request.getRequestDispatcher("cart.jsp");
		rd.forward(request,response);
		
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

}
