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
                        <a href="mailto:info@georgiankitchen.fi" class="text-decoration-none">info@georgiankitchen.fi</a>
                        <p class="text-center mb-0">OR</p>
                        <a href="mailto:manana@georgiankitchen.fi" class="text-decoration-none">manana@georgiankitchen.fi</a>
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
                <form class="mt-3 col-12 review-form" id="login-form">
                    <div class="form-group">
                        <label for="name"><@spring.message "contact.feedback.form.name"/></label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="John Doe" required>
                    </div>
                    <div class="form-group">
                        <label for="subject"><@spring.message "contact.feedback.form.subject"/></label>
                        <input type="text" class="form-control" id="subject" name="subject" placeholder="Feedback Heading">
                    </div>
                    <div class="form-group">
                        <label for="message"><@spring.message "contact.feedback.form.message"/></label>
                        <textarea class="form-control" maxlength="350" id="message" name="message" placeholder="Your text goes here (max 350 characters)" rows="8"></textarea>
                    </div>
                </form>
                <button id="submitButton"  class="btn btn-lg mb-2 ml-3 submit"><@spring.message "contact.feedback.form.submit"/></button>
            </div>
        </div>


        <div class="container-fluid">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d992.613860215683!2d24.93788475837386!3d60.1604089300858!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46920bb66b2e8461%3A0xdf5e2e8ab352e24f!2sAlbertinkatu%207%2C%2000150%20Helsinki%2C%20Finland!5e0!3m2!1sen!2sge!4v1579093465183!5m2!1sen!2sge" width="100%" height="600" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
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

            $('#login-form').disableAutoFill();

        </script>
    </#if>

</@l.layout>
