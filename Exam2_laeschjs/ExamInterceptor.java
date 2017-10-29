package edu.rosehulman.laeschjs;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.flume.Context;
import org.apache.flume.Event;
import org.apache.flume.event.EventBuilder;
import org.apache.flume.interceptor.Interceptor;

public class ExamInterceptor implements Interceptor {

	public void close() {
		// TODO Auto-generated method stub

	}

	public void initialize() {
		// TODO Auto-generated method stub

	}

	public Event intercept(Event event) {
		try{
		    String eventBody = new String(event.getBody(),"UTF-8");
		    //Use String builder to write the new Event.
		    StringBuilder builder = new StringBuilder();
		    int min = Calendar.getInstance().get(Calendar.MINUTE);
		    int hour = Calendar.getInstance().get(Calendar.HOUR);
		    int ampm = Calendar.getInstance().get(Calendar.AM_PM);
		    String isPM = "AM";
		    if (ampm > 0) {
		    	isPM = "PM";
		    }
		    builder.append("" + hour + ":" + min + isPM).append(eventBody);
		    Event e = EventBuilder.withBody(builder.toString(), Charset.forName("UTF-8"));
		    return e;
			}
			catch(Exception exp){ return null;}
	}

	public List<Event> intercept(List<Event> events) {
		List<Event> eventList = new ArrayList<Event>();
		  for (Event event : events) {
	      Event outEvent = intercept(event);
	      if(outEvent !=null){
	    	  eventList.add(outEvent);
	      }
	    }
	    return eventList;
	}

	  public static class Builder implements Interceptor.Builder {

	    
	    
	    public Interceptor build() {
	      return new ExamInterceptor();
	    }

	 
		
		public void configure(Context arg0) {
			// TODO Auto-generated method stub
			
		}

	  }
}
