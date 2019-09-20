package kr.co.kakao.util;

public class CommonUtils {

	public static int StringToZero(String str) {
		return stringToNumber(str, 0);
	}
	
	
	public static int stringToNumber(String str, int defaultNumber) {
		if(str == null) {
			return defaultNumber;
		}
		try {
			return Integer.parseInt(str);
		} catch (NumberFormatException e) {
			return defaultNumber;
		}
	}

	public static String nullToString(String str, String defaultString) {
		if(str == null) {
			return defaultString;
		}
		try {
			return str;
		} catch (Exception e) {
			return defaultString;
		}
	}
}
