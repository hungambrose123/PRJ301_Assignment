<%-- 
    Document   : register
    Created on : May 31, 2023, 8:37:13 AM
    Author     : Warspite
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <form action="login" method="post">
            <table>
                <tr>
                    <td>User name:</td><td><input type="text" name="user"/></td>
                </tr>
                <tr>
                    <td>Password:</td><td><input type="password" name="pass"/></td>
                </tr>
                <tr>
                    <td>Email:</td><td><input type="email" name="email"/></td>
                </tr>
                <tr>
                    <td></td><td><input type="submit" value="register"/></td>
                </tr>
            </table>
        </form>
        <h3 style="color: red">${message}</h3>
        <a href="home.jsp">Return to home</a>
    </body>
</html>
