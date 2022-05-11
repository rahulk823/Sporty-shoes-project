< %@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import = "java.sql.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		try{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			//establish a connection with mysql databse
			String url = "jdbc:mysql://localhost:3306/laSchema";
			String user = "root";
			String password = "rahul123";
			Connection con=DriverManager.getConnection(url, user, password);
			String query= "select c.ClassId, c.Class as ClassName, c.Room_No, c.Section, s.StudentId, s.Student_Name, s.Roll_No, t.TeacherId, t.Teacher_Name, t.Subject as Subject_Name, j.Subject_Code, j.SubjectId from Class_Details c, Student_Details s,Teacher_Details t, Subject_Details j where  s.Class = c.Class and t.Class = c.Class and j.Subject_Name = t.Subject order by ClassId, SubjectId,TeacherId, StudentId;";
			PreparedStatement stmt=con.prepareStatement(query);
			ResultSet rs= stmt.executeQuery();
			if(rs.next()==false)
			{
				out.println("No records found in the tables");
				
			}
			else
				{%>
				
				
				<table border="1">
				<tr><th>ClassId</th><th>ClassName</th><th>Room_No</th><th>Section</th><th>StudentId</th><th>Student_Name</th><th>Roll_No</th><th>TeacherId</th><th>Teacher_Name</th><th>Subject_Name</th><th>Subject_Code</th><th>SubjectId</th></tr>	
				<%
					do
					{%>
				
				<tr><td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td><td><%=rs.getString(6)%></td><td><%=rs.getString(7)%></td><td><%=rs.getString(8)%></td><td><%=rs.getString(9)%></td><td><%=rs.getString(10)%></td><td><%=rs.getString(11)%></td><td><%=rs.getString(12)%></td></tr>   
				
				
				
		 
		<%}while(rs.next()); %>
		
			</table>
			
			
		
		
		<%}}catch(Exception e)
	
		{
			System.out.println(e.getMessage());
			e.getStackTrace();
			
			}
			
		
	%>
	
	
	

</body>
</html>