<%@ page language="java" contentType="text/html; charset=utf8"
         pageEncoding="utf8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update author</title>
        <!-- Favicon -->
        <link rel="shortcut icon" href="../resources/assets/images/favicon.ico">
        <link href="../resources/assets/css/form.css" rel="stylesheet" type="text/css" />              
    </head>
    <body>                  
        <div id="main">               
            <div id="content"> 
                <div id="form_name"><h1>Update Author</h1></div>
                <c:if test="${not empty error}">
                    <h2 style="color: #000">${error}</h2>
                </c:if>
                <c:if test="${not empty msg}">
                    <h2 style="color: #000">${msg}</h2>
                </c:if>
                <form:form class="formBox" id="form-update" action="/author-${author.url}/update" method="post">
                    <fieldset>
                        <h2>Please, change necessary info about author</h2>
                        <div class="form-col">
                            <label for="authorName" class="lab">Author's name </label>
                            <input type="text" name="authorName" class="input" placeholder="${author.name}" />
                        </div>
                        <div class="form-col form-col-right">
                            <label for="description" class="lab">Description</label>
                            <input type="text" name="description" class="input" placeholder="${author.description}" />
                        </div>                       
                    </fieldset>                       
                        <input type="submit" value="Update" class="submit"/>
                        <input type="submit" value="Cancel" class="submit" onClick="history.go(-1);"/>                 
                </form:form>
            </div>
        </div><!-- /content -->
    </body>
</html>
