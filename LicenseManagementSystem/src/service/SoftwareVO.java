package service;

public class SoftwareVO {	
	private String swSeq = ""; // sw ����
	private String swNm = ""; // sw��
	private String mnfNm = ""; // �������
	private String swVer = ""; // ����
	private int swEa = 0; // ����
	private String rgstId = ""; // �����
	private String rgstDt = ""; // �����
	
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
