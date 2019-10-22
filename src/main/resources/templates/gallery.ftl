<#import "parts/layout.ftl" as l >
<#import "/spring.ftl" as spring/>

<@l.layout; section >
    <#if section = "content" >
        <nav class="navbar navbar-expand-lg navbar-light bg-transparent fixed-top">
            <div class="container">
                <a class="navbar-brand text-white logo" href="/"> Georgian Kitchen</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <img src="assets/img/dumpling.png" >                </button>
                <div class="collapse navbar-collapse text-right" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="/">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item ml-2">
                            <a class="nav-link" href="/gallery">Gallery</a>
                        </li>
                        <li class="nav-item ml-2">
                            <a class="nav-link" href="#">Services</a>
                        </li>
                        <li class="nav-item ml-2">
                            <a class="nav-link" href="#">Menu</a>
                        </li>
                        <li class="nav-item ml-2">
                            <a class="nav-link" href="#">Booking</a>
                        </li>
                        <li class="nav-item ml-2">
                            <a class="nav-link" href="#">Contact</a>
                        </li>
                        <li class="nav-item ml-2">
                            <a class="nav-link" href="#"><i class="fas fa-user"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="gallery-background">
            <div class="text-background">
                <h3 class=" display-2">Interior</h3>
                <p class=" display-3">Design</p>
            </div>

        </div>
        <section class="gallery-block grid-gallery">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/image1.jpg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/image1.jpg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/image2.jpg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/image2.jpg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/image3.jpg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/image3.jpg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/image4.jpg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/image4.jpg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/image5.jpg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/image5.jpg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/image6.jpg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/image6.jpg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/image7.jpg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/image7.jpg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/image8.jpg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/image8.jpg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/image9.jpg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/image9.jpg">
                        </a>
                    </div>
                </div>
            </div>
        </section>


        <div class="container-fluid">
        <div class="gallery-background">
            <div class="text-background">
                <h3 class=" display-2">Delicious</h3>
                <p class=" display-3">Food</p>
            </div>

        </div>

        <section class="gallery-block grid-gallery">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/food-image1.jpg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/food-image1.jpg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/food-image2.jpg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/food-image2.jpg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/food-image3.jpg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/food-image3.jpg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/food-image4.jpg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/food-image4.jpg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/food-image5.jpg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/food-image5.jpg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/food-image6.jpg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/food-image6.jpg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/food-image7.jpg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/food-image7.jpg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/food-image8.jpg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/food-image8.jpg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/food-image9.jpg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/food-image9.jpg">
                        </a>
                    </div>
                </div>
            </div>
        </section>


    </#if>
</@l.layout>