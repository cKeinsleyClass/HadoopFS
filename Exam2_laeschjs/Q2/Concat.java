package edu.rosehulman.laeschjs;

import java.io.IOException;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;

public class Concat extends EvalFunc<String> {

	@Override
	public String exec(Tuple input) throws IOException {
		if (input == null || input.size() < 2) {
			return null;
		}
		String fname = (String) input.get(0);
		String lname = (String) input.get(1);
		return fname + " " + lname;
	}

}
