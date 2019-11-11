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
                    <h3 class=" display-2"><@spring.message "contact.heading" /></h3>
                </div>
        </div>

        <div class="container my-5">
            <div class="row justify-content-around">
                <div class="col-md-3  contact py-5 mb-md-0 mb-3">
                    <div class="contact-icon-container text-center display-4"><i class="far fa-envelope-open"></i></div>
                    <div class="contact-text-container">
                        <h4 class="text-center"><@spring.message "contact.email" />:</h4>
                        <a href="mailto:someone@example.com" class="text-decoration-none">contact@georgiankitchen.fi</a>
                    </div>
                </div>
                <div class="col-md-3  contact py-5 mb-md-0 mb-3">
                    <div class="contact-icon-container text-center display-4"><i class="fas fa-mobile-alt"></i></div>
                    <div class="contact-text-container">
                        <h4 class="text-center"><@spring.message "contact.call"/>:</h4>
                        <p class="text-center"><@spring.message "contact.number"/></p>
                        <small class="text-center d-block"><@spring.message "contact.day"/></small>
                    </div>
                </div>
                <div class="col-md-3  contact py-5 mb-md-0 mb-3">
                    <div class="contact-icon-container text-center display-4"><i class="fas fa-map-marked-alt"></i></div>
                    <div class="contact-text-container text-center">
                        <h4 class="text-center"><@spring.message "contact.location.text"/>:</h4>
                        <p class="text-center"><@spring.message "contact.location.value"/></p>
                    </div>
                </div>


            </div>
        </div>

        <div class="container mb-5">
            <div class="row">
                <h2 class="mt-5 feedback-heading mx-auto"><@spring.message "contact.feedback.heading"/></h2>
                <form class="mt-3 col-12 review-form">
                    <div class="form-group">
                        <label for="name"><@spring.message "contact.feedback.form.name"/></label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="John Doe" required>
                    </div>
                    <div class="form-group">
                        <label for="feedbackheading"><@spring.message "contact.feedback.form.subject"/></label>
                        <input type="text" class="form-control" id="subject" name="subject" placeholder="Feedback Heading">
                    </div>
                    <div class="form-group">
                        <label for="feedbacktext"><@spring.message "contact.feedback.form.message"/></label>
                        <textarea class="form-control" maxlength="350" id="message" name="message" placeholder="Your text goes here (max 350 characters)" rows="8"></textarea>
                    </div>
                </form>
                <button id="submitButton"  class="btn btn-lg mb-2 ml-3 submit"><@spring.message "contact.feedback.form.submit"/></button>
            </div>
        </div>


        <div class="container-fluid">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1051.2889286391164!2d24.937437553943447!3d60.171310801298326!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46920a332ab06d07%3A0xa6c0f7efd55d1d15!2sMuseum%20of%20Contemporary%20Art%20Kiasma!5e0!3m2!1sen!2sge!4v1571923424472!5m2!1sen!2sge" width="100%" height="600" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
        </div>


        <div class="modal fade" id="thankModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <@spring.message "feedback.thank.message"/>
                    </div>

                </div>
            </div>
        </div>


<#--        footer-->

        <@parts.footer />

    </#if>
    <#if section = "scripts" >
        <script>
            $(document).ready(function () {
                $("#submitButton").click(function () {
                    let data = {
                        name: $("#name").val(),
                        subject: $("#subject").val(),
                        message: $("#message").val(),
                    };

                    if ($("#message").val().length===0){
                        return;
                    }


                    $.ajax({
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        url: getUrlRest() + "/review",
                        data: JSON.stringify(data),
                        success: function (data) {

                            $('#thankModal').modal('show');

                            $("#name").val("");
                            $("#subject").val("");
                            $("#message").val("");
                        },
                    })

                });
            });

        </script>
    </#if>

</@l.layout>
