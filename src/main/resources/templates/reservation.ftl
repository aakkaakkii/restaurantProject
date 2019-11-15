<#import "parts/layout.ftl" as l >
<#import "/spring.ftl" as spring/>
<#import "parts/pageparts.ftl" as parts/>

<@l.layout; section >
    <#if section = "content" >
        <@parts.navbar />

<#--        navbar ends here-->

        <div class="booking-background">
            <div class="color-overlay"></div>
            <div class="booking-text-background">
                <h3 class=" display-2"><@spring.message "reservation.heading" /></h3>
            </div>
        </div>

        <div class="container mb-5">
            <div class="row">
                <h2 class="mt-5 feedback-heading mx-auto"><@spring.message "contact.feedback.heading"/></h2>
                <form class="mt-3 col-12 review-form d-flex flex-row flex-wrap">
                    <div class="form-group col-md-4">
                        <label for="name"><@spring.message "reservation.name"/></label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="John Doe" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="pNumber"><@spring.message "reservation.number"/></label>
                        <input type="tel" class="form-control" id="pNumber" name="pNumber" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}-[0-9]{4}" required placeholder="Example:123-45-678-9123">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="date"><@spring.message "reservation.date"/></label>
                        <input type="date" class="form-control"  id="date"  name="date" >
                    </div>
                </form>
                <button id="submitButton"  class="btn btn-lg btn-block my-5 ml-3 submit"><@spring.message "reservation.submit"/></button>
            </div>
        </div>



        <@parts.footer />

    </#if>
</@l.layout>