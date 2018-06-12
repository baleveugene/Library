<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">   
    <head>
        <!-- Meta -->
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <title> All authors</title>
        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="../resources/assets/css/bootstrap.min.css">       
        <!-- Customizable CSS -->
        <link rel="stylesheet" href="../resources/assets/css/main.css">
        <link rel="stylesheet" href="../resources/assets/css/green.css">
        <link rel="stylesheet" href="../resources/assets/css/owl.carousel.css">
        <link rel="stylesheet" href="../resources/assets/css/owl.transitions.css">
        <link rel="stylesheet" href="../resources/assets/css/animate.min.css">
        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>       
        <!-- Icons/Glyphs -->
        <link rel="stylesheet" href="../resources/assets/css/font-awesome.min.css">       
        <!-- Favicon -->
        <link rel="shortcut icon" href="../resources/assets/images/favicon.ico"> 
    </head>   
    <body>   
        <div class="wrapper">
<!-- ============================================================= HEADER ============================================================= -->
        <%@include file="/WEB-INF/pages/header.jsp" %>
<!-- ============================================================= HEADER : END ============================================================= -->
            <div class="animate-dropdown">
<!-- ========================================= BREADCRUMB ========================================= --> 
                <div id="top-mega-nav">
                    <div class="container">
                        <nav>
                            <ul class="inline">
                            <li class="dropdown le-dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-list"></i>Sections</a>

                                <ul class="dropdown-menu">
                                    <li><a href="/book">All books</a></li> 
                                    <li><a href="/author">All authors</a></li>
                                </ul>
                            </li>
                            <li class="breadcrumb-nav-holder"> 
                            <ul>                           
                                <li class="breadcrumb-item">
                                    <a href="${pageContext.request.contextPath}/index">Home</a>
                                </li> 
                                <li class="breadcrumb-item current">
                                    <a href="#">Authors</a>
                                </li> 
                            </ul>
                            </li><!-- /.breadcrumb-nav-holder -->
                            </ul><!-- /.inline -->
                        </nav>
                    </div><!-- /.container -->
                </div><!-- /#top-mega-nav -->
<!-- ========================================= BREADCRUMB : END ========================================= -->
                </div>
                <section id="category-grid">
                    <div class="container">       
<!-- ========================================= SIDEBAR ========================================= -->
                        <div class="col-xs-12 col-sm-3 no-margin sidebar narrow">
                            <div class="widget">                                                                    
                                <form:form id="addForm" action="/author/add" method="GET">    
                                    <button class="le-button small">Add new author</button>             
                                </form:form>  
                            </div><!-- /.widget -->
                        </div>
<!-- ========================================= SIDEBAR : END ========================================= -->
<!-- ========================================= CONTENT ========================================= -->
                        <div class="col-xs-12 col-sm-9 no-margin wide sidebar">   
                            <section id="gaming">
                                <div class="grid-list-products">
                                    <div class="control-bar">
                                        <div class="grid-list-buttons">
                                            <ul>
                                                <li class="grid-list-button-item active"><a data-toggle="tab" href="#grid-view"><i class="fa fa-th-large"></i> Grid</a></li>
                                                <li class="grid-list-button-item "><a data-toggle="tab" href="#list-view"><i class="fa fa-th-list"></i> List</a></li>
                                            </ul>
                                        </div>
                                    </div>                               
                                    <div class="tab-content">
                                        <div id="grid-view" class="products-grid fade tab-pane in active">               
                                            <div class="product-grid-holder">
                                                <div class="row no-margin">                    
                                                    <c:forEach items="${listAuthors}" var="author"> 
                                                        <div class="col-xs-12 col-sm-4 no-margin product-item-holder hover">
                                                            <div class="product-item">                            
                                                                <div class="image">                                    
                                                                    <a href="/author-${author.url}">
                                                                        <img alt="${author.name}" src="../resources/assets/images/content/${author.photo1}" 
                                                                                                data-echo="../resources/assets/images/content/${author.photo1}" width="246" height="186" />
                                                                    </a>
                                                                </div>
                                                                <div class="body">                                   
                                                                    <div class="title">
                                                                        <a href="/author-${author.url}"> ${author.name}  </a>
                                                                    </div>                                                                                                                
                                                                </div>                      
                                                            </div><!-- /.product-item -->
                                                        </div><!-- /.product-item-holder -->
                                                    </c:forEach>
                       
                                                    <c:if test="${empty listAuthors}">
                                                        <div class="container-fluid">
                                                            <div class="col-lg-10 center-block items-holder">
                                                                <div class="inner-xs">
                                                                    <div class="page-header">
                                                                        <h2 class="page-title">There are no authors yet.
                                                                        </h2>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>         
                                                </div><!-- /.row -->
                                            </div><!-- /.product-grid-holder -->
           
                                            <c:if test="${!empty listAuthors}">      
                                                <div class="pagination-holder">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-6 text-left">
                                                            <ul class="pagination ">
                                                                <c:forEach begin="1" end="${allPage}" var="i">
                                                                    <li  <c:if test="${i == page}"> class="current" </c:if> >
                                                                        <a  href="${currentpagewithoutpage}&page=${i}">${i}</a>
                                                                    </li>
                                                                </c:forEach>
                                                            </ul>
                                                        </div>                        
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="result-counter">
                                                                Showing <span>1-9?</span> of <span>${itemsNum}</span> results
                                                            </div>
                                                        </div>
                                                    </div><!-- /.row -->
                                                </div>
                                            </c:if> 
                                        </div><!-- /.products-grid #grid-view -->    
                                        <div id="list-view" class="products-grid fade tab-pane ">
                                            <div class="products-list">
                                                <c:if test="${!empty listAuthors}">      
                                                    <div class="pagination-holder">
                                                        <div class="row">
                                                            <div class="col-xs-12 col-sm-6 text-left">
                                                                <ul class="pagination ">
                                                                    <c:forEach begin="1" end="${allPage}" var="i">
                                                                        <li  <c:if test="${i == page}"> class="current" </c:if> >
                                                                            <a  href="${currentpagewithoutpage}&page=${i}">${i}</a>
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </div>                      
                                                            <div class="col-xs-12 col-sm-6">
                                                                <div class="result-counter">
                                                                    Showing <span>1-9?</span> of <span>${itemsNum}</span> results
                                                                </div>
                                                            </div>
                                                        </div><!-- /.row -->
                                                    </div>
                                                </c:if>
                                            </div><!-- /.products-grid #list-view -->
                                        </div><!-- /.tab-content -->
                                    </div><!-- /.grid-list-products -->
                                </div>
                            </section><!-- /#gaming -->            
                        </div><!-- /.col -->
<!-- ========================================= CONTENT : END ========================================= -->    
                    </div><!-- /.container -->
                </section><!-- /#category-grid -->    
<!-- ============================================================= FOOTER ============================================================= -->
                <%@include file="/WEB-INF/pages/footer.jsp" %>
<!-- ============================================================= FOOTER : END ============================================================= -->   
        </div><!-- /.wrapper -->
        <!-- JavaScripts placed at the end of the document so the pages load faster -->
        <script src="../resources/assets/js/jquery-1.10.2.min.js"></script>
        <script src="../resources/assets/js/jquery-migrate-1.2.1.js"></script>
        <script src="../resources/assets/js/bootstrap.min.js"></script>              
        <script src="../resources/assets/js/bootstrap-hover-dropdown.min.js"></script>
        <script src="../resources/assets/js/owl.carousel.min.js"></script>
        <script src="../resources/assets/js/css_browser_selector.min.js"></script>
        <script src="../resources/assets/js/echo.min.js"></script>
        <script src="../resources/assets/js/jquery.easing-1.3.min.js"></script>
        <script src="../resources/assets/js/bootstrap-slider.min.js"></script>       
        <script src="../resources/assets/js/jquery.prettyPhoto.min.js"></script>       
        <script src="../resources/assets/js/wow.min.js"></script>
        <script src="../resources/assets/js/scripts.js"></script>
        <script src="http://w.sharethis.com/button/buttons.js"></script>
    </body>
</html>