package kr.co.link.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtilsJH {

	private static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 E요일 a HH:mm");
	
	public static String dateToString(Date date) {
		if (date == null) {
			return "";
		}
		return dateFormat.format(date);
	}
}
