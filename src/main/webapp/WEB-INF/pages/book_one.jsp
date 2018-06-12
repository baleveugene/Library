<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Meta -->
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title> About ${book.name} </title>
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
                                        <li class="breadcrumb-item">
                                            <a href="/book">Books</a>
                                        </li>                       
                                        <li class="breadcrumb-item current">
                                            <a href="">${book.name}</a>
                                        </li> 
                                    </ul>
                                </li><!-- /.breadcrumb-nav-holder --> 
                            </ul><!--/.inline--> 
                        </nav>
                    </div><!--/.container--> 
                </div><!--/#top-mega-nav--> 
<!-- ========================================= BREADCRUMB : END ========================================= -->
            </div>     
            <div id="single-product">
                <div class="container">
                    <div class="no-margin col-xs-12 col-sm-6 col-md-5 gallery-holder">
                        <div class="product-item-holder size-big single-product-gallery small-gallery">
                            <div id="owl-single-product">
                                <div class="single-product-gallery-item" id="slide1">         
                                    <a data-rel="prettyphoto" href="../resources/assets/images/content/${book.photo1}">
                                        <img class="img-responsive" alt="${book.name}" 
                                            src="../resources/assets/images/content/${book.photo1}" 
                                            data-echo="../resources/assets/images/content/${book.photo1}" />                                              
                                    </a>
                                </div><!-- /.single-product-gallery-item -->                 
                            </div><!-- /.single-product-slider -->
                            <div class="single-product-gallery-thumbs gallery-thumbs">
                                <div id="owl-single-product-thumbnails">
                                    <a class="horizontal-thumb active" data-target="#owl-single-product" data-slide="0" href="#slide1">                  
                                        <img width="67" alt="${book.name}" src="../resources/assets/images/content/${book.photo1}" 
                                             data-echo="../resources/assets/images/content/${book.photo1}" />
                                    </a>
                                </div><!--/#owl-single-product-thumbnails--> 
                                <div class="nav-holder left hidden-xs">
                                    <a class="prev-btn slider-prev" data-target="#owl-single-product-thumbnails" href="#prev"></a>
                                </div><!--/.nav-holder-->            
                                <div class="nav-holder right hidden-xs">
                                    <a class="next-btn slider-next" data-target="#owl-single-product-thumbnails" href="#next"></a>
                                </div> <!--/.nav-holder--> 
                            </div><!-- /.gallery-thumbs -->
                        </div><!-- /.single-product-gallery -->
                    </div><!-- /.gallery-holder -->        
                    <div class="no-margin col-xs-12 col-sm-7 body-holder">
                        <div class="body">    
                            <div class="title"><a href="#">${book.name}</a></div><br>
                            <div class="social-row">
                                <span class="st_facebook_hcount"></span>
                                <span class="st_twitter_hcount"></span>
                                <span class="st_pinterest_hcount"></span>
                            </div><br>
                            <div class="excerpt">
                                <p>${book.description}</p>
                            </div>        
                            <form:form id="filterForm" action="/book-${book.url}/update" method="GET">    
                                <button class="le-button small">Update book</button>             
                            </form:form><br> 
                            <form:form id="filterForm" action="/book-${book.url}/delete" method="GET">    
                                <button class="le-button small">Delete book</button>             
                            </form:form>        
                        </div><!-- /.body -->
                    </div><!-- /.body-holder -->
                </div><!-- /.container -->
            </div><!-- /.single-product -->
<!-- ========================================= SINGLE PRODUCT TAB ========================================= -->
            <section id="single-product-tab">
                <div class="container">
                    <div class="tab-holder">            
                        <ul class="nav nav-tabs simple">
                            <li><a href="#description" data-toggle="tab">Video</a></li>
                            <li class="active" ><a href="#additional-info" data-toggle="tab">Book details</a></li>              
                        </ul><!-- /.nav-tabs -->
                        <div class="tab-content">
                            <div class="tab-pane" id="description">
                                <p>${vmc.info1en}</p> 
                                <iframe width="480" height="360" src="https://www.youtube.com/watch?v=7LSaATzQfTE" frameborder="0" allowfullscreen></iframe>              
                            </div>          
                            <div class="tab-pane active" id="additional-info">
                                <ul class="tabled-data">          
                                    <li>
                                        <label>Title</label>
                                        <div class="value">${book.name}</div>                           
                                    </li>
                                    <li>
                                        <label>Author</label>
                                        <div class="value">${author.name}</div>                          
                                    </li>
                                    <li>
                                        <label>Year</label>
                                        <div class="value">${book.yearOfPublication}</div>                          
                                    </li>
                                    <li>
                                        <label>Volume</label>
                                        <div class="value">${book.volume}</div>                          
                                    </li>
                                    <li>
                                        <label>Publisher</label>
                                        <div class="value">${book.publisher}</div>                          
                                    </li>
                                    <li>
                                        <label>City</label>
                                        <div class="value">${book.cityOfPublication}</div>                          
                                    </li>
                                </ul>
                            </div>    
                        </div><!-- /.tab-content -->
                    </div><!-- /.tab-holder -->
                </div><!-- /.container -->
            </section><!-- /#single-product-tab -->
<!-- ========================================= SINGLE PRODUCT TAB : END ========================================= -->
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
        <script src="../resources/assets/js/jquery.customSelect.min.js"></script>
        <script src="../resources/assets/js/wow.min.js"></script>
        <script src="../resources/assets/js/scripts.js"></script>       
        <script src="http://w.sharethis.com/button/buttons.js"></script>
    </body>
</html>