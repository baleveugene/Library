<%@ page language="java" contentType="text/html; charset=utf8"
         pageEncoding="utf8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete author</title>
        <!-- Favicon -->
        <link rel="shortcut icon" href="../resources/assets/images/favicon.ico">
        <link href="../resources/assets/css/form.css" rel="stylesheet" type="text/css" />              
    </head>
    <body>                  
        <div id="main">               
            <div id="content"> 
                <div id="form_name"><h1>Delete Author</h1></div>
                <c:if test="${not empty error}">
                    <h2 style="color: #000">${error}</h2>
                </c:if>
                <c:if test="${not empty msg}">
                    <h2 style="color: #000">${msg}</h2>
                </c:if>
                <form:form class="formBox" id="form-add" action="/author-${author.url}/delete" method="post">
                    <h2>Are you really want to delete this author?</h2>                      
                    <input type="submit" name="submit" value="Delete" class="submit"/>
                    <input type="submit" value="Cancel" class="submit" onClick="history.go(-1);"/>                 
                </form:form>
            </div>
        </div><!-- /content -->
    </body>
</html>
