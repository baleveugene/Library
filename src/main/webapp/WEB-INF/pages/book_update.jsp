<%@ page language="java" contentType="text/html; charset=utf8"
         pageEncoding="utf8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update book</title>
        <!-- Favicon -->
        <link rel="shortcut icon" href="../resources/assets/images/favicon.ico">
        <link href="../resources/assets/css/form.css" rel="stylesheet" type="text/css" />              
    </head>
    <body>                  
        <div id="main">               
            <div id="content"> 
                <div id="form_name"><h1>Update Book</h1></div>
                <c:if test="${not empty error}">
                    <h2 style="color: #000">${error}</h2>
                </c:if>
                <c:if test="${not empty msg}">
                    <h2 style="color: #000">${msg}</h2>
                </c:if>
                <form:form class="formBox" id="form-update" action="/book-${book.url}/update" method="post">
                    <fieldset>
                        <h2>Please, change necessary info about book</h2>
                        <div class="form-col">
                            <label for="bookName" class="lab">Title of book</label>
                            <input type="text" name="bookName" class="input" placeholder="${book.name}" />
                        </div>
                        <div class="form-col form-col-right">
                            <label for="author" class="lab">Author</label>
                            <input type="text" name="author" class="input" placeholder="${author.name}" />
                        </div>
                        <div class="form-col">
                            <label for="publisher" class="lab">Publisher</label>
                            <input type="text" name="publisher" class="input" placeholder="${book.publisher}" />                 
                        </div>
                        <div class="form-col form-col-right">
                            <label for="yearOfPublication" class="lab">Year of publication</label>
                            <input type="text" name="yearOfPublication" class="input" placeholder="${book.yearOfPublication}" />
                        </div>
                        <div class="form-col">
                            <label for="cityOfPublication" class="lab">City of publication</label>
                            <input type="text" name="cityOfPublication" class="input" placeholder="${book.cityOfPublication}" />
                        </div>
                        <div class="form-col form-col-right">
                            <label for="volume" class="lab">Volume</label>
                            <input type="text" name="volume" class="input" placeholder="${book.volume}" />
                        </div>
                        <div class="form-col">
                            <label for="lang" class="lab">Language</label>
                            <input type="text" name="lang" class="input" placeholder="${book.lang}" />
                        </div>
                        <div class="form-col form-col-right">
                            <label for="description" class="lab">Description</label>
                            <input type="text" name="description" class="input" placeholder="${book.description}" />
                        </div>
                    </fieldset>                       
                        <input type="submit" value="Update" class="submit"/>
                        <input type="submit" value="Cancel" class="submit" onClick="history.go(-1);"/>                 
                </form:form>
            </div>
        </div><!-- /content -->
    </body>
</html>
