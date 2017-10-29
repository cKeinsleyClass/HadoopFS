package edu.rosehulman.laeschjs;

import java.io.IOException;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;

public class ConvertGrade extends EvalFunc<String> {

	@Override
	public String exec(Tuple input) throws IOException {
		if (input == null || input.size() < 1) {
			return null;
		}
		double score = (Double) input.get(0);
		if (score <= 60) {
			return "F";
		} else if (score <= 70) {
			return "D";
		} else if (score <= 80) {
			return "C";
		} else if (score < 90) {
			return "B";
		}
		return "A";
	}

}
