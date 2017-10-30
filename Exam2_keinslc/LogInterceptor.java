package edu.rosehulman.keinslc;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import org.apache.flume.Context;
import org.apache.flume.Event;
import org.apache.flume.event.EventBuilder;
import org.apache.flume.interceptor.Interceptor;

public class LogInterceptor implements Interceptor {

	public void close() {
		// eh whatever
	}

	public void initialize() {
		// eh whatev
	}

	public Event intercept(Event event) {
		try {
			String eventBody = new String(event.getBody(), "UTF-8");
			StringBuilder builder = new StringBuilder();
			Calendar cal = GregorianCalendar.getInstance();
			builder.append("Parse Time: ");
			builder.append(cal.get(Calendar.MONTH) + " ");
			builder.append(cal.get(Calendar.DATE) + " ");
			builder.append(cal.get(Calendar.YEAR) + ", ");
			builder.append(eventBody);
			return EventBuilder.withBody(builder.toString(), Charset.forName("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			return null;
		}
	}

	public List<Event> intercept(List<Event> events) {
		List<Event> output = new ArrayList<Event>();
		for (Event event : events) {
			Event newEvent = intercept(event);
			if (newEvent != null) {
				output.add(newEvent);
			}
		}
		return output;
	}

	public static class Builder implements Interceptor.Builder {

		@Override
		public void configure(Context arg0) {
			// whatever
		}

		@Override
		public Interceptor build() {
			return new LogInterceptor();
		}

	}

}
