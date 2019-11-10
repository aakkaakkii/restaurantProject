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
                        <button id="submit_button" type="submit" data-toggle="modal" data-target="#categoryModal"
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
                            <th>Name</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list categories.list as category>
                            <tr class="my_category_row"
                                data-id="<#if category.id??>${category.id}</#if>"
                                data-name_en="<#if category.nameEn??>${category.nameEn}</#if>"
                                data-name_fi="<#if category.nameFi??>${category.nameFi}</#if>"
                                data-img_name="<#if category.imgName??>${category.imgName}</#if>"
                            >
                                <td><#if category.nameFi??>${category.nameFi}</#if></td>
                                <td>
                                    <a data-id="${category.id}" data-toggle="modal " data-target="#categoryModal"
                                       class="my_edit_btn "><i class="fas fa-edit"></i></a>
                                    <a data-id="${category.id}" class="my_remove_btn "><i class="fas fa-times"></i></a>
                                </td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>

                <div class="row">
                    <@parts.pager "" categories.limit categories.start categories.totalResults filter/>
                </div>

            </div>
        </div>

        <div class="modal fade" id="categoryModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form id="modal_form" method="post" enctype="multipart/form-data">

                        <div class="modal-body">
                            <img id="modal_img_tag"  class="img-fluid" style="display: none;" src="">
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label" >image</label>
                                <div class="col-sm-8">
                                    <input type="file" id="modal_image" name="file">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">name En</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="modal_nameEn" name="nameEn" value="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">name Fi</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="modal_nameFi" name="nameFi" value="">
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
            let categories = [];
            let selectedCategory = null;

            $(document).ready(function () {
                init();
                addListenersToBtns();
                $(document).on('hide.bs.modal', '#categoryModal', modalCloseListener);
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
                $(".my_category_row").each(function (i, d) {
                    let data = {};
                    data["id"] = $(d).data("id");
                    data["nameFi"] = $(d).data("name_fi");
                    data["nameEn"] = $(d).data("name_en");
                    data["imgName"] = $(d).data("img_name");

                    categories.push(data);
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
                selectedCategory = categories.find(function (element) {
                    return element.id === id
                });
                showRemoveModal();
            }

            function showRemoveModal() {
                $('#removeWarningModal').modal('show');
            }

            function editClickListener() {
                $('#categoryModal').modal('show');
                let id = $(this).data("id");

                selectedCategory = categories.find(function (element) {
                    return element.id === id
                });

                if (selectedCategory) {
                    $("#modal_nameEn").val(selectedCategory.nameEn);
                    $("#modal_nameFi").val(selectedCategory.nameFi);
                    $("#modal_id_field").val(selectedCategory.id);
                    if(selectedCategory.imgName){
                        $("#modal_img_tag").attr("src","/img/"+selectedCategory.imgName);
                        $("#modal_img_tag").show()
                    }
                }
            }

            function removeModalClickListener() {
                categoryDelete(selectedCategory.id);
            }

            function modalCloseListener() {
                clearForm();
            }

            function clearForm() {
                $("#modal_nameEn").val("");
                $("#modal_nameFi").val("");
                $("#modal_img_tag").hide();
                $("#modal_id_field").val("");
            }

            //AJAX
            function categoryDelete(id) {
                $.ajax({
                    method: "DELETE",
                    url: getUrlRest() + "/category/" + id,
                    success: function () {
                        location.reload()
                    }
                })
            }

        </script>
    </#if>
</@l.layout>
