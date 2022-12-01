package org.example;

import javax.security.auth.Subject;
import java.sql.*;

public class Main {
    public static Connection connection;
    public static void main(String[] args) throws SQLException {
        connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/java_db", "postgres", "xcvZ3412");
        Statement statement = connection.createStatement();
        System.out.println("Первый запрос:");
        Query1(statement, "Физика");
        System.out.println("\nВторой запрос:");
        Query2(statement, "Математика");
        System.out.println("\nТретий запрос:");
        Query3(statement, "Каратаева", "Ева", "Адамовна");
        System.out.println("\nЧетвёртый запрос:");
        Query4(statement);
    }
    public static void Query1(Statement statement, String subject) throws SQLException {
        ResultSet rs = statement.executeQuery("select s.last_name, s.first_name, s.patronimic, p.mark \n" +
                "\tfrom education.Student s join education.Performance p on (s.student_id = p.student_id) \n" +
                "\t\tjoin education.Subject sub on (p.subject_id = sub.subject_id) \n" +
                "\twhere p.mark > 3 and sub.name = '" + subject + "';");
        RSprint(rs);
    }
    public static void Query2(Statement statement, String subject) throws SQLException {
        ResultSet rs = statement.executeQuery("select avg(mark) " +
                "from education.Performance p join education.Subject sub on (p.subject_id = sub.subject_id)" +
                "where sub.name = '" + subject + "';");
        RSprint(rs);
    }
    public static void Query3(Statement statement, String person_F, String person_I, String person_O) throws SQLException {
        ResultSet rs = statement.executeQuery("select avg(mark)" +
                "from education.Performance p join education.student sub on (p.student_id = sub.student_id)" +
                "where sub.first_name = '" + person_I + "' and sub.last_name = '" + person_F + "' and sub.patronimic = '" + person_O + "'");
        RSprint(rs);
    }
    public static void Query4(Statement statement) throws SQLException {
        ResultSet rs = statement.executeQuery("select sub.name, count(*)\n" +
                "from education.Performance p join education.Subject sub on (p.subject_id = sub.subject_id)\n" +
                "where mark > 2\n" +
                "group by sub.name\n" +
                "order by count(*) desc\n" +
                "limit 3;\n");
        RSprint(rs);
    }
    public static void RSprint(ResultSet rs) throws SQLException {
        int columns = rs.getMetaData().getColumnCount();
        while (rs.next()){
            for(int i = 1; i <= columns; i++){
                System.out.print(rs.getString(i) + "\t");
            }
            System.out.println();
        }
    }
}