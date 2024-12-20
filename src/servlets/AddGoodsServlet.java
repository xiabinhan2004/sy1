package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;

import java.sql.*;
import java.util.Calendar;

import bean.*;

public class AddGoodsServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddGoodsServlet() {
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
		PreparedStatement pstmt=null;
		Connection conn=null;
		String ext="", url="upload/",info="",forward="";
		SmartUpload su=new SmartUpload();  //�����µ��ϴ�����
		long maxsize=200*1024; //����ÿ���ϴ��ļ����Ϊ200KB
		try{
		    su.initialize(this.getServletConfig(), request, response); //��ʼ��
		    su.setMaxFileSize(maxsize); //�����ϴ��ļ��Ĵ�С
		    su.setAllowedFilesList("jpg,JPG,gif,GIF"); //�趨�����ϴ��ĸ�ʽ
		    su.upload(); //�ϴ��ļ�
		    Request req=su.getRequest(); //����Request����
		    String cid=req.getParameter("cid");
		    String cname=req.getParameter("cname");
		    String number=req.getParameter("cnumber");
		    String price=req.getParameter("cprice");
		    String cintro=req.getParameter("cintro");
		    //��ʽת��
		    int cnumber=Integer.parseInt(number);
		    float cprice=Float.parseFloat(price);

		    //��ȡ�ϴ����ļ�����Ϊֻ�ϴ���һ���ļ������Կ�ֱ�ӻ�ȡ
		    com.jspsmart.upload.File myfile=su.getFiles().getFile(0);
		    if(!myfile.isMissing()){
			ext=myfile.getFileExt();  //ȡ����չ��
			Calendar cal=Calendar.getInstance();
			String filename=String.valueOf(cal.getTimeInMillis());
			String saveurl=request.getRealPath("/")+url;
			saveurl+=filename+"."+ext;  //saveurlΪ����ͼƬ�ľ���·��
			//���ô浽���ݿ��е�·��
			String cimage=url+filename+"."+ext;
			int cmark=0;
			String sql="insert into goods(cid,cname,cnumber,cprice,cintro,cimage) values (?,?,?,?,?,?)";
			DB db=new DB();
			
			conn=db.createConn();
			conn.setAutoCommit(true);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,cid);
			pstmt.setString(2,cname);
			pstmt.setInt(3,cnumber);
			pstmt.setFloat(4,cprice);
			pstmt.setString(5,cintro);
			pstmt.setString(6,cimage);
			cmark=pstmt.executeUpdate();
			if(cmark==1){
				//���ļ����浽ָ��Ŀ¼��
				myfile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL); 
				info="��ӳɹ���";
				forward="c_manager.jsp";
			}else{
				info="���ʧ�ܣ�";
				forward="c_add.jsp";
			}

			}else{
				info="��ѡ��Ҫ�ϴ����ļ���";
				forward="c_add.jsp";
			}
		}
		    catch(Exception e){
		    	e.printStackTrace();
		    	info="����쳣��";
		    	forward="c_add.jsp";
		    }finally{
		    	try {pstmt.close();}catch(Exception e){}
		    	try {conn.close();}catch(Exception e){}
		    }
		    request.setAttribute("info",info);
		    RequestDispatcher rd=request.getRequestDispatcher(forward);
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

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
