package service;

public class SoftwareKeyVO {
	private String swSeq = ""; // sw ����
	private String licKey = ""; // ���̼��� Ű
	private int allowCnt = 0; // ����ο�
	private String rgstId = ""; // �����
	private String rgstDt = ""; // �����
	
	private int srchStat = -1;
	private String srchUserNm = "";
	
	public String getSwSeq() {
		return swSeq;
	}
	public void setSwSeq(String swSeq) {
		this.swSeq = swSeq;
	}
	public String getLicKey() {
		return licKey;
	}
	public void setLicKey(String licKey) {
		this.licKey = licKey;
	}
	public int getAllowCnt() {
		return allowCnt;
	}
	public void setAllowCnt(int allowCnt) {
		this.allowCnt = allowCnt;
	}
	public String getRgstId() {
		return rgstId;
	}
	public void setRgstId(String rgstId) {
		this.rgstId = rgstId;
	}
	public String getRgstDt() {
		return rgstDt;
	}
	public void setRgstDt(String rgstDt) {
		this.rgstDt = rgstDt;
	}
	public int getSrchStat() {
		return srchStat;
	}
	public void setSrchStat(int srchStat) {
		this.srchStat = srchStat;
	}
	public String getSrchUserNm() {
		return srchUserNm;
	}
	public void setSrchUserNm(String srchUserNm) {
		this.srchUserNm = srchUserNm;
	}
}
