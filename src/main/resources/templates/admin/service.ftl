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
                        <button id="submit_button" type="submit" data-toggle="modal" data-target="#serviceModal"
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
                        <tr class="double-column">
                            <th><@spring.message "admin.service.title"/></th>
                            <th><@spring.message "action"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list services.list as service>
                            <tr class="my_service_row"
                                data-id="<#if service.id??>${service.id}</#if>"
                                data-title_en="<#if service.titleEn??>${service.titleEn}</#if>"
                                data-title_fi="<#if service.titleFi??>${service.titleFi}</#if>"
                                data-description_fi="<#if service.descriptionEn??>${service.descriptionEn}</#if>"
                                data-description_en="<#if service.descriptionFi??>${service.descriptionFi}</#if>"
                                data-img_name="<#if service.imgName??>${service.imgName}</#if>"
                            >
                                <td>
                                    <#if .locale="en">${service.titleEn}<#else>${service.titleFi}</#if>
                                </td>
                                <td>
                                    <a data-id="${service.id}" data-toggle="modal " data-target="#serviceModal"
                                       class="my_edit_btn "><i class="fas fa-edit"></i></a>
                                    <a data-id="${service.id}" class="my_remove_btn "><i class="fas fa-times"></i></a>
                                </td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>

                <div class="row">
                    <@parts.pager "" services.limit services.start services.totalResults filter/>
                </div>

            </div>
        </div>

        <div class="modal fade" id="serviceModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title"><@spring.message "admin.service.news"/></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form id="modal_form" method="post" enctype="multipart/form-data">

                        <div class="modal-body">
                            <img id="modal_img_tag"  class="img-fluid" style="display: none;" src="">
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label" ><@spring.message "image"/></label>
                                <div class="col-sm-8">
                                    <input type="file" id="modal_image" name="file">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><@spring.message "admin.service.titleEn"/></label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="modal_titleEn" name="titleEn" value="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><@spring.message "admin.service.titleFi"/></label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="modal_titleFi" name="titleFi" value="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><@spring.message "admin.service.descriptionEn"/></label>
                                <div class="col-sm-8">
                                    <textarea rows="8" cols="50" type="text" class="form-control" id="modal_descriptionEn" name="descriptionEn" value="">
                                    </textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><@spring.message "admin.service.descriptionFi"/></label>
                                <div class="col-sm-8">
                                    <textarea rows="8" cols="50" type="text" class="form-control" id="modal_descriptionFi" name="descriptionFi" value="">
                                    </textarea>
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
            let services = [];
            let selectedService = null;

            $(document).ready(function () {
                init();
                addListenersToBtns();
                $(document).on('hide.bs.modal', '#serviceModal', modalCloseListener);
                $("#modal_remove_btn").click(removeModalClickListener);
            });

            //img change
            window.addEventListener('load', function() {
                document.querySelector('input[type="file"]').addEventListener('change', function() {
                    if (this.files && this.files[0]) {
                        $("#modal_img_tag").show();
                        let img = document.querySelector('img');
                        img.src = URL.createObjectURL(this.files[0]);
                    }
                });
            });

            //inits
            function init() {
                $(".my_service_row").each(function (i, d) {
                    let data = {};
                    data["id"] = $(d).data("id");
                    data["titleEn"] = $(d).data("title_en");
                    data["titleFi"] = $(d).data("title_fi");
                    data["descriptionEn"] = $(d).data("description_fi");
                    data["descriptionFi"] = $(d).data("description_en");
                    data["imgName"] = $(d).data("img_name");

                    services.push(data);
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
                selectedService = services.find(function (element) {
                    return element.id === id
                });
                showRemoveModal();
            }

            function showRemoveModal() {
                $('#removeWarningModal').modal('show');
            }

            function editClickListener() {
                $('#serviceModal').modal('show');
                let id = $(this).data("id");

                selectedService = services.find(function (element) {
                    return element.id === id
                });

                if (selectedService) {
                    $("#modal_titleEn").val(selectedService.titleEn);
                    $("#modal_titleFi").val(selectedService.titleFi);
                    $("#modal_id_field").val(selectedService.id);
                    $("#modal_descriptionEn").val(selectedService.descriptionEn);
                    $("#modal_descriptionFi").val(selectedService.descriptionFi);
                    if(selectedService.imgName){
                        $("#modal_img_tag").attr("src","/img/"+selectedService.imgName);
                        $("#modal_img_tag").show()
                    }
                }
            }

            function removeModalClickListener() {
                serviceDelete(selectedService.id);
            }

            function modalCloseListener() {
                clearForm();
            }

            function clearForm() {
                $("#modal_titleEn").val("");
                $("#modal_titleFi").val("");
                $("#modal_id_field").val("");
                $("#modal_descriptionEn").val("");
                $("#modal_descriptionFi").val("");
            }

            //AJAX
            function serviceDelete(id) {
                $.ajax({
                    method: "DELETE",
                    url: getUrlRest() + "/service/" + id,
                    success: function () {
                        location.reload()
                    }
                })
            }


        </script>
    </#if>
</@l.layout>
