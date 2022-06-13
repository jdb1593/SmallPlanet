package common;

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

}
