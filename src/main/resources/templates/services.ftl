<#import "parts/layout.ftl" as l >
<#import "/spring.ftl" as spring/>
<#import "parts/pageparts.ftl" as parts/>

<@l.layout; section >
<#if section = "content" >
    <@parts.navbar />
<#--    navbar ends here-->

    <div class="services-background">
        <div class="color-overlay"></div>
        <div class="services-text-background">
            <h3 class=" display-2">Services</h3>
        </div>
    </div>
    
    <div class="container my-5">
        <div class="row">
            <h2 class="mx-auto my-5 service-header">Check out upcoming events and deals</h2>
            <div class="service-container row">
                <div class="service-image col-md-6 col-12 order-md-2 headline mb-5 mb-md-0">
                    <img class="shadow" src="https://images.unsplash.com/photo-1515169067868-5387ec356754?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="">
                </div>
                <div class="service-text col-md-6 col-12 order-md-1 my-md-auto ">
                    <h3 class="tagline">Lorem ipsum dolor sit amet.</h3>
                    <p class="punchline">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis culpa delectus deleniti dignissimos et excepturi explicabo facilis ipsa, ipsam laboriosam necessitatibus nobis nostrum perferendis quibusdam quidem tempora voluptatem! Asperiores dolorum earum obcaecati optio unde? Adipisci, aut corporis delectus deleniti dolore ea eos esse ipsum laboriosam laudantium numquam perferendis quae reprehenderit ut veritatis voluptate voluptatem voluptatum? Cum et labore qui tempore.</p>
                </div>
            </div>
            <div class="service-container row my-5">
                <div class="service-image col-md-6 order-1 headline mb-5 mb-md-0">
                    <img class="shadow" src="https://images.unsplash.com/photo-1416453072034-c8dbfa2856b5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1358&q=80" alt="">
                </div>
                <div class="service-text col-md-6 order-2 my-md-auto">
                    <h3 class="tagline">Lorem ipsum dolor sit amet.</h3>
                    <p class="punchline">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis culpa delectus deleniti dignissimos et excepturi explicabo facilis ipsa, ipsam laboriosam necessitatibus nobis nostrum perferendis quibusdam quidem tempora voluptatem! Asperiores dolorum earum obcaecati optio unde? Adipisci, aut corporis delectus deleniti dolore ea eos esse ipsum laboriosam laudantium numquam perferendis quae reprehenderit ut veritatis voluptate voluptatem voluptatum? Cum et labore qui tempore.</p>
                </div>
            </div>
            <div class="service-container row">
                <div class="service-image col-md-6 order-md-2 headline mb-5 mb-md-0">
                    <img class="shadow" src="https://images.unsplash.com/photo-1471967183320-ee018f6e114a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80" alt="">
                </div>
                <div class="service-text col-md-6 order-md-1 my-md-auto">
                    <h3 class="tagline">Lorem ipsum dolor sit amet.</h3>
                    <p class="punchline">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis culpa delectus deleniti dignissimos et excepturi explicabo facilis ipsa, ipsam laboriosam necessitatibus nobis nostrum perferendis quibusdam quidem tempora voluptatem! Asperiores dolorum earum obcaecati optio unde? Adipisci, aut corporis delectus deleniti dolore ea eos esse ipsum laboriosam laudantium numquam perferendis quae reprehenderit ut veritatis voluptate voluptatem voluptatum? Cum et labore qui tempore.</p>
                </div>
            </div>
        </div>
    </div>





    <@parts.footer />

</#if>
</@l.layout>