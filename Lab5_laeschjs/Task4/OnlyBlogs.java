package edu.rosehulman.laeschjs;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.pig.FilterFunc;
import org.apache.pig.FuncSpec;
import org.apache.pig.data.DataType;
import org.apache.pig.data.Tuple;
import org.apache.pig.impl.logicalLayer.FrontendException;
import org.apache.pig.impl.logicalLayer.schema.Schema;

public class OnlyBlogs extends FilterFunc {

	@Override
	public List<FuncSpec> getArgToFuncMapping() throws FrontendException{
		List<FuncSpec> funcSpecs = new ArrayList<FuncSpec>();
		funcSpecs.add(new FuncSpec(this.getClass().getName(), 
				new Schema(new Schema.FieldSchema(null, DataType.CHARARRAY))));
		return funcSpecs;
	}

	@Override
	public Boolean exec(Tuple input) throws IOException {
		if (input == null || input.size() < 1) {
			return false;
		}
		String full_path = ((String) input.get(0));
		if (full_path == null) {
			return false;
		}
		String[] arr = full_path.split("/");
		if (arr.length < 3) {
			return false;
		}
		if (!arr[1].equals("blogs")) {
			return false;
		}
		return true;
	}

}
