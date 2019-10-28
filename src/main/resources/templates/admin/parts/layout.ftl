<#macro layout>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Custom fonts for this template-->
        <link href="/static/assets/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="/static/assets/admin/sb-admin-2.min.css" rel="stylesheet">
        <link href="/static/assets/admin/back-styles.css" rel="stylesheet">

        <#nested "styles">
    </head>
    <body>
    <#nested "content">
    <!-- Bootstrap core JavaScript-->
    <script src="/static/assets/jquery/jquery-3.4.1.min.js"></script>
    <script src="/static/assets/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/static/assets/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/static/assets/admin/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/static/assets/chart.js/Chart.min.js"></script>
    <script src="/static/src/js/common.js"></script>
    <#nested "scripts">
    </body>
    </html>
</#macro>
