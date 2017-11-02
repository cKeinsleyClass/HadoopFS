package edu.rosehulman.gilmordw;

import java.io.IOException;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;

public class GradeToLetter extends EvalFunc<String> {

	@Override
	public String exec(Tuple input) throws IOException {
		if (input == null || input.size() == 0)
			return null;
		Object t1 = input.get(0);
		if (t1 == null)
			return null;
		Double grade = (Double) t1;
		if (grade >= 90)
			return "A";
		if (grade > 80)
			return "B";
		if (grade > 70)
			return "C";
		if (grade > 60)
			return "D";
		return "F";
	}

}
