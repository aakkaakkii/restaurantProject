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
            <h3 class=" display-2"><@spring.message "news.heading"/>News</h3>
        </div>
    </div>
    
    <div class="container my-5">
        <div class="row">
            <h2 class="mx-auto my-5 service-header"><@spring.message "news.headingSmall"/></h2>

            <#list services.list as service>
                <div class="service-container row">
                    <div class="service-image col-md-6  col-12 order-md-<#if (service?index+1)%2==0>1<#else>2</#if> headline mb-5 mb-md-0">
                        <img class="shadow" src="/img/<#if service.imgName??>${service.imgName}</#if>" alt="">
                    </div>
                    <div class="service-text col-md-6 col-12 order-md-<#if (service?index+1)%2==0>2<#else>1</#if> my-md-auto ">
                        <h3 class="tagline">${service.titleEn}.</h3>
                        <p class="punchline">${service.descriptionEn}</p>
                    </div>
                </div>
            </#list>
        </div>
    </div>
    <@parts.footer />

</#if>
</@l.layout>
