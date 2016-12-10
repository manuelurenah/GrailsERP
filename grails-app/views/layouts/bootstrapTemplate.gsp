<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><g:layoutTitle default="Grails ERP"/></title>
    <link href="https://fonts.googleapis.com/css?family=Cabin|Josefin+Sans|Merriweather+Sans" rel="stylesheet">
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js" />

    <g:layoutHead/>

    %{--Para incluir otros recursos.--}%
    <g:pageProperty name="page.header"/>

</head>

<body>
    <div id="wrapper">
        <!-- Page Header -->
        <header id="site-header">
            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <g:link uri="/" class="navbar-brand">Grails ERP</g:link>
                </div>

                <!-- Top Menu Items -->
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <sec:ifLoggedIn>
                            <sec:ifAnyGranted roles="ROLE_ADMIN">
                                <li><g:link controller="admin" action="index">Admin</g:link></li>
                                <li><g:link controller="department" action="index">Departments</g:link></li>
                                <li><g:link controller="user" action="index">Users</g:link></li>
                                <li><g:link controller="product" action="index">Products</g:link></li>
                            </sec:ifAnyGranted>
                            <li><g:link controller="purchase" action="list">Purchases</g:link></li>
                        </sec:ifLoggedIn>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <sec:ifLoggedIn>
                            <li><g:link controller="cart" action="index" >Cart</g:link></li>
                            <li><g:link controller="user" action="logout">Logout</g:link></li>
                        </sec:ifLoggedIn>
                        <sec:ifNotLoggedIn>
                            <li><g:link controller="user" action="login">Login</g:link></li>
                        </sec:ifNotLoggedIn>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- /#site-header -->

        <!-- Page Body -->
        <main id="site-main">
            <div class="container-fluid">
                <g:pageProperty name="page.banner"/>
            </div>
            <div class="container">
                <br>
                <g:pageProperty name="page.body"/>
            </div>
            <!-- /.container-fluid -->
        </main>
        <!-- /#site-main -->

        <!-- Page Footer -->
        <footer id="site-footer">
            <div class="container-fluid">
                <p class="text-muted">
                    Luis E. Rojas,
                    Manuel E. Ureña &
                    Frankie Garabito <br />
                    2016 &copy All Rights Reserved.
                </p>
            </div>
            <!-- /.container-fluid -->
        </footer>
        <!-- /#site-footer -->

    </div>
    <!-- /#wrapper -->


</body>
</html>
