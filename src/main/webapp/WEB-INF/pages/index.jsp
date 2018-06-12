<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">     
        <title>Library</title>
        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="../resources/assets/css/bootstrap.min.css">      
        <!-- Customizable CSS -->
        <link rel="stylesheet" href="<c:url value="../resources/assets/css/main.css" />">
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
    <div id="top-banner-and-menu">
        <div class="container">       
            <!-- ================================== TOP NAVIGATION ================================== -->
<div class="col-xs-12 col-sm-4 col-md-3 sidemenu-holder">
    <div class="side-menu animate-dropdown">
        <div class="head"><i class="fa fa-list"></i>Sections</div>        
        <nav class="yamm megamenu-horizontal" role="navigation">
        <ul class="nav">          
            <li><a href="/book">All books</a></li> 
            <li><a href="/author">All authors</a></li>
        </ul><!-- /.nav -->
        </nav><!-- /.megamenu-horizontal -->
    </div><!-- /.side-menu -->
</div><!-- /.sidemenu-holder -->
<!-- ================================== TOP NAVIGATION : END ================================== -->     

<div class="col-xs-12 col-sm-8 col-md-9 homebanner-holder">
    <div id="hero">
        <div id="owl-main" class="owl-carousel owl-inner-nav owl-ui-sm">
            <div class="item" style="background-image: url(../resources/assets/images/content/books/clean-code-a.jpg);">
                <div class="container-fluid">
                    <div class="caption vertical-center text-left">
                        <div class="big-text fadeInDown-1" style="color:green">
                            Robert C. Martin<span class="big"><span class="sign"></span>Clean code</span>
                        </div>
                        <div class="button-holder fadeInDown-2">
                            <a href="/book" class="big le-button ">View all books</a>
                        </div>                      
                    </div>           
                </div>
            </div>
               
            <div class="item" style="background-image: url(../resources/assets/images/content/books/thinking-in-java.jpg);">
                <div class="container-fluid">
                    <div class="caption vertical-center text-left">
                        <div class="big-text fadeInDown-1" style="color: black">
                            Bruce Eckel<span class="big"><span class="sign"></span>Thinking in Java</span>
                        </div>
                        <div class="button-holder fadeInDown-2">
                            <a href="/book" class="big le-button ">View all books</a>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
    </div>
</div>
</div>
</div>
</div> 
</div>            
<!-- ========================================== FOOTER ============================================ -->
<%@include file="/WEB-INF/pages/footer.jsp" %>
<!-- ========================================== FOOTER : END ====================================== -->  
    <!-- JavaScripts placed at the end of the document so the pages load faster -->
    <script src="../resources/assets/js/jquery-1.10.2.min.js"></script>
    <script src="../resources/assets/js/jquery-migrate-1.2.1.js"></script>
    <script src="../resources/assets/js/bootstrap.min.js"></script>
    <script src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
    <script src="../resources/assets/js/gmap3.min.js"></script>
    <script src="../resources/assets/js/bootstrap-hover-dropdown.min.js"></script>
    <script src="../resources/assets/js/owl.carousel.min.js"></script>
    <script src="../resources/assets/js/css_browser_selector.min.js"></script>
    <script src="../resources/assets/js/echo.min.js"></script>
    <script src="../resources/assets/js/jquery.easing-1.3.min.js"></script>
    <script src="../resources/assets/js/bootstrap-slider.min.js"></script>
    <script src="../resources/assets/js/jquery.raty.min.js"></script>
    <script src="../resources/assets/js/jquery.prettyPhoto.min.js"></script>
    <script src="../resources/assets/js/jquery.customSelect.min.js"></script>
    <script src="../resources/assets/js/wow.min.js"></script>
    <script src="../resources/assets/js/scripts.js"></script>
    <script src="http://w.sharethis.com/button/buttons.js"></script>
</body>
</html>