package kr.co.kakao.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringJoiner;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cookies {

	private HttpServletResponse resp;
	private Map<String, List<String>> map = new HashMap<String, List<String>>();
	
	public Cookies(HttpServletRequest req, HttpServletResponse resp) {
		this.resp = resp;
		Cookie[] cookies = req.getCookies();
		for (Cookie cookie : cookies) {
			String name = cookie.getName();
			String text = cookie.getValue();
			String[] values = text.split(":");
			for (String value : values ) {
				addValue(name, value);
			}
		}
	}
	
	public List<String> getValues(String name) {
		return map.get(name);
	}
	
	public void addValue(String name, String value) {
		if (map.containsKey(name)) {
			if (!exist(name, value)) {
				map.get(name).add(0, value);
				resizeValues(name);
			}
		} else {
			List<String> values = new ArrayList<String>();
			values.add(0, value);
			map.put(name, values);
			resizeValues(name);
		}
	}
	
	public void sendCookie(String name) {
		List<String> values = map.get(name);
		StringJoiner joiner = new StringJoiner(":");
		for (String value : values) {
			joiner.add(value);
		}
		Cookie cookie = new Cookie(name, joiner.toString());
		cookie.setMaxAge(60*60*24*7);
		resp.addCookie(cookie);
	}
	
	private boolean exist(String name, String value) {
		return map.get(name).contains(value);
	}
	
	private void resizeValues(String name) {
		List<String> values = map.get(name);
		if (values.size() > 4) {
			values.remove(4);
		}		
	}
	
}









