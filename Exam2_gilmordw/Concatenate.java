package edu.rosehulman.gilmordw;

import java.io.IOException;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;

public class Concatenate extends EvalFunc<String> {

	@Override
	public String exec(Tuple input) throws IOException {
		if (input == null || input.size() == 0)
			return null;
		Object t1 = input.get(0);
		Object t2 = input.get(1);
		if (t1 == null || t2 == null)
			return null;
		String fname = (String) t1;
		String lname = (String) t2;
		return fname + " " + lname;
	}

}
