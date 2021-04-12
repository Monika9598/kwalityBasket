package com.kwalitybasket.controller;

import com.kwalitybasket.utils.PasswordUtil;

import java.sql.*;

public class JdbcTest {
    public static void main(String[] args) {
        String password = "KwalityBasket";
        System.out.println(PasswordUtil.encrypt(password));
        System.out.println(PasswordUtil.decrypt(PasswordUtil.encrypt(password)));
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Class not found " + e);
        }
        System.out.println("JDBC Class found");
        int no_of_rows = 0;

        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://103.145.51.51:3306/kwalitybasket?serverTimezone=UTC", "kwalitybasket", "@123#987_456&*kB");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM address");
            while (rs.next()) {
                no_of_rows++;
            }
            System.out.println("There are " + no_of_rows + " record in the table");
        } catch (SQLException e) {
            System.out.println("SQL exception occured" + e);
        }
    }

}
