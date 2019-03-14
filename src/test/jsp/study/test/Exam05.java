package test.jsp.study.test;

import java.util.HashMap;
import java.util.Map;

public class Exam05 {

	public static void main(String[] args) {
		String[] strs = new String[3];
		strs[0]="power";
		strs[1]="over";
		strs[2]="whelming";
		Map<String,String[]> map = new HashMap<>();
		map.put("id", strs);
		
		System.out.println(map.get("id")[0]);
	}
}
