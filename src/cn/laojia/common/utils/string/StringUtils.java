package cn.laojia.common.utils.string;

import java.util.regex.Pattern;

public class StringUtils
{
	public static boolean isNotNull(String string)
	{
		boolean flog = false;
		if (string != null && !"".equals(string.trim()))
		{
			flog = true;
		}
		return flog;
	}

	public static String valueOf(Object object)
	{

		return valueOf(object, "");
	}

	public static String valueOf(Object object, String defaultEmptyValue)
	{

		if (object == null)
		{
			return defaultEmptyValue;
		}

		return String.valueOf(object);
	}

	public static boolean isEmptyOrNull(Object object)
	{

		if (valueOf(object).equals(""))
		{
			return true;
		}

		return false;
	}

	public static boolean isNotEmptyOrNull(Object object)
	{
		return !isEmptyOrNull(object);
	}

	public static String BuildSqlIds(String sourceString, String splitString)
	{
		if (isEmptyOrNull(sourceString))
		{
			return "";
		} else
		{
			String[] ids = sourceString.split(splitString);
			String IdsStr = "";
			for (String str : ids)
			{
				IdsStr += "'" + str + "',";
			}
			IdsStr = IdsStr.substring(0, IdsStr.lastIndexOf(","));
			return IdsStr;
		}
	}

	/**
	 * 替换字符串
	 * 
	 * @author E.FLY
	 * @date 2012-12-13
	 * @time 下午06:01:34
	 * @param sourcce
	 *            源字符
	 * @param flags
	 *            是否区分大小写
	 * @param regex
	 *            正则表达式
	 * @param replace
	 *            替换成的字符串
	 * @return
	 */
	public static String replaceAll(String sourcce, boolean flags, String regex, String replace)
	{
		Pattern p = flags ? Pattern.compile(regex, Pattern.CASE_INSENSITIVE) : Pattern.compile(regex);
		String replaceAll = p.matcher(sourcce).replaceAll(replace);
		return replaceAll;
	}

	 

	 

	public static String changeNull(Object value)
	{
		if (!isEmptyOrNull(value))
		{
			return value.toString().trim();
		} else
		{
			return "";
		}
	}

	public static boolean notNull(String param)
	{
		if (param != null && !"".equals(param))
		{
			return true;
		} else
		{
			return false;
		}
	}

	/**
	 * 检查指定的字符串是否为空。
	 * 
	 * @param value
	 *            待检查的字符串
	 * @return true/false
	 */
	public static boolean isEmpty(String value)
	{
		int strLen;
		if (value == null || (strLen = value.length()) == 0)
		{
			return true;
		}
		for (int i = 0; i < strLen; i++)
		{
			if ((Character.isWhitespace(value.charAt(i)) == false))
			{
				return false;
			}
		}
		return true;
	}
	public static String getIds(String id)
	{
		String ids =null;
		if(id==null) ids="";
		else{
			ids = id.replaceAll(",", "','");
			ids="'"+ids+"'";
		}
		return ids;
	}
}
