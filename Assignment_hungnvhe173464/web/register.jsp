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
        <title>JSP Page</title>
    </head>
    <body>
        <form name="input" action="register" method="get">
            <table>
                <tr>
                    <td>User name:</td><td><input type="text" name="user"/></td>
                </tr>
                <tr>
                    <td>Password:</td><td><input type="password" name="pass"/></td>
                </tr>
                <tr>
                    <td></td><td><input type="submit" value="register"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
