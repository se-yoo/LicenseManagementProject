package service;

public class SoftwareKeyVO {
	private String swSeq = ""; // sw 순번
	private String licKey = ""; // 라이선스 키
	private int allowCnt = 0; // 허용인원
	private String rgstId = ""; // 등록자
	private String rgstDt = ""; // 등록일
	
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
