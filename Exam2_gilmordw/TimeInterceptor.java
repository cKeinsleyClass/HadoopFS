package edu.rosehulman.gilmordw;

import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.flume.Context;
import org.apache.flume.Event;
import org.apache.flume.event.EventBuilder;
import org.apache.flume.interceptor.Interceptor;

public class TimeInterceptor implements Interceptor{

	public void initialize() {
		// TODO Auto-generated method stub
		
	}

	public Event intercept(Event event) {
		try {
			String eventBody = new String(event.getBody(), "UTF-8");
			if (eventBody.contains("Adding STATUS_COMMAND for component")) {
				return null;
			}
			String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());

			StringBuilder builder = new StringBuilder();
			builder.append(timeStamp).append("\t").append(eventBody);
			Event e = EventBuilder.withBody(builder.toString(), Charset.forName("UTF-8"));
			return e;
		} catch (Exception e) {
			return null;
		}
	}

	public List<Event> intercept(List<Event> events) {
		List<Event> eventList = new ArrayList<Event>();
		for (Event event : events) {
			Event outEvent = intercept(event);
			if (outEvent != null) {
				eventList.add(outEvent);
			}
		}
		return eventList;
	}

	public void close() {
		// TODO Auto-generated method stub
		
	}
	
	public static class Builder implements Interceptor.Builder {

		public Interceptor build() {
			return new TimeInterceptor();
		}

		public void configure(Context arg0) {
			// TODO Auto-generated method stub

		}

	}

}
