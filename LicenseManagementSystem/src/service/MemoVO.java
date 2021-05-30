package service;

public class MemoVO {
	private String memoSeq = "";
	private String memoTitle = "";
	private String memoCont = "";
	private String rgstId = "";
	private String rgstDt = "";
	
	public String getMemoSeq() {
		return memoSeq;
	}
	public void setMemoSeq(String memoSeq) {
		this.memoSeq = memoSeq;
	}
	public String getMemoTitle() {
		return memoTitle;
	}
	public void setMemoTitle(String memoTitle) {
		this.memoTitle = memoTitle;
	}
	public String getMemoCont() {
		return memoCont;
	}
	public void setMemoCont(String memoCont) {
		this.memoCont = memoCont;
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
