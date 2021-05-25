package service;

public class SoftwareKeyHistVO {
	private String histSeq = ""; // 이력 순번
	private String swSeq = ""; // sw 순번
	private String licKey = ""; // 라이선스 키
	private String userNm = ""; // 사용자 이름
	private String useStrtDt = ""; // 사용 시작일
	private String useEndDt = ""; // 사용 완료일
	private int statCd = 0; // 상태 코드
	private String rgstId = ""; // 등록자
	private String rgstDt = ""; // 등록일
	
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
			statCdNm = "사용중";
			break;
		case 1 :
			statCdNm = "사용완료";
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
