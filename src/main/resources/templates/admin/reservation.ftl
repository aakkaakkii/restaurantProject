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
                    <div class="col-auto">
                        <@parts.search location filter/>
                    </div>
                </div>
                <div class="row">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Name</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list reservations.list as reservation>
                            <tr class="my_model_row"
                                data-id="<#if reservation.id??>${reservation.id}</#if>"
                                data-reserved_from="<#if reservation.isReservedFrom??>${reservation.isReservedFrom}</#if>"
                                data-reserved_to="<#if reservation.isReservedTo??>${reservation.isReservedTo}</#if>"
                                data-name="<#if reservation.name??>${reservation.name}</#if>"
                                data-phone_number="<#if reservation.phoneNumber??>${reservation.phoneNumber}</#if>"
                                data-table_id="<#if reservation.table??>${reservation.table.id}</#if>"
                                data-table_size="<#if reservation.table??>${reservation.table.tableSize}</#if>"
                            >
                                <td><#if reservation.name??>${reservation.name}</#if></td>
                                <td><#if reservation.isReservedFrom??>${reservation.isReservedFrom}</#if></td>
                                <td><#if reservation.isReservedTo??>${reservation.isReservedTo}</#if></td>
                                <td>
                                    <a data-id="${reservation.id}" data-toggle="modal " data-target="#myModal"
                                       class="my_edit_btn "><i class="fas fa-edit"></i></a>
                                    <a data-id="${reservation.id}" class="my_remove_btn "><i
                                                class="fas fa-times"></i></a>
                                </td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>

                <div class="row">
                    <@parts.pager "" reservations.limit reservations.start reservations.totalResults filter/>
                </div>

            </div>
        </div>

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form id="modal_form" method="post">
                        <div class="modal-body">
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">food type</label>
                                <div class="col-sm-8">
                                    <select id="modal_table_id" name="tableId">
                                        <#list tables.list as table>
                                            <option class="my_food_type_options" value="${table.id}">table size
                                                - ${table.tableSize}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>


                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">isReservedFrom</label>
                                <div class="col-sm-8">
                                    <input type="date" class="form-control" id="modal_reservationDate"
                                           name="isReservedFrom" value="">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">isReservedTo</label>
                                <div class="col-sm-8">
                                    <input type="time" class="form-control" id="modal_reservationTimeFrom"
                                           name="isReservedTo" value="">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">isReservedFrom</label>
                                <div class="col-sm-8">
                                    <input type="time" class="form-control" id="modal_reservationTimeTo"
                                           name="isReservedFrom" value="">
                                </div>
                            </div>

                            <input type="hidden" id="modal_id_field" name="id"/>
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-primary"
                                    type="button" id="modal_save_btn"><@spring.message "save"/></button>
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
                    data["isReservedFrom"] = $(d).data("reserved_from");
                    data["isReservedTo"] = $(d).data("reserved_to");
                    data["name"] = $(d).data("name");
                    data["phoneNumber"] = $(d).data("phone_number");
                    data["tableId"] = $(d).data("table_id");

                    data["reservationDate"] = $(d).data("modal_reservationDate");
                    data["reservationTimeFrom"] = $(d).data("modal_reservationTimeFrom");
                    data["reservationTimeTo"] = $(d).data("modal_reservationTimeTo");

                    models.push(data);
                });

                $(document).on('hide.bs.modal', '#myModal', modalCloseListener);
                $("#modal_remove_btn").click(removeModalClickListener);
                $("#modal_save_btn").click(saveBtnClickListener);
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

                if (selectedModel) {
                    $("#modal_id_field").val(selectedModel.id);
                    $("#modal_isReservedFrom").val(selectedModel.isReservedFrom);
                    $("#modal_isReservedTo").val(selectedModel.isReservedTo);
                    $("#modal_name").val(selectedModel.name);
                    $("#modal_phoneNumber").val(selectedModel.phoneNumber);
                    $("#modal_tableId").val(selectedModel.tableId);
                }
            }

            function saveBtnClickListener() {

                let date = $("#modal_reservationDate").val();
                let timeFrom = $("#modal_reservationTimeFrom").val();
                let timeTo = $("#modal_reservationTimeTo").val();

                let model = {
                    isReservedFrom: new Date(date + " " + timeFrom),
                    isReservedTo: new Date(date + " " + timeTo),
                    tableId: $("#modal_table_id").val()
                }

                modelAdd(model)

            }

            function removeModalClickListener() {
                modelDelete(selectedModel.id);
            }

            function modalCloseListener() {
                clearForm();
            }

            function clearForm() {
                $("#modal_id_field").val("");
                $("#modal_isReservedFrom").val("");
                $("#modal_isReservedTo").val("");
                $("#modal_name").val("");
                $("#modal_phoneNumber").val("");
                $("#modal_tableId").val("");
            }

            //AJAX
            function modelAdd(data) {
                $.ajax({
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    url: getUrlRest() + "/reservation",
                    data: JSON.stringify(data),
                    success: function (data) {
                        location.reload()
                    },
                    error: function (response) {
                        let errorMessage = JSON.parse(response.responseText);
                        alert(errorMessage.message)
                    }
                })
            }

            function modelUpdate(data) {
                $.ajax({
                    method: "PUT",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    url: getUrlRest() + "/reservation/" + data.id,
                    data: JSON.stringify(data),
                    success: function (data) {
                        location.reload()
                    },
                    error: function (response) {
                        let errorMessage = JSON.parse(response.responseText);
                        alert(errorMessage.message)
                    }
                })
            }

            function modelDelete(id) {
                $.ajax({
                    method: "DELETE",
                    url: getUrlRest() + "/reservation/" + id,
                    success: function () {
                        location.reload()
                    }
                })
            }


        </script>
    </#if>
</@l.layout>
