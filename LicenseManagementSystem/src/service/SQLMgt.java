package service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SQLMgt {
	public UserVO getLoginUser(String id, String pw) throws Exception {
		UserVO user = new UserVO();
		
		Connection conn = SQLConn.getConnection();
        Statement stmt = null;
		
		ResultSet rs = null;
	    stmt = conn.createStatement();
	    String sql = "select user_id, name from user where user_id = '"
	    		+ id + "' and user_pw = SHA2('" + pw + "',256);";
	    rs = stmt.executeQuery(sql);
	     
	    if(rs.next()){
	    	user.setUserId(rs.getString("user_id"));
	    	user.setName(rs.getString("name"));
	    }
	    
		stmt.close();
		conn.close();
         
		return user;
	}
	
	public List<SoftwareVO> getSoftwareList(SoftwareVO swVO) throws Exception {
		List<SoftwareVO> results = new ArrayList<>();
		
		Connection conn = SQLConn.getConnection();
        Statement stmt = null;
		
        ResultSet rs = null;
	    stmt = conn.createStatement();
	    String sql = "SELECT * FROM software";
	    
	    // °Ë»ö¾î
	    if(!swVO.getSwNm().equals("")) {
	    	sql += " WHERE sw_nm LIKE '%"+swVO.getSwNm()+"%'";
	    }
	    else if(!swVO.getMnfNm().equals("")) {
	    	sql += " WHERE mnf_nm LIKE '%"+swVO.getMnfNm()+"%'";
	    }
	    
	    rs = stmt.executeQuery(sql);
	     
	    while(rs.next()){
	    	SoftwareVO newSw = new SoftwareVO();
	    	newSw.setSwSeq(rs.getString(1));
	    	newSw.setSwNm(rs.getString(2));
	    	newSw.setMnfNm(rs.getString(3));
	    	newSw.setSwVer(rs.getString(4));
	    	newSw.setSwEa(rs.getInt(5));
	    	newSw.setRgstId(rs.getString(6));
	    	newSw.setRgstDt(rs.getString(7));
	    	
	    	results.add(newSw);
	    }
	    
		stmt.close();
		conn.close();
         
		return results;
	}
	
	public SoftwareVO getSoftware(SoftwareVO swVO) throws Exception {
		SoftwareVO result = new SoftwareVO();
		
		Connection conn = SQLConn.getConnection();
        Statement stmt = null;
		
        ResultSet rs = null;
	    stmt = conn.createStatement();
	    String sql = "SELECT * FROM software WHERE sw_seq = " + swVO.getSwSeq();
	    
	    rs = stmt.executeQuery(sql);
	     
	    if(rs.next()){
	    	result.setSwSeq(rs.getString(1));
	    	result.setSwNm(rs.getString(2));
	    	result.setMnfNm(rs.getString(3));
	    	result.setSwVer(rs.getString(4));
	    	result.setSwEa(rs.getInt(5));
	    	result.setRgstId(rs.getString(6));
	    	result.setRgstDt(rs.getString(7));
	    }
	    
		stmt.close();
		conn.close();
         
		return result;
	}
	
	public void createSoftware(SoftwareVO swVO) throws Exception {
		Connection conn = SQLConn.getConnection();
		
		Statement stmt = null;
	    stmt = conn.createStatement();
		
		String sql = "INSERT INTO software (sw_nm, mnf_nm, sw_ver, sw_ea, rgst_id, rgst_dt) VALUES ('"
				+swVO.getSwNm()+"', '"+swVO.getMnfNm()+"', '"+swVO.getSwVer()+"', "+swVO.getSwEa()+", '"
				+swVO.getRgstId()+"', NOW());";
		
		stmt.executeUpdate(sql);
	}
	
	public void updateSoftware(SoftwareVO swVO) throws Exception {
		Connection conn = SQLConn.getConnection();
		
		Statement stmt = null;
	    stmt = conn.createStatement();
		
		String sql = "UPDATE software SET sw_nm = '" + swVO.getSwNm() + "', "
				+ "mnf_nm = '" + swVO.getMnfNm() + "', "
				+ "sw_ver = '" + swVO.getSwVer() + "', "
				+ "sw_ea = " + swVO.getSwEa()
				+ " WHERE sw_seq = " + swVO.getSwSeq();
		
		stmt.executeUpdate(sql);
	    
		stmt.close();
		conn.close();
	}
	
	public void deleteSoftware(SoftwareVO swVO) throws Exception {
		Connection conn = SQLConn.getConnection();
		
		Statement stmt = null;
	    stmt = conn.createStatement();
		
		String sql = "DELETE FROM software WHERE sw_seq = " + swVO.getSwSeq();
		
		stmt.execute(sql);
	    
		stmt.close();
		conn.close();
	}
}
