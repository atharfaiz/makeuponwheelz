<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Attendance Enroll Data</title>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>
<body>
<h1>Attendance Enroll Data</h1>

<table>
  <tr>
    <th>Machine ID</th>
    <th>Enroll No</th>
    <th>Enroll Name</th>
    <th>Finger No</th>
    <th>Privilege</th>
  </tr>
  <c:forEach items="${list}" var="attendance">
  
  <tr>
    <td>${attendance.machineId}</td>
    <td>${attendance.enrollNo}</td>
    <td>${attendance.enrollName}</td>
    <td>${attendance.fingerNo}</td>
    <td>${attendance.privilege}</td>
  </tr>
  
  </c:forEach>
  
</table>


</body>
</html>