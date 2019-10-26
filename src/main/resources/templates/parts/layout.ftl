<#macro layout>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">

        <link rel="stylesheet" href="/static/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="/static/src/css/main.css">
        <link rel="stylesheet" href="/static/src/css/styles.css">
        <link href="https://fonts.googleapis.com/css?family=Great+Vibes|Srisakdi&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=EB+Garamond&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/76c33de09d.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <#nested "styles">
    </head>
    <body>
    <#nested "content">
    <script src="/static/assets/jquery/jquery-3.4.1.min.js"></script>
    <script src="/static/assets/popper/popper.min.js"></script>
    <script src="/static/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
    <script src="https://unpkg.com/scrollreveal@4"></script>
    <script src="/static/src/js/app.js"></script>
    <script src="/static/src/js/common.js"></script>
    <#nested "scripts">
    </body>
    </html>
</#macro>
