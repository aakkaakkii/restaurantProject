<#macro layout>
    <!DOCTYPE html>
    <html lang="FI">
    <head>
        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-151980211-1"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments);}
            gtag('js', new Date());

            gtag('config', 'UA-151980211-1');
        </script>
        <meta charset="UTF-8">
        <title>Georgian Kitchen: Georgian Restaurant in Finland</title>
        <link rel="stylesheet" href="/static/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="/static/src/css/main.css">
        <link rel="stylesheet" href="/static/src/css/styles.css">
        <link rel="stylesheet" href="/static/assets/date-time-picker/bootstrap-datepicker.css"/>
        <link href="https://fonts.googleapis.com/css?family=Great+Vibes|Srisakdi&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=EB+Garamond&display=swap" rel="stylesheet">
        <script src="/static/assets/fontawesome-free/js/76c33de09d.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="/static/src/css/baguetteBox.min.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="The best traditional  Georgian food in Finland">
        <meta name="author" content="Sulkhani Otkhozoria, Akaki Tskhadadze">
        <meta name="keywords" content="Georgian food, Georgian restaurant, Khachapuri,Khinkali,Georgian wine">

        <#nested "styles">
    </head>
    <body>
    <#nested "content">
    <script src="/static/assets/jquery/jquery-3.4.1.min.js"></script>
    <script src="/static/assets/date-time-picker/bootstrap-datepicker.min.js"></script>
    <script src="/static/assets/date-time-picker/bootstrap-timepicker.min.js"></script>
    <script src="/static/assets/date-time-picker/jquery.disableAutoFill.min.js"></script>
    <script src="/static/assets/popper/popper.min.js"></script>
    <script src="/static/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="/static/assets/date-time-picker/baguetteBox.min.js"></script>
    <script src="https://unpkg.com/scrollreveal@4"></script>
    <script src="/static/src/js/app.js"></script>
    <script src="/static/src/js/common.js"></script>
    <script src="/static/assets/time/moment.js"></script>
    <#nested "scripts">
    </body>
    </html>
</#macro>
