package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

import bean.*;

public class RegServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RegServlet() {
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
		//接收
		String username=Tools.CodeToString(request.getParameter("username"));
		String userpass=request.getParameter("userpass");
		String gender=Tools.CodeToString(request.getParameter("gender"));
		String birthdate=request.getParameter("birthdate");
		String nativeplace=Tools.CodeToString(request.getParameter("nativeplace"));
		
		//用以建立数据库连接的必要信息
		String url="jdbc:mysql://localhost:3307/class";
		String user="root";
		String password="123456";
		String sql="select * from user where username='"+username+"'";
		
		//创建各个对象
		Connection conn=null; //建立数据库连接的对象
		Statement stmt=null; //创建用于执行SQL语句的Statement对象
		ResultSet rs=null; //创建结果集对象
		
		try{
		//建立连接并执行语句
		conn=DriverManager.getConnection(url, user, password);
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		//其它操作
		HttpSession session=request.getSession();
		if(rs.next())
		{
			session.setAttribute("error","用户名已经注册，请重新注册！");
			response.sendRedirect("reg.jsp");
		}
		else
		{
			StringBuffer newsql=new StringBuffer();
			newsql.append("insert into user (username, userpass, gender,birthdate,nativeplace) values ('");
			newsql.append(username);
			newsql.append("','");
			newsql.append(userpass);
			newsql.append("','");
			newsql.append(gender);
			newsql.append("','");
			newsql.append(birthdate);
			newsql.append("','");
			newsql.append(nativeplace);
			newsql.append("')");
			int i=stmt.executeUpdate(newsql.toString());
			if(i>0)
			{
				session.setAttribute("message","注册成功！");
			}
			else
			{
				session.setAttribute("message","注册失败！");
			}
			//跳转到check.jsp
			response.sendRedirect("login.jsp");
		}
		
		}catch(SQLException se){
			throw new ServletException(se);
		}finally{
		try{rs.close();}catch(SQLException se){}
		try{stmt.close();}catch(SQLException se){}
		try{conn.close();}catch(SQLException se){}
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
		String classname="com.mysql.jdbc.Driver";
		try{
			Class.forName(classname);
		}catch(ClassNotFoundException ce){
			throw new ServletException("加载数据库驱动失败");
		}

	}

}
