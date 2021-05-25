package service;

public class SoftwareKeyHistVO {
	private String histSeq = ""; // �̷� ����
	private String swSeq = ""; // sw ����
	private String licKey = ""; // ���̼��� Ű
	private String userNm = ""; // ����� �̸�
	private String useStrtDt = ""; // ��� ������
	private String useEndDt = ""; // ��� �Ϸ���
	private int statCd = 0; // ���� �ڵ�
	private String rgstId = ""; // �����
	private String rgstDt = ""; // �����
	
	public String getHistSeq() {
		return histSeq;
	}
	public void setHistSeq(String histSeq) {
		this.histSeq = histSeq;
	}
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
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getUseStrtDt() {
		return useStrtDt;
	}
	public void setUseStrtDt(String useStrtDt) {
		this.useStrtDt = useStrtDt;
	}
	public String getUseEndDt() {
		return useEndDt;
	}
	public void setUseEndDt(String useEndDt) {
		this.useEndDt = useEndDt;
	}
	public int getStatCd() {
		return statCd;
	}
	public void setStatCd(int statCd) {
		this.statCd = statCd;
	}
	public String getStatCdNm() {
		String statCdNm = "";
		
		switch(statCd) {
		case 0 :
			statCdNm = "�����";
			break;
		case 1 :
			statCdNm = "���Ϸ�";
			break;
		}
		
		return statCdNm;
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
