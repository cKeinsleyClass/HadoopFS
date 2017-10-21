package edu.rosehulman.gilmordw;

import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;

public class CreateTables {
	
	public static void main(String[] args) throws IOException {
		System.out.println("starting hbase");
		Configuration conf = HBaseConfiguration.create();
		Connection connection = ConnectionFactory.createConnection(conf);
		HBaseAdmin admin = (HBaseAdmin) connection.getAdmin();
		
		System.out.println("have admin");
		
		HTableDescriptor tableDes = new HTableDescriptor(TableName.valueOf("java_test_table"));
		tableDes.addFamily(new HColumnDescriptor("test"));
		
		admin.createTable(tableDes);
		
		System.out.println("made table test");
		
		Table table = connection.getTable(TableName.valueOf("test"));
		
		Put p = new Put(Bytes.toBytes("test1"));
		p.addColumn(Bytes.toBytes("test"), Bytes.toBytes("qualifier"), Bytes.toBytes("data"));
		table.put(p);
	}
}
