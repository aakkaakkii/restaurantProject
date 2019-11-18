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
                        <button id="submit_button" type="submit" data-toggle="modal" data-target="#myModal"
                                class="btn "><@spring.message "add"/>
                        </button>
                    </div>
                </div>
                <div class="row">
                    <table class="table">
                        <thead>
                        <tr>
                            <th><@spring.message "admin.tables.tableSize"/></th>
                            <th><@spring.message "admin.tables.tableCount"/></th>
                            <th><@spring.message "action"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list tables.list as table>
                            <tr class="my_model_row"
                                data-id="<#if table.id??>${table.id}</#if>"
                                data-table_size="<#if table.tableSize??>${table.tableSize}</#if>"
                                data-table_count="<#if table.tableCount??>${table.tableCount}</#if>"
                            >
                                <td><#if table.tableSize??>${table.tableSize}</#if></td>
                                <td><#if table.tableCount??>${table.tableCount}</#if></td>
                                <td>
                                    <a data-id="${table.id}" data-toggle="modal " data-target="#myModal"
                                       class="my_edit_btn "><i class="fas fa-edit"></i></a>
                                    <a data-id="${table.id}" class="my_remove_btn "><i class="fas fa-times"></i></a>
                                </td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>

                <div class="row">
                    <@parts.pager "" tables.limit tables.start tables.totalResults filter/>
                </div>

            </div>
        </div>

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title"><@spring.message "admin.tables.table"/></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form id="modal_form" method="post" enctype="multipart/form-data">

                        <div class="modal-body">
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><@spring.message "admin.tables.tableSize"/></label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="modal_tableSize" name="tableSize" value="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><@spring.message "admin.tables.tableCount"/></label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="modal_tableCount" name="tableCount" value="">
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

            let models = [];
            let selectedModel = null;

            $(document).ready(function () {
                init();
                addListenersToBtns();
            });

            //inits
            function init() {
                $(".my_model_row").each(function (i, d) {
                    let data = {};
                    data["id"] = $(d).data("id");
                    data["tableSize"] = $(d).data("table_size");
                    data["tableCount"] = $(d).data("table_count");

                    models.push(data);
                });

                $(document).on('hide.bs.modal', '#myModal', modalCloseListener);
                $("#modal_remove_btn").click(removeModalClickListener);
                $("#modal_tableSize").on("keypress keyup blur", integerValidation);
                $("#modal_tableCount").on("keypress keyup blur", integerValidation);
            }

            function addListenersToBtns() {
                $(".my_edit_btn").each(function (i, d) {
                    $(d).click(editClickListener);
                });

                $(".my_remove_btn").each(function (i, d) {
                    $(d).click(removeClickListener);
                })
            }

            //integerValidation
            function integerValidation(event) {
                $(this).val($(this).val().replace(/[^0-9]/g,''));
                if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
                    event.preventDefault();
                }
            }

            // listeners
            function removeClickListener() {
                let id = $(this).data("id");
                selectedModel = models.find(function (element) {
                    return element.id === id
                });
                showRemoveModal();
            }

            function showRemoveModal() {
                $('#removeWarningModal').modal('show');
            }

            function editClickListener() {
                $('#myModal').modal('show');
                let id = $(this).data("id");

                selectedModel = models.find(function (element) {
                    return element.id === id
                });

                console.log(models)

                if (selectedModel) {
                    $("#modal_id_field").val(selectedModel.id);
                    $("#modal_tableSize").val(selectedModel.tableSize);
                    $("#modal_tableCount").val(selectedModel.tableCount);
                }
            }

            function removeModalClickListener() {
                modelDelete(selectedModel.id);
            }

            function modalCloseListener() {
                clearForm();
            }

            function clearForm() {
                $("#modal_id_field").val("");
                $("#modal_tableSize").val("");
                $("#modal_tableCount").val("");
            }

            //AJAX
            function modelDelete(id) {
                $.ajax({
                    method: "DELETE",
                    url: getUrlRest() + "/table/" + id,
                    success: function () {
                        location.reload()
                    }
                })
            }

        </script>
    </#if>
</@l.layout>
