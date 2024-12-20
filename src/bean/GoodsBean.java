package bean;

import bean.DB;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
public class GoodsBean {
	private String cid;
	private String cname;
	private int cnumber;
	private float cprice;
	private String cintro;
	private String cimage;
	
	public void setCid(String cid){
		this.cid=cid;
	}
	public String getCid(){
		return this.cid;
	}
	
	public void setCname(String cname){
		this.cname=cname;
	}
	public String getCname(){
		return this.cname;
	}
	
	public void setCnumber(int cnumber){
		this.cnumber=cnumber;
	}
	public int getCnumber(){
		return this.cnumber;
	}
	
	public void setCprice(float cprice){
		this.cprice=cprice;
	}
	public float getCprice(){
		return this.cprice;
	}
	
	public void setCintro(String cintro){
		this.cintro=cintro;
	}
	public String getCintro(){
		return this.cintro;
	}
	
	public void setCimage(String cimage){
		this.cimage=cimage;
		
	}
	public String getCimage(){
		return this.cimage;
	}
	
	//获取所有的商品信息
	public ArrayList getGoodsByPage(int pageNo){
		ArrayList goodslist=new ArrayList();
		DB db=new DB();
		int begin=(pageNo-1)*10+1;
		int end=pageNo*10;
		int index=0;
		String sql="select * from goods";
		ResultSet rs=null;
		try{
			rs=db.executeQuery(sql);
			while(rs.next()){
				index++;
				if(index<begin) continue;
				if(index>end) break;
				String tmpCid=rs.getString(1);
				String tmpCname=rs.getString(2);
				float tmpCprice=rs.getFloat(4);
				String tmpCimage=rs.getString(6);
				//InputStream in=rs.getBinaryStream(6);
				
				//写入到JavaBean中
				GoodsBean g=new GoodsBean();
				g.setCid(tmpCid);
				g.setCname(tmpCname);
				g.setCprice(tmpCprice);
				g.setCimage(tmpCimage);
				goodslist.add(g);				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			db.close();
		}
		return goodslist;
	}
	//获取页码总数
	public int getPageCount(){
		DB db=new DB();
		String sql="select count(*) from goods";
		ResultSet rs=null;
		int pageCount=1;
		try{
			rs=db.executeQuery(sql);
			rs.next();
			int n=rs.getInt(1);
			pageCount=(int)((n-1)/10+1);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			db.close();
		}
		return pageCount;
	}
	
	public GoodsBean findGoodsById(String cid){		
		try{
			String sql="select * from goods where cid = '"+cid+"'";
			DB db=new DB();
			ResultSet rs=null;
			rs=db.executeQuery(sql);
			if(rs.next()){
				String cname=rs.getString(2);
				float cprice=rs.getFloat(4);
				GoodsBean temp=new GoodsBean();
				temp.setCname(cname);
				temp.setCid(cid);
				temp.setCprice(cprice);
				db.close();
				return temp;
			}else{
				return null;
			}
		}catch(Exception e){
			System.out.print(e.toString());
			return null;
		}
		
		
	}
	
}
