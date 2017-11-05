// ORM class for table 'examDatas'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Tue Oct 31 06:02:06 UTC 2017
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

public class examDatas extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("name", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        name = (String)value;
      }
    });
    setters.put("cno", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        cno = (String)value;
      }
    });
    setters.put("cname", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        cname = (String)value;
      }
    });
    setters.put("grade", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        grade = (String)value;
      }
    });
    setters.put("username", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        username = (String)value;
      }
    });
  }
  public examDatas() {
    init0();
  }
  private String name;
  public String get_name() {
    return name;
  }
  public void set_name(String name) {
    this.name = name;
  }
  public examDatas with_name(String name) {
    this.name = name;
    return this;
  }
  private String cno;
  public String get_cno() {
    return cno;
  }
  public void set_cno(String cno) {
    this.cno = cno;
  }
  public examDatas with_cno(String cno) {
    this.cno = cno;
    return this;
  }
  private String cname;
  public String get_cname() {
    return cname;
  }
  public void set_cname(String cname) {
    this.cname = cname;
  }
  public examDatas with_cname(String cname) {
    this.cname = cname;
    return this;
  }
  private String grade;
  public String get_grade() {
    return grade;
  }
  public void set_grade(String grade) {
    this.grade = grade;
  }
  public examDatas with_grade(String grade) {
    this.grade = grade;
    return this;
  }
  private String username;
  public String get_username() {
    return username;
  }
  public void set_username(String username) {
    this.username = username;
  }
  public examDatas with_username(String username) {
    this.username = username;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof examDatas)) {
      return false;
    }
    examDatas that = (examDatas) o;
    boolean equal = true;
    equal = equal && (this.name == null ? that.name == null : this.name.equals(that.name));
    equal = equal && (this.cno == null ? that.cno == null : this.cno.equals(that.cno));
    equal = equal && (this.cname == null ? that.cname == null : this.cname.equals(that.cname));
    equal = equal && (this.grade == null ? that.grade == null : this.grade.equals(that.grade));
    equal = equal && (this.username == null ? that.username == null : this.username.equals(that.username));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof examDatas)) {
      return false;
    }
    examDatas that = (examDatas) o;
    boolean equal = true;
    equal = equal && (this.name == null ? that.name == null : this.name.equals(that.name));
    equal = equal && (this.cno == null ? that.cno == null : this.cno.equals(that.cno));
    equal = equal && (this.cname == null ? that.cname == null : this.cname.equals(that.cname));
    equal = equal && (this.grade == null ? that.grade == null : this.grade.equals(that.grade));
    equal = equal && (this.username == null ? that.username == null : this.username.equals(that.username));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.name = JdbcWritableBridge.readString(1, __dbResults);
    this.cno = JdbcWritableBridge.readString(2, __dbResults);
    this.cname = JdbcWritableBridge.readString(3, __dbResults);
    this.grade = JdbcWritableBridge.readString(4, __dbResults);
    this.username = JdbcWritableBridge.readString(5, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.name = JdbcWritableBridge.readString(1, __dbResults);
    this.cno = JdbcWritableBridge.readString(2, __dbResults);
    this.cname = JdbcWritableBridge.readString(3, __dbResults);
    this.grade = JdbcWritableBridge.readString(4, __dbResults);
    this.username = JdbcWritableBridge.readString(5, __dbResults);
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
    JdbcWritableBridge.writeString(name, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(cno, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(cname, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(grade, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(username, 5 + __off, 12, __dbStmt);
    return 5;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(name, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(cno, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(cname, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(grade, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(username, 5 + __off, 12, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.name = null;
    } else {
    this.name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.cno = null;
    } else {
    this.cno = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.cname = null;
    } else {
    this.cname = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.grade = null;
    } else {
    this.grade = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.username = null;
    } else {
    this.username = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, name);
    }
    if (null == this.cno) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, cno);
    }
    if (null == this.cname) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, cname);
    }
    if (null == this.grade) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, grade);
    }
    if (null == this.username) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, username);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, name);
    }
    if (null == this.cno) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, cno);
    }
    if (null == this.cname) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, cname);
    }
    if (null == this.grade) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, grade);
    }
    if (null == this.username) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, username);
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
    __sb.append(FieldFormatter.escapeAndEnclose(name==null?"null":name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(cno==null?"null":cno, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(cname==null?"null":cname, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(grade==null?"null":grade, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(username==null?"null":username, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(name==null?"null":name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(cno==null?"null":cno, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(cname==null?"null":cname, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(grade==null?"null":grade, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(username==null?"null":username, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 9, (char) 10, (char) 0, (char) 0, false);
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
    if (__cur_str.equals("null")) { this.name = null; } else {
      this.name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.cno = null; } else {
      this.cno = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.cname = null; } else {
      this.cname = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.grade = null; } else {
      this.grade = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.username = null; } else {
      this.username = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.name = null; } else {
      this.name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.cno = null; } else {
      this.cno = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.cname = null; } else {
      this.cname = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.grade = null; } else {
      this.grade = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.username = null; } else {
      this.username = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    examDatas o = (examDatas) super.clone();
    return o;
  }

  public void clone0(examDatas o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("name", this.name);
    __sqoop$field_map.put("cno", this.cno);
    __sqoop$field_map.put("cname", this.cname);
    __sqoop$field_map.put("grade", this.grade);
    __sqoop$field_map.put("username", this.username);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("name", this.name);
    __sqoop$field_map.put("cno", this.cno);
    __sqoop$field_map.put("cname", this.cname);
    __sqoop$field_map.put("grade", this.grade);
    __sqoop$field_map.put("username", this.username);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
