package common;

import java.io.File;

public class UtilMgr {
	
	public static String replace(String _str,String _pattern,String _replace) {
		int s = 0, e = 0;
		StringBuffer result = new StringBuffer();
		
		while((e = _str.indexOf(_pattern,s)) >= 0) {
			result.append(_str.substring(s,e));
			result.append(_replace);
			s = e + _pattern.length();
		}
		result.append(_str.substring(s));
		return result.toString();
	}
	
	public static void deleteFile(String s) {
		File file = new File(s);
		if (file.isFile()) {
			file.delete();
		}
	}
	
	public static String nullString(String s) {
		String null_str = s;
		if(s==null) {
			null_str = "";
		}
		return null_str;
	}
	
	public static String boardSelected(String _boardName,String s) {
		String selected = "";
		if(_boardName.equals(s)) {
			selected = "selected";
		}
		return selected;
	}
	
	public static String boardDisable(String _boardName,String s,int _seq) {
		String display = "";
		//게시글 번호를 받아왔으며(수정 경로로 들어왔으며) 해당 게시글의 게시판이 아닌 경우
		if(_seq!=0 && boardSelected(_boardName, s).equals("")) {
			display = "display:none;";
		}
		return display;
	}
}

