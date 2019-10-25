<#import "parts/layout.ftl" as l >
<#import "/spring.ftl" as spring/>
<#import "parts/pageparts.ftl" as parts/>

<@l.layout; section >
    <#if section = "content" >
        <@parts.navbar />

<div class="about-background">
    <div class="color-overlay"></div>
    <div class="about-text-background">
        <h3 class=" display-2">About us</h3>
    </div>
</div>

        <div class="container my-5">
            <div class="row justify-content-center about-heading">
                <h3 class="display-3">Our Story</h3>
            </div>
            <div class="row my-5">
                <div class="col-12 col-md-6 order-md-2 order-1 about-img-container">
                    <img class="shadow" src="https://images.unsplash.com/photo-1567529692333-de9fd6772897?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"  alt="">
                </div>
                <div class="col-12 col-md-6 order-md-1 order-2 pt-3 pl-md-0 pl-4 mt-md-0 mt-3 about-text-container">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid amet, architecto consequuntur culpa delectus dignissimos dolore dolores eius eligendi facere facilis fugit, harum in ipsam iste laborum maxime minima minus molestias necessitatibus nostrum numquam odit porro quam quasi, quia quod quos reprehenderit saepe sed unde vel velit voluptate! Cumque dolor modi quis quo. Autem eaque et odit optio reprehenderit sunt ullam, vero. Accusantium aliquid architecto autem dolorem ea eaque excepturi maiores nemo quas repudiandae, rerum saepe, tempora tempore ullam veritatis. Aperiam beatae blanditiis debitis excepturi hic inventore iure molestiae omnis quae, rem temporibus veniam voluptas, voluptate. Architecto enim nisi possimus.</p>
                </div>
            </div>
        </div>

        <div class="review-background">
            <div class="color-overlay"></div>
            <div class="review-text-background">
                <h3 class=" display-2">Reviews</h3>
            </div>
        </div>

        <div class="container-fluid my-5">
            <div class="row justify-content-center">
                <div class="review col-12 col-md-3 mb-3 shadow-sm mr-3 py-5 headline">
                    <h5 class="text-center headline">Lorem ipsum dolor sit amet.</h5>
                    <p class="punchline">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid consequuntur earum quaerat similique, temporibus veritatis. Asperiores, dicta eius impedit laboriosam officiis voluptas voluptates! Autem debitis distinctio, dolorum fuga labore similique?</p>
                    <small class="text-center d-block tagline">Anonymous - 22.10.19</small>
                </div>
                <div class="review col-12 col-md-3 mb-3 shadow-sm mr-3 py-5 tagline">
                    <h5 class="text-center headline">Lorem ipsum dolor sit amet.</h5>
                    <p class="punchline">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid consequuntur earum quaerat similique, temporibus veritatis. Asperiores, dicta eius impedit laboriosam officiis voluptas voluptates! Autem debitis distinctio, dolorum fuga labore similique?</p>
                    <small class="text-center d-block tagline">Anonymous - 22.10.19</small>
                </div>
                <div class="review col-12  col-md-3 mb-3 shadow-sm py-5 punchline">
                    <h5 class="text-center headline">Lorem ipsum dolor sit amet.</h5>
                    <p class="punchline">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid consequuntur earum quaerat similique, temporibus veritatis. Asperiores, dicta eius impedit laboriosam officiis voluptas voluptates! Autem debitis distinctio, dolorum fuga labore similique?</p>
                    <small class="text-center d-block tagline">Anonymous - 22.10.19</small>
                </div>
            </div>
        </div>


        <@parts.footer />





    </#if>
</@l.layout>