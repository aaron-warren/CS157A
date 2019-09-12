<%@ page import="java.sql.*" %>
<html>
<head>
<title>JDBC Connection example</title>
</head>
<body>
<h1>JDBC Connection example</h1>
<%
    String user = "root"; // assumes database name is the same as username
    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a", user, "Source151");
        out.println ("database successfully opened.<br />");

        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from test");

        out.println(stmt.executeQuery("show columns from test").getString(1) + "<br/>");
        while (rs.next()) out.println(rs.getInt(1) + " " +
        rs.getString(2) + " " + rs.getInt(3) + "<br />");
    }
    catch(SQLException e) {
        out.println("SQLException caught: " +e.getMessage());
    }
%>
</body>
</html> 