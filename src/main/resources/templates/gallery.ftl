<#import "parts/layout.ftl" as l >
<#import "/spring.ftl" as spring/>
<#import "parts/pageparts.ftl" as parts/>

<@l.layout; section >
    <#if section = "content" >
        <@parts.navbar />

<#--        navbar ends here-->
        <div class="gallery-background">
            <div class="text-background">
                <h3 class=" display-2"><@spring.message "gallery.interior.headingBig"/></h3>
                <p class=" display-3"><@spring.message "gallery.interior.headingSmall"/></p>
            </div>

        </div>
        <section class="gallery-block grid-gallery">
            <div class="container py-2">
                <div class="row">
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/const1.jpeg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/const1.jpeg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/const2.jpeg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/const2.jpeg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/const3.jpeg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/const3.jpeg">
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4 item">
                        <a class="lightbox" href="assets/img/const4.jpeg">
                            <img class="img-fluid image scale-on-hover" src="assets/img/const4.jpeg">
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
                <h3 class=" display-2"><@spring.message "gallery.food.headingBig"/></h3>
                <p class=" display-3"><@spring.message "gallery.food.headingSmall"/></p>
            </div>

        </div>

        <section class="gallery-block grid-gallery">
            <div class="container py-2">
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
        </div>

        <@parts.footer />





    </#if>
</@l.layout>