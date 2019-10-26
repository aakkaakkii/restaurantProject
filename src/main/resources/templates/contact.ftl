<#import "parts/layout.ftl" as l >
<#import "/spring.ftl" as spring/>
<#import "parts/pageparts.ftl" as parts/>

<@l.layout; section >
    <#if section = "content" >
        <@parts.navbar />

<#--        navbar ends here-->

        <div class="contact-background">
            <div class="color-overlay"></div>
                <div class="contact-text-background">
                    <h3 class=" display-2">Contact Us</h3>
                </div>
        </div>

        <div class="container my-5">
            <div class="row justify-content-around">
                <div class="col-md-3  contact py-5 mb-md-0 mb-3">
                    <div class="contact-icon-container text-center display-4"><i class="far fa-envelope-open"></i></div>
                    <div class="contact-text-container">
                        <h4 class="text-center">Email:</h4>
                        <a href="mailto:someone@example.com" class="text-decoration-none">contact@georgiankitchen.fi</a>
                    </div>
                </div>
                <div class="col-md-3  contact py-5 mb-md-0 mb-3">
                    <div class="contact-icon-container text-center display-4"><i class="fas fa-mobile-alt"></i></div>
                    <div class="contact-text-container">
                        <h4 class="text-center">Call us on:</h4>
                        <p class="text-center">0800 123 456</p>
                        <small class="text-center d-block">Mon-Sat 9am-6pm (GMT)</small>
                    </div>
                </div>
                <div class="col-md-3  contact py-5 mb-md-0 mb-3">
                    <div class="contact-icon-container text-center display-4"><i class="fas fa-map-marked-alt"></i></div>
                    <div class="contact-text-container text-center">
                        <h4 class="text-center">Find us at:</h4>
                        <p class="text-center">123 Meddison Square Helsinki, Finland</p>
                    </div>
                </div>


            </div>
        </div>

        <div class="container mb-5">
            <div class="row">
                <h2 class="mt-5 feedback-heading mx-auto">Send us your feedback</h2>
                <form class="mt-3 col-12">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" placeholder="John Doe">
                    </div>
                    <div class="form-group">
                        <label for="feedbackheading">Subject</label>
                        <input type="text" class="form-control" id="feedbackheading" placeholder="Feedback Heading">
                    </div>
                    <div class="form-group">
                        <label for="feedbacktext">Message</label>
                        <textarea class="form-control" maxlength="350" id="feedbacktext" placeholder="Your text goes here (max 350 characters)" rows="4"></textarea>
                    </div>
                    <button type="submit" class="btn btn-lg mb-2 submit">Submit</button>
                </form>
            </div>
        </div>


        <div class="container-fluid">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1051.2889286391164!2d24.937437553943447!3d60.171310801298326!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46920a332ab06d07%3A0xa6c0f7efd55d1d15!2sMuseum%20of%20Contemporary%20Art%20Kiasma!5e0!3m2!1sen!2sge!4v1571923424472!5m2!1sen!2sge" width="100%" height="600" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
        </div>






<#--        footer-->

        <@parts.footer />





    </#if>
</@l.layout>