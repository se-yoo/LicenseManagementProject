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
	    String sql = "SELECT *, DATE(rgst_dt) FROM software";
	    
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
	    	newSw.setRgstDt(rs.getString(8));
	    	
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
	    String sql = "SELECT *, DATE(rgst_dt) FROM software WHERE sw_seq = " + swVO.getSwSeq();
	    
	    rs = stmt.executeQuery(sql);
	     
	    if(rs.next()){
	    	result.setSwSeq(rs.getString(1));
	    	result.setSwNm(rs.getString(2));
	    	result.setMnfNm(rs.getString(3));
	    	result.setSwVer(rs.getString(4));
	    	result.setSwEa(rs.getInt(5));
	    	result.setRgstId(rs.getString(6));
	    	result.setRgstDt(rs.getString(8));
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
	
	public List<SoftwareKeyVO> getSoftwareKeyList(SoftwareVO swVO) throws Exception {
		List<SoftwareKeyVO> results = new ArrayList<>();
		
		Connection conn = SQLConn.getConnection();
        Statement stmt = null;
		
        ResultSet rs = null;
	    stmt = conn.createStatement();
	    String sql = "SELECT *, DATE(rgst_dt) FROM software_key WHERE sw_seq = " + swVO.getSwSeq();
	    
	    rs = stmt.executeQuery(sql);
	     
	    while(rs.next()){
	    	SoftwareKeyVO newSwKey = new SoftwareKeyVO();
	    	newSwKey.setSwSeq(rs.getString(1));
	    	newSwKey.setLicKey(rs.getString(2));
	    	newSwKey.setAllowCnt(rs.getInt(3));
	    	newSwKey.setRgstId(rs.getString(4));
	    	newSwKey.setRgstDt(rs.getString(6));
	    	
	    	results.add(newSwKey);
	    }
	    
		stmt.close();
		conn.close();
         
		return results;
	}
	
	public SoftwareKeyVO getSoftwareKey(SoftwareKeyVO swKeyVO) throws Exception {
		SoftwareKeyVO result = new SoftwareKeyVO();
		
		Connection conn = SQLConn.getConnection();
        Statement stmt = null;
		
        ResultSet rs = null;
	    stmt = conn.createStatement();
	    String sql = "SELECT *, DATE(rgst_dt) FROM software_key WHERE sw_seq = " + swKeyVO.getSwSeq()
	    		+" AND lic_key = '"+swKeyVO.getLicKey()+"'";
	    
	    rs = stmt.executeQuery(sql);
	     
	    if(rs.next()){
	    	result.setSwSeq(rs.getString(1));
	    	result.setLicKey(rs.getString(2));
	    	result.setAllowCnt(rs.getInt(3));
	    	result.setRgstId(rs.getString(4));
	    	result.setRgstDt(rs.getString(6));
	    }
	    
		stmt.close();
		conn.close();
         
		return result;
	}
	
	public void createSoftwareKey(SoftwareKeyVO swKeyVO) throws Exception {
		Connection conn = SQLConn.getConnection();
		
		Statement stmt = null;
	    stmt = conn.createStatement();
		
		String sql = "INSERT INTO software_key (sw_seq, lic_key, allow_cnt, rgst_id, rgst_dt) VALUES ("
				+swKeyVO.getSwSeq()+", '"+swKeyVO.getLicKey()+"', "+swKeyVO.getAllowCnt()+", '"
				+swKeyVO.getRgstId()+"', NOW());";
		
		stmt.executeUpdate(sql);
	}
	
	public void updateSoftwareKey(SoftwareKeyVO swKeyVO) throws Exception {
		Connection conn = SQLConn.getConnection();
		
		Statement stmt = null;
	    stmt = conn.createStatement();
		
		String sql = "UPDATE software_key SET allow_cnt = " + swKeyVO.getAllowCnt()
				+ " WHERE sw_seq = " + swKeyVO.getSwSeq()
				+ " AND lic_key = '" + swKeyVO.getLicKey() + "'";
		
		stmt.executeUpdate(sql);
	    
		stmt.close();
		conn.close();
	}
	
	public void deleteSoftwareKey(SoftwareKeyVO swKeyVO) throws Exception {
		Connection conn = SQLConn.getConnection();
		
		Statement stmt = null;
	    stmt = conn.createStatement();
		
		String sql = "DELETE FROM software_key WHERE sw_seq = " + swKeyVO.getSwSeq()
			+ " AND lic_key = '" + swKeyVO.getLicKey() + "'";
		
		stmt.execute(sql);
	    
		stmt.close();
		conn.close();
	}
	
	public List<SoftwareKeyHistVO> getSoftwareKeyHistList(SoftwareKeyVO swKeyVO) throws Exception {
		List<SoftwareKeyHistVO> results = new ArrayList<>();
		
		Connection conn = SQLConn.getConnection();
        Statement stmt = null;
		
        ResultSet rs = null;
	    stmt = conn.createStatement();
	    String sql = "SELECT *, DATE(rgst_dt) FROM software_key_hist WHERE sw_seq = " + swKeyVO.getSwSeq()
	    		+ " AND lic_key = '" + swKeyVO.getLicKey() + "'";
	    
	    rs = stmt.executeQuery(sql);
	     
	    while(rs.next()){
	    	SoftwareKeyHistVO newSwKeyHist = new SoftwareKeyHistVO();
	    	newSwKeyHist.setHistSeq(rs.getString(1));
	    	newSwKeyHist.setSwSeq(rs.getString(2));
	    	newSwKeyHist.setLicKey(rs.getString(3));
	    	newSwKeyHist.setUserNm(rs.getString(4));
	    	newSwKeyHist.setUseStrtDt(rs.getString(5));
	    	newSwKeyHist.setUseEndDt(rs.getString(6));
	    	newSwKeyHist.setStatCd(rs.getInt(7));
	    	newSwKeyHist.setRgstId(rs.getString(8));
	    	newSwKeyHist.setRgstDt(rs.getString(10));
	    	
	    	results.add(newSwKeyHist);
	    }
	    
		stmt.close();
		conn.close();
         
		return results;
	}
	
	public SoftwareKeyHistVO getSoftwareKeyHist(SoftwareKeyHistVO swKeyHistVO) throws Exception {
		SoftwareKeyHistVO result = new SoftwareKeyHistVO();
		
		Connection conn = SQLConn.getConnection();
        Statement stmt = null;
		
        ResultSet rs = null;
	    stmt = conn.createStatement();
	    String sql = "SELECT *, DATE(rgst_dt) FROM software_key_history WHERE hist_seq = " + swKeyHistVO.getHistSeq();
	    
	    rs = stmt.executeQuery(sql);
	     
	    if(rs.next()){
	    	result.setHistSeq(rs.getString(1));
	    	result.setSwSeq(rs.getString(2));
	    	result.setLicKey(rs.getString(3));
	    	result.setUserNm(rs.getString(4));
	    	result.setUseStrtDt(rs.getString(5));
	    	result.setUseEndDt(rs.getString(6));
	    	result.setStatCd(rs.getInt(7));
	    	result.setRgstId(rs.getString(8));
	    	result.setRgstDt(rs.getString(10));
	    }
	    
		stmt.close();
		conn.close();
         
		return result;
	}
	
	public void createSoftwareKeyHist(SoftwareKeyHistVO swKeyHistVO) throws Exception {
		Connection conn = SQLConn.getConnection();
		
		Statement stmt = null;
	    stmt = conn.createStatement();
		
		String sql = "INSERT INTO software_key_history (sw_seq, lic_key, user_nm, use_strt_dt, stat_cd, rgst_id, rgst_dt) VALUES ("
				+swKeyHistVO.getSwSeq()+", '"+swKeyHistVO.getLicKey()+"', '"+swKeyHistVO.getUserNm()+"', "
				+"NOW(), 0, '" + swKeyHistVO.getRgstId()+"', NOW());";
		
		stmt.executeUpdate(sql);
	}
	
	public void updateSoftwareKeyHist(SoftwareKeyHistVO swKeyHistVO) throws Exception {
		Connection conn = SQLConn.getConnection();
		
		Statement stmt = null;
	    stmt = conn.createStatement();
		
		String sql = "UPDATE software_key_history SET stat_cd = 1, use_end_dt = NOW()"
				+ " WHERE hist_seq = " + swKeyHistVO.getHistSeq();
		
		stmt.executeUpdate(sql);
	    
		stmt.close();
		conn.close();
	}
}
