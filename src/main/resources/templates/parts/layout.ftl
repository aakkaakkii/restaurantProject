<#macro layout>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">

        <link rel="stylesheet" href="/static/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="/static/src/css/main.css">
        <link rel="stylesheet" href="/static/src/css/styles.css">
        <link href="https://fonts.googleapis.com/css?family=Great+Vibes&display=swap" rel="stylesheet">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <#nested "styles">
    </head>
    <body>
    <#nested "content">
    <script src="/static/assets/jquery/jquery-3.4.1.min.js"></script>
    <script src="/static/assets/popper/popper.min.js"></script>
    <script src="/static/assets/bootstrap/js/bootstrap.min.js"></script>
    <#nested "scripts">
    </body>
    </html>
</#macro>
