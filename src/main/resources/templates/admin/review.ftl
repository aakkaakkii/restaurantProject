<#import "parts/layout.ftl" as l>
<#import "parts/sidebar.ftl" as sidebar>
<#import "parts/pageParts.ftl" as parts>
<#import "/spring.ftl" as spring/>

<@l.layout; section>
    <#if section="content">
        <div id="wrapper">
            <@sidebar.sidebar location/>
            <div class="container-fluid">
                <div class="row mb-2  mt-2">
                    <div class="col-auto">
                        <button id="submit_button" type="submit" data-toggle="modal" data-target="#reviewModal"
                                class="btn "><@spring.message "add"/>
                        </button>
                    </div>
                    <div class="col-auto">
                        <@parts.search location filter/>
                    </div>
                </div>
                <div class="row">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Subject</th>
                            <th>b</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list reviews.list as review>
                            <tr class="my_review_row"
                                data-id="<#if review.id??>${review.id}</#if>"
                                data-name="<#if review.name??>${review.name}</#if>"
                                data-subject="<#if review.subject??>${review.subject}</#if>"
                                data-message="<#if review.message??>${review.message}</#if>"
                                data-date="<#if review.date??>${review.date}</#if>"
                                data-visible="${review.visible?then('true', 'false')}"
                            >
                                <td>${review.name}</td>
                                <td>${review.date}</td>
<#--                                <td>${review.date}</td>-->
                                <td>
                                    <a data-id="${review.id}" data-toggle="modal " data-target="#reviewModal"
                                       class="my_edit_btn "><i class="fas fa-edit"></i></a>
                                    <a data-id="${review.id}" class="my_remove_btn "><i class="fas fa-times"></i></a>
                                </td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>

                <div class="row">
                    <@parts.pager "" reviews.limit reviews.start reviews.totalResults filter/>
                </div>

            </div>
        </div>

        <div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Review</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form id="modal_form" method="post" enctype="multipart/form-data">

                        <div class="modal-body">
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">name</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="modal_name" name="name" value="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">subject</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="modal_subject" name="subject" value="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">message</label>
                                <div class="col-sm-8">
                                    <textarea rows="8" cols="50" type="text" class="form-control" id="modal_message" name="message" value="">
                                    </textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">date</label>
                                <div class="col-sm-8">
                                    <input type="date" class="form-control" id="modal_date" name="date" value="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">visible</label>
                                <div class="col-sm-8">
                                    <input type="checkbox" id="modal_visible" name="visible" >
                                </div>
                            </div>

                            <input type="hidden" id="modal_id_field" name="id"/>
                            <input type="hidden" name="_csrf" value="${_csrf.token}" />

                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary"
                                    id="modal_save_btn"><@spring.message "save"/></button>
                            <button type="button" class="btn btn-secondary"
                                    data-dismiss="modal"><@spring.message "close"/></button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <@parts.removeWarning/>

    </#if>

    <#if section="scripts">
        <script>
            let reviews = [];
            let selectedReview = null;

            $(document).ready(function () {
                init();
                addListenersToBtns();
                $(document).on('hide.bs.modal', '#reviewModal', modalCloseListener);
                $("#modal_remove_btn").click(removeModalClickListener);
            });


            //inits
            function init() {
                $(".my_review_row").each(function (i, d) {
                    let data = {};
                    data["id"] = $(d).data("id");
                    data["name"] = $(d).data("name");
                    data["subject"] = $(d).data("subject");
                    data["message"] = $(d).data("message");
                    data["date"] = $(d).data("date");
                    data["visible"] = $(d).data("visible");

                    reviews.push(data);
                })
            }

            function addListenersToBtns() {
                $(".my_edit_btn").each(function (i, d) {
                    $(d).click(editClickListener);
                });

                $(".my_remove_btn").each(function (i, d) {
                    $(d).click(removeClickListener);
                })
            }

            // listeners
            function removeClickListener() {
                let id = $(this).data("id");
                selectedReview = reviews.find(function (element) {
                    return element.id === id
                });
                showRemoveModal();
            }

            function showRemoveModal() {
                $('#removeWarningModal').modal('show');
            }

            function editClickListener() {
                $('#reviewModal').modal('show');
                let id = $(this).data("id");

                selectedReview = reviews.find(function (element) {
                    return element.id === id
                });

                if (selectedReview) {
                    console.log(selectedReview)
                    $("#modal_id_field").val(selectedReview.id);
                    $("#modal_name").val(selectedReview.name);
                    $("#modal_subject").val(selectedReview.subject);
                    $("#modal_message").val(selectedReview.message);
                    $("#modal_date").val( Date.parse(selectedReview.date));
                    $("#modal_visible").prop( "checked", selectedReview.visible );

                }
            }

            function removeModalClickListener() {
                reviewDelete(selectedReview.id);
            }

            function modalCloseListener() {
                clearForm();
            }

            function clearForm() {
                $("#modal_name").val("");
                $("#modal_subject").val("");
                $("#modal_message").val("");
                $("#modal_date").val("");
                $("#modal_visible").val("");
            }

            //AJAX
            function reviewDelete(id) {
                $.ajax({
                    method: "DELETE",
                    url: getUrlRest() + "/review/" + id,
                    success: function () {
                        location.reload()
                    }
                })
            }

            $('.review-form').on('submit', function(){
                var that = $(this),
                    url = that.attr('action'),
                    type = that.attr('method'),
                    data = {};
                that.find('[name]').each(function (index,value) {
                    var that = $(this),
                        name = that.attr('name'),
                        value = that.val();

                    data[name] = value;
                });

                $.ajax({
                    url:url,
                    type:type,
                    data:data,
                    success: function () {
                        location.reload();
                    }
                })

            });



        </script>
    </#if>
</@l.layout>
