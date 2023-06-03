<%-- 
    Document   : login
    Created on : May 31, 2023, 7:55:19 AM
    Author     : Warspite
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <form name="input" action="login" method="get">
            <table>
                <tr>
                    <td>User name:</td><td><input type="text" name="user"/></td>
                </tr>
                <tr>
                    <td>Password:</td><td><input type="password" name="pass"/></td>
                </tr>
                <tr>
                    <td></td><td><input type="submit" value="login"/></td>
                </tr>
            </table>
        </form>
        <h3 style="color: red">${result}</h3>
        <a href="home.jsp">Return to home</a>
    </body>
</html>
