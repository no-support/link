package kr.co.link.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	private static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	public static String dateToString(Date date) {
		if (date == null) {
			return "";
		}
		return dateFormat.format(date);
	}
}
