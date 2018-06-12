<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<header>
    <div class="container no-padding">
        
        <div class="col-xs-12 col-sm-12 col-md-3 logo-holder">
            <!-- ============================================================= LOGO ============================================================= -->
<div class="logo">
    <a href="index">
        <object id="sp" type="image/jpg" data="${pageContext.request.contextPath}/resources/assets/images/library_logo.jpg" width="220" height="80"></object>
    </a>
</div><!-- /.logo -->
<!-- ============================================================= LOGO : END ============================================================= -->     </div><!-- /.logo-holder -->
<div class="col-xs-12 col-sm-12 col-md-6 top-search-holder no-margin">
            <div class="contact-row">
                <div>
         <i></i>All books are very interesting and valable
    </div>
</div><!-- /.contact-row -->
<!-- ============================================================= SEARCH AREA ============================================================= -->
<div class="search-area">
    <form action="/search" method="GET">
        <div class="control-group">
            <input class="search-field" name="search" placeholder="Search by name for ${search} " />
        </div>
    </form>
</div>         
<!-- /.search-area -->
<!-- ============================================================= SEARCH AREA : END ============================================================= -->

</div><!-- /.container -->
</header>