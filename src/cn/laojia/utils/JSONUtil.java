package cn.laojia.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class JSONUtil {

	public JSONUtil() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * ��json����ת��Ϊmap
	 * 
	 * @param strJSON
	 * @return map
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, Object> parseJSON2Map(String strJSON) {
		if (isJSONObject(strJSON))
			try {
				return (Map<String, Object>) __parseJSON(new JSONObject(strJSON));
			} catch (JSONException e) {
				return new HashMap<String, Object>();
			}
		else
			return new HashMap<String, Object>();
	}

	/**
	 * ��json����ת��Ϊlist
	 * 
	 * @param strJSON
	 * @return list
	 */
	@SuppressWarnings("unchecked")
	public static List<Object> parseJSON2List(String strJSON) {
		if (isJSONArray(strJSON))
			try {
				return (List<Object>) __parseJSON(new JSONArray(strJSON));
			} catch (JSONException e) {
				return new ArrayList<Object>();
			}
		else
			return new ArrayList<Object>();
	}

	/**
	 * ͨ��JSON�ַ���ת����JAVA����Map,List
	 * 
	 * @param strJSON
	 *            ֻ���Ƕ���{a:'',b:''}������['a','b']
	 * @return JSON
	 * @throws JSONException
	 */
	public static Object parseJSON(String strJSON) {
		Object obj = null;
		if (isJSONArray(strJSON)) {
			obj = parseJSON2List(strJSON);
		} else if (isJSONObject(strJSON)) {
			obj = parseJSON2Map(strJSON);
		}
		return obj;
	}

	public static Object parseJSON(HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		try {
			Map<String, String[]> parameterMap = request.getParameterMap();
			// ͨ��ѭ�������ķ�ʽ���key��value��set��JSONObject��
			Iterator<String> paIter = parameterMap.keySet().iterator();
			while (paIter.hasNext()) {
				String key = paIter.next().toString();
				String[] values = (String[]) parameterMap.get(key);
				jsonObject.accumulate(key, values[0]);
			}
			// log.debug("�ӿͻ��˻��json=" jsonObject.toString());
		} catch (Exception e) {
			// log.error("��ȡjson���ݳ���������Ϣ���£�nt" e.getMessage());
			e.printStackTrace();
		}
		return parseJSON(jsonObject.toString());
	}

	private static Object __parseJSON(Object jsonObj) throws JSONException {
		Object ret = null;
		if (jsonObj instanceof JSONArray) {
			JSONArray _array = (JSONArray) jsonObj;
			ArrayList<Object> _ret_list = new ArrayList<Object>();
			for (int _i = 0; _i < _array.length(); _i++) {
				Object _item = _array.get(_i);
				if (_item instanceof JSONObject || _item instanceof JSONArray)
					_ret_list.add(__parseJSON(_item));
				else
					_ret_list.add(_item);
			}
			ret = _ret_list;
		} else if (jsonObj instanceof JSONObject) {
			JSONObject _obj = (JSONObject) jsonObj;
			Map<String, Object> _ret_map = new HashMap<String, Object>();
			for (Iterator<?> _it = _obj.keys(); _it.hasNext();) {
				String _key = _it.next().toString();
				Object _item = _obj.get(_key);
				if (_item instanceof JSONObject || _item instanceof JSONArray)
					_ret_map.put(_key, __parseJSON(_item));
				else
					_ret_map.put(_key, _item);
			}
			ret = _ret_map;
		}
		return ret;
	}

	private static boolean isJSONArray(String strJSON) {
		return strJSON.matches("^\\s*\\[.*");
	}

	private static boolean isJSONObject(String strJSON) {
		return strJSON.matches("^\\s*\\{.*");
	}

}
