// ORM class for table 'logData'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Sun Oct 29 16:29:43 UTC 2017
// For connector: org.apache.sqoop.manager.MySQLManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class logData extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("blog", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        blog = (String)value;
      }
    });
    setters.put("hitRatio", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        hitRatio = (Double)value;
      }
    });
    setters.put("missRatio", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        missRatio = (Double)value;
      }
    });
    setters.put("year", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        year = (Integer)value;
      }
    });
    setters.put("month", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        month = (Integer)value;
      }
    });
    setters.put("day", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        day = (Integer)value;
      }
    });
    setters.put("hour", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        hour = (Integer)value;
      }
    });
  }
  public logData() {
    init0();
  }
  private String blog;
  public String get_blog() {
    return blog;
  }
  public void set_blog(String blog) {
    this.blog = blog;
  }
  public logData with_blog(String blog) {
    this.blog = blog;
    return this;
  }
  private Double hitRatio;
  public Double get_hitRatio() {
    return hitRatio;
  }
  public void set_hitRatio(Double hitRatio) {
    this.hitRatio = hitRatio;
  }
  public logData with_hitRatio(Double hitRatio) {
    this.hitRatio = hitRatio;
    return this;
  }
  private Double missRatio;
  public Double get_missRatio() {
    return missRatio;
  }
  public void set_missRatio(Double missRatio) {
    this.missRatio = missRatio;
  }
  public logData with_missRatio(Double missRatio) {
    this.missRatio = missRatio;
    return this;
  }
  private Integer year;
  public Integer get_year() {
    return year;
  }
  public void set_year(Integer year) {
    this.year = year;
  }
  public logData with_year(Integer year) {
    this.year = year;
    return this;
  }
  private Integer month;
  public Integer get_month() {
    return month;
  }
  public void set_month(Integer month) {
    this.month = month;
  }
  public logData with_month(Integer month) {
    this.month = month;
    return this;
  }
  private Integer day;
  public Integer get_day() {
    return day;
  }
  public void set_day(Integer day) {
    this.day = day;
  }
  public logData with_day(Integer day) {
    this.day = day;
    return this;
  }
  private Integer hour;
  public Integer get_hour() {
    return hour;
  }
  public void set_hour(Integer hour) {
    this.hour = hour;
  }
  public logData with_hour(Integer hour) {
    this.hour = hour;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof logData)) {
      return false;
    }
    logData that = (logData) o;
    boolean equal = true;
    equal = equal && (this.blog == null ? that.blog == null : this.blog.equals(that.blog));
    equal = equal && (this.hitRatio == null ? that.hitRatio == null : this.hitRatio.equals(that.hitRatio));
    equal = equal && (this.missRatio == null ? that.missRatio == null : this.missRatio.equals(that.missRatio));
    equal = equal && (this.year == null ? that.year == null : this.year.equals(that.year));
    equal = equal && (this.month == null ? that.month == null : this.month.equals(that.month));
    equal = equal && (this.day == null ? that.day == null : this.day.equals(that.day));
    equal = equal && (this.hour == null ? that.hour == null : this.hour.equals(that.hour));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof logData)) {
      return false;
    }
    logData that = (logData) o;
    boolean equal = true;
    equal = equal && (this.blog == null ? that.blog == null : this.blog.equals(that.blog));
    equal = equal && (this.hitRatio == null ? that.hitRatio == null : this.hitRatio.equals(that.hitRatio));
    equal = equal && (this.missRatio == null ? that.missRatio == null : this.missRatio.equals(that.missRatio));
    equal = equal && (this.year == null ? that.year == null : this.year.equals(that.year));
    equal = equal && (this.month == null ? that.month == null : this.month.equals(that.month));
    equal = equal && (this.day == null ? that.day == null : this.day.equals(that.day));
    equal = equal && (this.hour == null ? that.hour == null : this.hour.equals(that.hour));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.blog = JdbcWritableBridge.readString(1, __dbResults);
    this.hitRatio = JdbcWritableBridge.readDouble(2, __dbResults);
    this.missRatio = JdbcWritableBridge.readDouble(3, __dbResults);
    this.year = JdbcWritableBridge.readInteger(4, __dbResults);
    this.month = JdbcWritableBridge.readInteger(5, __dbResults);
    this.day = JdbcWritableBridge.readInteger(6, __dbResults);
    this.hour = JdbcWritableBridge.readInteger(7, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.blog = JdbcWritableBridge.readString(1, __dbResults);
    this.hitRatio = JdbcWritableBridge.readDouble(2, __dbResults);
    this.missRatio = JdbcWritableBridge.readDouble(3, __dbResults);
    this.year = JdbcWritableBridge.readInteger(4, __dbResults);
    this.month = JdbcWritableBridge.readInteger(5, __dbResults);
    this.day = JdbcWritableBridge.readInteger(6, __dbResults);
    this.hour = JdbcWritableBridge.readInteger(7, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(blog, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeDouble(hitRatio, 2 + __off, 8, __dbStmt);
    JdbcWritableBridge.writeDouble(missRatio, 3 + __off, 8, __dbStmt);
    JdbcWritableBridge.writeInteger(year, 4 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(month, 5 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(day, 6 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(hour, 7 + __off, 4, __dbStmt);
    return 7;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(blog, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeDouble(hitRatio, 2 + __off, 8, __dbStmt);
    JdbcWritableBridge.writeDouble(missRatio, 3 + __off, 8, __dbStmt);
    JdbcWritableBridge.writeInteger(year, 4 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(month, 5 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(day, 6 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(hour, 7 + __off, 4, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.blog = null;
    } else {
    this.blog = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.hitRatio = null;
    } else {
    this.hitRatio = Double.valueOf(__dataIn.readDouble());
    }
    if (__dataIn.readBoolean()) { 
        this.missRatio = null;
    } else {
    this.missRatio = Double.valueOf(__dataIn.readDouble());
    }
    if (__dataIn.readBoolean()) { 
        this.year = null;
    } else {
    this.year = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.month = null;
    } else {
    this.month = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.day = null;
    } else {
    this.day = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.hour = null;
    } else {
    this.hour = Integer.valueOf(__dataIn.readInt());
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.blog) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, blog);
    }
    if (null == this.hitRatio) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeDouble(this.hitRatio);
    }
    if (null == this.missRatio) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeDouble(this.missRatio);
    }
    if (null == this.year) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.year);
    }
    if (null == this.month) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.month);
    }
    if (null == this.day) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.day);
    }
    if (null == this.hour) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.hour);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.blog) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, blog);
    }
    if (null == this.hitRatio) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeDouble(this.hitRatio);
    }
    if (null == this.missRatio) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeDouble(this.missRatio);
    }
    if (null == this.year) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.year);
    }
    if (null == this.month) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.month);
    }
    if (null == this.day) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.day);
    }
    if (null == this.hour) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.hour);
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(blog==null?"null":blog, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(hitRatio==null?"null":"" + hitRatio, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(missRatio==null?"null":"" + missRatio, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(year==null?"null":"" + year, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(month==null?"null":"" + month, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(day==null?"null":"" + day, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(hour==null?"null":"" + hour, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(blog==null?"null":blog, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(hitRatio==null?"null":"" + hitRatio, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(missRatio==null?"null":"" + missRatio, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(year==null?"null":"" + year, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(month==null?"null":"" + month, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(day==null?"null":"" + day, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(hour==null?"null":"" + hour, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.blog = null; } else {
      this.blog = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.hitRatio = null; } else {
      this.hitRatio = Double.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.missRatio = null; } else {
      this.missRatio = Double.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.year = null; } else {
      this.year = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.month = null; } else {
      this.month = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.day = null; } else {
      this.day = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.hour = null; } else {
      this.hour = Integer.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.blog = null; } else {
      this.blog = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.hitRatio = null; } else {
      this.hitRatio = Double.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.missRatio = null; } else {
      this.missRatio = Double.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.year = null; } else {
      this.year = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.month = null; } else {
      this.month = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.day = null; } else {
      this.day = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.hour = null; } else {
      this.hour = Integer.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    logData o = (logData) super.clone();
    return o;
  }

  public void clone0(logData o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("blog", this.blog);
    __sqoop$field_map.put("hitRatio", this.hitRatio);
    __sqoop$field_map.put("missRatio", this.missRatio);
    __sqoop$field_map.put("year", this.year);
    __sqoop$field_map.put("month", this.month);
    __sqoop$field_map.put("day", this.day);
    __sqoop$field_map.put("hour", this.hour);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("blog", this.blog);
    __sqoop$field_map.put("hitRatio", this.hitRatio);
    __sqoop$field_map.put("missRatio", this.missRatio);
    __sqoop$field_map.put("year", this.year);
    __sqoop$field_map.put("month", this.month);
    __sqoop$field_map.put("day", this.day);
    __sqoop$field_map.put("hour", this.hour);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
