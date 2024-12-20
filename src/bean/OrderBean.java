package bean;

import java.util.ArrayList;
import java.util.Iterator;
import java.sql.*;

public class OrderBean {
	
	
	
	private String orderid;
	private String username;
	private String orderdate;
	private String orderstate;
	private String address;
	private String receivename;
	private String tele;
	private String zipcode;
	private String paymode;
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getOrderstate() {
		return orderstate;
	}
	public void setOrderstate(String orderstate) {
		this.orderstate = orderstate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getReceivename() {
		return receivename;
	}
	public void setReceivename(String receivename) {
		this.receivename = receivename;
	}
	public String getTele() {
		return tele;
	}
	public void setTele(String tele) {
		this.tele = tele;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getPaymode() {
		return paymode;
	}
	public void setPaymode(String paymode) {
		this.paymode = paymode;
	}
	
    public boolean add(ArrayList cart)
    {
    	boolean mark=false;
    	StringBuffer newsql=new StringBuffer();
		newsql.append("insert into ordertable values ('");
		newsql.append(orderid);
		newsql.append("','");
		newsql.append(username);
		newsql.append("','");
		newsql.append(orderdate);
		newsql.append("','");
		newsql.append(orderstate);
		newsql.append("','");
		newsql.append(address);
		newsql.append("','");
		newsql.append(receivename);
		newsql.append("','");
		newsql.append(tele);
		newsql.append("','");
		newsql.append(zipcode);
		newsql.append("','");
		newsql.append(paymode);
		newsql.append("')");
    	
		DB db=new DB();
		Connection conn=db.createConn();
		Statement stmt=null;
		Iterator icart=cart.iterator();
		
		try{
			conn.setAutoCommit(false);  
			stmt=conn.createStatement();
			stmt.executeUpdate(newsql.toString());
			//stmt.executeUpdate(sql2);
			while(icart.hasNext())
			{
				ItemBean temp=(ItemBean)icart.next();
				String cid=temp.getGoods().getCid();
				int quantity=temp.getQuantity();
				//构造sql2
				StringBuffer newsql2=new StringBuffer();
					newsql2.append("insert into orderlist values ('");
					newsql2.append(orderid);
					newsql2.append("','");
					newsql2.append(cid);
					newsql2.append("','");
					newsql2.append(quantity);
					newsql2.append("')");
					stmt.executeUpdate(newsql2.toString());
			}
			
			
			
				conn.commit();	//提交事务
				conn.close();
				mark=true;
			 }catch(SQLException e){
			try{
				conn.rollback();	//出错回滚
			}catch(SQLException ee){
				ee.printStackTrace();
			    }
				e.printStackTrace();
			}

    	

    	return mark;
    }

}
