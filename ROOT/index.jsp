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
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a", user, "root");
        out.println ("database successfully opened.<br />");

        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from test");

        //out.println(con.cursor().description());
        //out.println(stmt.executeQuery("show columns from test") + "<br/>");
        while (rs.next()) out.println(rs.getInt("id") + " " +
        rs.getString("name") + " " + rs.getInt("age") + "<br />");
    }
    catch(SQLException e) {
        out.println("SQLException caught: " +e.getMessage());
    }
%>
</body>
</html> 