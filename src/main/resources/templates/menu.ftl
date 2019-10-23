<#import "parts/layout.ftl" as l >
<#import "/spring.ftl" as spring/>

<@l.layout; section >
    <#if section = "content" >
<#--        navbar start-->
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

    <#--    navbar end     -->

        <div class="menu-background">
            <div class="color-overlay"></div>
            <div class="menu-text-background">
                <h3 class=" display-2">Menu</h3>

            </div>

        </div>

<#--        MENU STARTS HERE -->

        <div class="container">
            <div class="row my-5">
                <div class="col-6 col-md-3 menu-category">
                    <a href="#" class="text-center text-dark h3 d-block"><i class="fas fa-glass-cheers"></i><p>Alcohol</p></a>
                </div>
                <div class="col-6 col-md-3 menu-category">
                    <a href="#" class="text-center text-dark h3 d-block"><i class="fas fa-carrot"></i></i><p>Salads</p></a>
                </div>
                <div class="col-6 col-md-3 menu-category">
                    <a href="#" class="text-center text-dark h3 d-block"><i class="fas fa-drumstick-bite"></i><p>Meat</p></a>
                </div>
                <div class="col-6 col-md-3 menu-category">
                    <a href="#" class="text-center text-dark h3 d-block"><i class="fas fa-cookie"></i><p>Pastry</p></a>
                </div>

            </div>

            <div class="menu">
                <div class="row">
                    <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1553909489-cd47e0907980?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                  <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1553909489-cd47e0907980?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                  <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1553909489-cd47e0907980?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                  <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1553909489-cd47e0907980?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                  <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1553909489-cd47e0907980?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                  <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1553909489-cd47e0907980?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                  <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1553909489-cd47e0907980?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                  <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1553909489-cd47e0907980?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>

                </div>
            </div>

        </div>

        <footer id="sticky-footer" class="py-4 bg-dark text-white-50">
            <div class="container text-center">
                <small>Copyright &copy; Georgian Kitchen </small>
            </div>
        </footer>





    </#if>
</@l.layout>