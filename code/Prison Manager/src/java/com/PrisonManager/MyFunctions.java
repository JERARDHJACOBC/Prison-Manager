package com.PrisonManager;

import java.io.*;
import javax.servlet.*;
import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;

public class MyFunctions {

    public MyFunctions() {
    }
    private static Connection conn = null;
    private static Statement stmt = null,  stmt1 = null;
    private static ResultSet rs = null;

    public static Connection openConnection() throws Exception {
        conn = com.PrisonManager.ConnectionPool.getConnection();
        return conn;
    }

    public static void closeConnection() throws Exception {
        conn.close();
    }
    //Function to generate Next ID for primary key in a db table
    public static String genNextID(String TableName, String IDName, String Pattern) {
        String MaxID = "", NextID = Pattern;
        int MaxNum = 0;
        int L = Pattern.length();

        try {
            openConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = null;
            String Query = "select max(`" + IDName + "`) from `" + TableName + "`";
            String Q2 = "Select max(CAST(SUBSTRING(" + IDName + "," + (L + 1) + ",BIT_LENGTH(" + IDName + ")) AS UNSIGNED)) from  " + TableName;
            //System.out.println(Q2);
            rs = stmt.executeQuery(Q2);
            if (rs == null) {
                return Pattern + "1";
            }
            if (rs.next()) {
                MaxID = rs.getString(1);
            }

            MaxNum = Integer.parseInt(MaxID);
            //System.out.println(MaxNum);
            MaxNum++;
            NextID += MaxNum;
            closeConnection();
            if (MaxNum != 0) {
                return NextID;
            } else {
                return Pattern + "1";
            }

        } catch (Exception e) {
            System.out.println("Exception in genNextID" + e);
            return Pattern + "1";
        }
    }

    public static String[] MyTokenizer(String S, String P) {
        StringTokenizer st = new StringTokenizer(S, P);
        int count = st.countTokens(), i = 0;
        String[] Tokens = new String[count];
        while (st.hasMoreTokens()) {
            Tokens[i] = st.nextToken();
            i++;
        }
        return Tokens;
    }

    public static ArrayList getPropList(String PropertyName,String TableName) throws Exception {
        String Sel_Prop = "Select distinct `" + PropertyName + "` from `"+TableName+"`";
        System.out.println(Sel_Prop);
        String str = "";
        ArrayList PropList = new ArrayList();
        try {
        openConnection();
        Statement stmt = conn.createStatement();
        
        rs = stmt.executeQuery(Sel_Prop);
        System.out.println("RESULTSET:"+rs);
        if (rs != null) {
            while (rs.next()) {
                str = rs.getString(1);
                PropList.add(str);
            }
        } else {
            System.out.println("result is null");
        }
        
        closeConnection();
        } catch (Exception e) {
            System.out.println("Exception in getPropList" + e);
            return null;
        }
        return PropList;
    }
}
