package service;

public class SoftwareKeyVO {
	private String swSeq = ""; // sw ����
	private String licKey = ""; // ���̼��� Ű
	private int allowCnt = 0; // ����ο�
	private String rgstId = ""; // �����
	private String rgstDt = ""; // �����
	
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
}
