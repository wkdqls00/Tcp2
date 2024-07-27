package dto;

public class ScriptwritecountDTO {

	private int scriptwritecount;

	public ScriptwritecountDTO(int scriptwritecount) {
		this.scriptwritecount = scriptwritecount;
	}

	public int getScriptwritecount() {
		return scriptwritecount;
	}

	public void setScriptwritecount(int scriptwritecount) {
		this.scriptwritecount = scriptwritecount;
	}

	@Override
	public String toString() {
		return "ScriptwritecountDTO [scriptwritecount=" + scriptwritecount + "]";
	}


}
