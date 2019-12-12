<#macro footer>
    <footer id="sticky-footer" class="py-4 bg-dark text-white-50">
        <div class="container justify-content-between d-flex">
            <small>Copyright &copy; Georgian Kitchen</small>
            <small class="icons">
                <i class="fab fa-facebook"></i>
                <i class="fab fa-instagram"></i>
                <i class="fas fa-envelope"></i>
            </small>
        </div>
    </footer>
</#macro>

<#macro navbar>
    <nav class="navbar navbar-expand-lg navbar-dark  bg-transparent fixed-top">
        <div class="container">
            <a class="navbar-brand text-white logo" href="/"> <img src="assets/img/logo.png" alt="logo"> </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon "></span>              </button>
            <div class="collapse navbar-collapse text-right" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/"><@spring.message "navbar.home" />
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item ml-2">
                        <a class="nav-link" href="/about"><@spring.message "navbar.aboutUs" /></a>
                    </li>
                    <li class="nav-item ml-2">
                        <a class="nav-link" href="/menu"><@spring.message "navbar.menu" /></a>
                    </li>
                    <li class="nav-item ml-2">
                        <a class="nav-link" href="/reservation"><@spring.message "navbar.reservation" /></a>
                    </li>
                    <li class="nav-item ml-2">
                        <a class="nav-link" href="/gallery"><@spring.message "navbar.gallery" /></a>
                    </li>
                    <li class="nav-item ml-2">
                        <a class="nav-link" href="/news"><@spring.message "navbar.news" /></a>
                    </li>
                    <li class="nav-item ml-2">
                        <a class="nav-link" href="/contact"><@spring.message "navbar.contact" /></a>
                    </li>
                    <li class="nav-item ml-2 ml-5">
                        <#if .locale="en">
                            <a class="nav-link" href="?locale=fn">FI</a>
                        <#else>
                            <a class="nav-link" href="?locale=en">EN</a>
                        </#if>
                    </li>

                </ul>
            </div>
        </div>
    </nav>

</#macro>
