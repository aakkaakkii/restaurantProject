<#import "parts/layout.ftl" as l >
<#import "/spring.ftl" as spring/>


<@l.layout; section >
    <#if section = "content" >
        <nav class="navbar navbar-expand-lg navbar-dark bg-transparent fixed-top">
            <div class="container">
                <a class="navbar-brand" href="/">Georgian Kitchen</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse nav-light bg-transparent text-right" id="navbarResponsive">
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
                            <a class="nav-link" href="/menu">Menu</a>
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

        <header>
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <!-- Slide One - Set the background image for this slide in the line below -->
                    <div class="carousel-item active" style="background-image: url('https://www.seriouseats.com/images/2015/10/khachapuri-tourism-board.jpg')">
                        <div class="carousel-caption  d-sm-block fade-animation  ">
                            <h2 class="display-1 welcome-heading  "><@spring.message "home.slider.welcomeTextOne"/></h2>
                            <p class="lead firstSpan">This is a description for the first slide.This is a description for the first slide.</p>
                        </div>
                    </div>
                    <!-- Slide Two - Set the background image for this slide in the line below -->
                    <div class="carousel-item" style="background-image: url('https://cdn-image.foodandwine.com/sites/default/files/1535571217/georgia-wine-wine-toast-FT-MAG1018.jpg')">
                        <div class="carousel-caption d-sm-block">
                            <h2 class="display-1 welcome-heading"><@spring.message "home.slider.welcomeTextTwo"/></h2>
                            <p class="lead">This is a description for the second slide.</p>
                        </div>
                    </div>
                    <!-- Slide Three - Set the background image for this slide in the line below -->
                    <div class="carousel-item" style="background-image: url('https://images.unsplash.com/photo-1561731172-9d906d7b13bf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1268&q=80')">
                        <div class="carousel-caption  d-sm-block">
                            <h2 class="display-1 welcome-heading"><@spring.message "home.slider.welcomeTextThree"/></h2>
                            <p class="lead">This is a description for the third slide.</p>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </header>
    </#if>
</@l.layout>
