<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.io.*" %>
<html>
    <body>
        <h2>Hello Heroku!</h2><br/>
        <form action="/hello" method="post">
        <input type="text"></input><br/>
        <input type="submit" onClick="form.submit()" value="submit">Submit</input>
        </form>
    </body>
</html>