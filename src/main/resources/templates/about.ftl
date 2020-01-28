<#import "parts/layout.ftl" as l >
<#import "/spring.ftl" as spring/>
<#import "parts/pageparts.ftl" as parts/>

<@l.layout; section >
    <#if section = "content" >
        <@parts.navbar />

<div class="about-background">
    <div class="color-overlay"></div>
    <div class="about-text-background">
        <h3 class=" display-2"><@spring.message "about.heading"/></h3>
    </div>
</div>

        <div class="container my-5 py-2">
            <div class="row justify-content-center about-heading">
                <h3 class="display-3"><@spring.message "about.storyTitle"/></h3>
            </div>
            <div class="row my-5">
                <div class="col-12 col-md-6 order-md-2 order-1 about-img-container mt-0 mt-md-5">
                    <img class="shadow" src="assets/img/aboutimg.jpeg"  alt="">
                </div>
                <div class="col-12 col-md-6 order-md-1 order-2 pt-3 pl-md-0 pl-4 mt-md-0 mt-3 about-text-container">
                    <p class="starter-par "><@spring.message "about.storyBody1"/></p>
                    <p><@spring.message "about.storyBody2"/></p>
                    <p><@spring.message "about.storyBody3"/></p>
                    <p><@spring.message "about.storyBody4"/></p>
                    <p><@spring.message "about.storyBody5"/></p>
                    <p><@spring.message "about.storyBody6"/></p>
                    <p><@spring.message "about.storyBody7"/></p>


                </div>
            </div>
        </div>

        <div class="review-background">
            <div class="color-overlay"></div>
            <div class="review-text-background">
                <h3 class=" display-2"><@spring.message "about.reviews.heading"/></h3>
            </div>
        </div>

        <div class="container-fluid my-5 py-2">
            <div class="row justify-content-center">

                <#list reviews as review>
                    <div class="review col-12 col-md-3 mb-3 shadow-sm mr-3 py-5 headline">
                        <h5 class="text-center headline">${review.subject}</h5>
                        <p class="punchline">${review.message}</p>
                        <small class="text-center d-block tagline">${review.name} </small>
                    </div>
                </#list>

            </div>
        </div>

        <@parts.footer />

    </#if>
</@l.layout>
