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
            <a class="navbar-brand text-white logo" href="/"> Georgian Kitchen</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon "></span>              </button>
            <div class="collapse navbar-collapse text-right" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/">Home
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item ml-2">
                        <a class="nav-link" href="/about">About us</a>
                    </li>
                    <li class="nav-item ml-2">
                        <a class="nav-link" href="/menu">Menu</a>
                    </li>
                    <li class="nav-item ml-2">
                        <a class="nav-link" href="#">Booking</a>
                    </li>
                    <li class="nav-item ml-2">
                        <a class="nav-link" href="/gallery">Gallery</a>
                    </li>
                    <li class="nav-item ml-2">
                        <a class="nav-link" href="/news">News</a>
                    </li>
                    <li class="nav-item ml-2">
                        <a class="nav-link" href="/contact">Contact</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Language
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">English</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Finnish</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

</#macro>
