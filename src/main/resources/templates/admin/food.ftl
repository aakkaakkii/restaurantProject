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
                        <button id="submit_button" type="submit" data-toggle="modal" data-target="#foodModal"
                                class="btn ">Add
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
                            <th>a</th>
                            <th>b</th>
                            <th>c</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list foods.list as food>
                            <tr class="my_food_row"
                                data-id="<#if food.id??>${food.id}</#if>"
                                data-name_en="<#if food.nameEn??>${food.nameEn}</#if>"
                                data-name_fi="<#if food.nameFi??>${food.nameFi}</#if>"
                                data-description_en="<#if food.descriptionEn??>${food.descriptionEn}</#if>"
                                data-description_fi="<#if food.descriptionFi??>${food.descriptionFi}</#if>"
                                data-price="<#if food.price??>${food.price}</#if>"
                                data-category_name="<#if food.category?? && food.category.nameEn??>${food.category.nameEn}</#if>"
                                data-category_id="<#if food.category?? && food.category.id??>${food.category.id}</#if>"
                                data-img_name="<#if food.imgName??>${food.imgName}</#if>"
                            >
                                <td><#if food.nameEn??>${food.nameEn}</#if></td>
                                <td><#if food.category?? && food.category.nameEn??>${food.category.nameEn}</#if></td>
                                <td><#if food.price??>${food.price}</#if></td>
                                <td>
                                    <a data-id="${food.id}" data-toggle="modal " data-target="#foodModal"
                                       class="my_edit_btn "><i class="fas fa-edit"></i></a>
                                    <a data-id="${food.id}" class="my_remove_btn "><i class="fas fa-times"></i></a>
                                </td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>

                <div class="row">
                    <@parts.pager "" foods.limit foods.start foods.totalResults filter/>
                </div>

            </div>
        </div>

        <div class="modal fade" id="foodModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">food</h5>
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
                                <label class="col-sm-4 col-form-label">price</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="modal_price" name="price" value="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">category</label>
                                <div class="col-sm-8">
                                    <select  id="modal_category" name="categoryId">
                                        <#list categories.list as category >
                                            <option class="my_category_options" value="${category.id}">${category.nameEn}</option>
                                        </#list>
                                    </select >
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
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">description Fi</label>
                                <div class="col-sm-8">
                                    <textarea rows="8" cols="50"  class="form-control" id="modal_descriptionEn" name="descriptionEn" value="">
                                    </textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">description Fi</label>
                                <div class="col-sm-8">
                                    <textarea rows="8" cols="50"  class="form-control" id="modal_descriptionFi" name="descriptionFi" value="">
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
    </#if>

    <#if section="scripts">
        <script>
            let foods = [];
            let selectedFood = null;

            $(document).ready(function () {
                init();
                addListenersToBtns();
                $(document).on('hide.bs.modal', '#foodModal', modalCloseListener);
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
                $(".my_food_row").each(function (i, d) {
                    let data = {};
                    data["id"] = $(d).data("id");
                    data["nameFi"] = $(d).data("name_fi");
                    data["nameEn"] = $(d).data("name_en");
                    data["imgName"] = $(d).data("img_name");
                    data["descriptionEn"] = $(d).data("description_en");
                    data["descriptionFi"] = $(d).data("description_fi");
                    data["price"] = $(d).data("price");
                    data["categoryId"] = $(d).data("category_id");

                    foods.push(data);
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

                deleteData(id);
            }

            function editClickListener() {
                $('#foodModal').modal('show');
                let id = $(this).data("id");

                selectedFood = foods.find(function (element) {
                    return element.id === id
                });

                if (selectedFood) {
                    $("#modal_nameEn").val(selectedFood.nameEn);
                    $("#modal_nameFi").val(selectedFood.nameFi);
                    $("#modal_id_field").val(selectedFood.id);
                    $("#modal_descriptionEn").val(selectedFood.descriptionEn);
                    $("#modal_descriptionFi").val(selectedFood.descriptionFi);
                    $("#modal_price").val(selectedFood.price);
                    $("#modal_categoryId").val(selectedFood.categoryId);
                    if(selectedFood.imgName){
                        $("#modal_img_tag").attr("src","/img/"+selectedFood.imgName);
                        $("#modal_img_tag").show()
                    }
                }

                modalInit();
            }

            function modalCloseListener() {
                clearForm();
            }

            function clearForm() {
                $("#modal_nameEn").val("");
                $("#modal_nameFi").val("");
                $("#modal_img_tag").hide();
                $("#modal_id_field").val("");
                $("#modal_description_en").val("");
                $("#modal_description_fi").val("");
                $("#modal_price").val("");
                $("#modal_category_id").val("");
            }

            function modalInit() {
                $(".my_category_options").each(function (i, d) {
                    console.log($(d).val(), selectedFood)
                    console.log( selectedFood.categoryId)

                    if(selectedFood && $(d).val() == selectedFood.categoryId){
                        $(d).prop("selected", true);
                    }
                })
            }

            //AJAX
            function deleteData(id) {
                $.ajax({
                    method: "DELETE",
                    url: getUrlRest() + "/food/" + id,
                    success: function () {
                        location.reload()
                    }
                })
            }

        </script>
    </#if>
</@l.layout>
