<#import "parts/layout.ftl" as l>
<#import "parts/sidebar.ftl" as sidebar>
<#import "parts/pageParts.ftl" as parts>
<#import "/spring.ftl" as spring/>

<@l.layout; section>
    <#if section="content">

        <div id="wrapper">
            <@sidebar.sidebar location/>
            <div class="container">
                <div class="row mb-2  mt-2">
                    <div class="col-auto">
                        <button id="submit_button" type="submit" data-toggle="modal" data-target="#categoryModal"
                                class="btn btn-primary">Add user
                        </button>
                    </div>
                    <#--    <div class="col-auto">
                            <input id="search_field" class="form-control form-control-lg" type="text" placeholder="search">
                        </div>
                        <button id="search_button" type="submit" data-toggle="modal" data-target="#userModal"
                                class="btn btn-primary">Search
                        </button>-->
                    <div class="col-auto">

                        <form method="get" action="/admin/users" class="form-inline">
                            <input type="text" name="filter" class="form-control" value="${filter?ifExists}"
                                   placeholder="Search by tag">
                            <button type="submit" class="btn btn-primary ml-2">Search</button>
                        </form>
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
                        <#list categories.list as category>
                            <tr class="my_category_row"
                                data-id="<#if category.id??>${category.id}</#if>"
                                data-nameEn="<#if category.nameEn??>${category.nameEn}</#if>"
                                data-nameFi="<#if category.nameFi??>${category.nameFi}</#if>"
                                data-imgName="<#if category.imgName??>${category.imgName}</#if>"
                            >
                                <td>${category.nameEn}</td>
                                <td><#if category.nameFi??>${category.nameFi}</#if></td>
                                <td>
                                    <a data-id="${category.id}" data-toggle="modal" data-target="#categoryModal"
                                       class="my_edit_btn">Edit</a>
                                    <a data-id="${category.id}" class="my_remove_btn"><@spring.message "remove"/></a>
                                </td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="modal fade" id="categoryModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title"><@spring.message "add"/></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form id="modal_form" method="post" enctype="multipart/form-data">

                        <div class="modal-body">
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
                                <label class="col-sm-4 col-form-label" >image</label>
                                <div class="col-sm-8">
                                    <input type="file" id="modal_image" name="file">
                                </div>
                            </div>
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
            let categories = [];
            let selectedCategory = null;

            $(document).ready(function () {
                init();
                addListenersToBtns();
            });


            //inits
            function init() {
                $(".my_category_row").each(function (i, d) {
                    let data = {};
                    data["id"] = $(d).data("id");
                    data["nameFi"] = $(d).data("nameFi");
                    data["nameEn"] = $(d).data("nameEn");
                    data["imgName"] = $(d).data("imgName");

                    categories.push(data);
                })
            }

            function addListenersToBtns() {
               /* $(".my_edit_btn").each(function (i, d) {
                    $(d).click(editClickListener);
                });*/

                $(".my_remove_btn").each(function (i, d) {
                    $(d).click(removeClickListener);
                })
            }

            // listeners
            function removeClickListener() {
                let id = $(this).data("id");

                categoryDelete(id);
            }

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
