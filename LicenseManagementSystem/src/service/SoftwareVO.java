package service;

public class SoftwareVO {	
	private String swSeq = ""; // sw 순번
	private String swNm = ""; // sw명
	private String mnfNm = ""; // 제조사명
	private String swVer = ""; // 버전
	private int swEa = 0; // 수량
	private String rgstId = ""; // 등록자
	private String rgstDt = ""; // 등록일
	
	public String getSwSeq() {
		return swSeq;
	}
	public void setSwSeq(String swSeq) {
		this.swSeq = swSeq;
	}
	public String getSwNm() {
		return swNm;
	}
	public void setSwNm(String swNm) {
		this.swNm = swNm;
	}
	public String getMnfNm() {
		return mnfNm;
	}
	public void setMnfNm(String mnfNm) {
		this.mnfNm = mnfNm;
	}
	public String getSwVer() {
		return swVer;
	}
	public void setSwVer(String swVer) {
		this.swVer = swVer;
	}
	public int getSwEa() {
		return swEa;
	}
	public void setSwEa(int swEa) {
		this.swEa = swEa;
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
