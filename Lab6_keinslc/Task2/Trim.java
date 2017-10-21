package edu.rosehulman.keinslc;

import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.Text;

public class Trim extends UDF {

	public Text evaluate(Text s) {
		if (s == null) {
			return null;
		}
		String string = s.toString();
		string = string.replace(".", "");
		string = string.replace(",", "");
		string = string.replace("(", "");
		string = string.replace(")", "");
		return new Text(string);
	}

}