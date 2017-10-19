package edu.rosehulman.laeschjs;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.pig.EvalFunc;
import org.apache.pig.FuncSpec;
import org.apache.pig.data.DataType;
import org.apache.pig.data.Tuple;
import org.apache.pig.impl.logicalLayer.FrontendException;
import org.apache.pig.impl.logicalLayer.schema.Schema;

public class Ratio extends EvalFunc<Double> {

	@Override
	public Double exec(Tuple input) throws IOException {
		if (input == null || input.size() < 2) {
			return null;
		}
		if (input.get(0) == null) {
			return (double) 0;
		}
		double hitsOrErrors = (Long)input.get(0);
		if (hitsOrErrors == 0) {
			return (double) 0;
		}
		double total = (Long)input.get(1);
		return (double) hitsOrErrors / total;
	}

}
