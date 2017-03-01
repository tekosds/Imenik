<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
        <title>Imenik</title>
        <base href="http://localhost:8080/Imenik/" />
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" type="text/css"/>
    </head>
    <body style="padding-top: 20px; padding-bottom: 20px; ">

        <div class="container">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand"  href="korisnik/pregled"  style="background-color: olivedrab; color: white">Imenik</a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="kontakt/kontakt/${idLogovanog}">Kontakti</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="" class="btn-default" style="background-color:  olivedrab">Odjava</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div><!--/.container-fluid -->
            </nav>
            <div class="container">  
                <%
                    if ((String) request.getAttribute("view") != "") {
                        pageContext.include((String) request.getAttribute("view") + ".jsp");
                    }
                %>
            </div>
    </body>
    
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>
    <!--<script src="js/kube.min.js"></script>-->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>
    <script> var $rows = $('#table tr');
        $('#search').keyup(function () {
            var val = '^(?=.*\\b' + $.trim($(this).val()).split(/\s+/).join('\\b)(?=.*\\b') + ').*$',
                    reg = RegExp(val, 'i'),
                    text;
            $rows.show().filter(function () {
                text = $(this).text().replace(/\s+/g, ' ');
                return !reg.test(text);
            }).hide();
        });
    </script>
</html>
