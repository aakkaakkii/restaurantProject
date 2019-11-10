<#import "parts/layout.ftl" as l>
<#import "parts/sidebar.ftl" as sidebar>
<#import "parts/pageParts.ftl" as parts>
<#import "/spring.ftl" as spring/>

<@l.layout; section>
    <#if section="content">

        <div id="wrapper" class="container-fluid p-0">
            <@sidebar.sidebar location/>


            <div class="container-fluid">
                <div class="row mb-2  mt-2">
                    <div class="col-auto">
                        <button id="submit_button" type="submit" data-toggle="modal" data-target="#userModal"
                                class="btn "><@spring.message "add"/>
                        </button>
                    </div>
                    <div class="col-auto">
                        <@parts.search location filter/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col"><@spring.message "username"/></th>
                                <th scope="col"><@spring.message "email"/></th>
                                <th scope="col"><@spring.message "action"/></th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list users.list as user>
                                <tr class="my_user_row"
                                    data-id="<#if user.id??>${user.id}</#if>"
                                    data-username="<#if user.username??>${user.username}</#if>"
                                    data-mail="<#if user.mail??>${user.mail}</#if>"
                                >
                                    <td>${user.username}</td>
                                    <td class="wrapped-text"><#if user.mail??>${user.mail}</#if></td>
                                    <td>
                                        <a data-id="${user.id}" data-toggle="modal " data-target="#userModal"
                                           class="my_edit_btn "><i class="fas fa-edit"></i></a>
                                        <a data-id="${user.id}" class="my_remove_btn "><i class="fas fa-times"></i></a>
                                    </td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="row">
                    <@parts.pager "" users.limit users.start users.totalResults filter/>
                </div>
            </div>


        </div>

        <div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label"><@spring.message "username"/></label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="modal_username" value="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label"><@spring.message "password"/></label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="modal_password" value="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label"><@spring.message "email"/></label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="modal_mail" value="">
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary"
                                id="modal_add_btn"><@spring.message "save"/></button>
                        <button type="button" class="btn btn-secondary"
                                data-dismiss="modal"><@spring.message "close"/></button>
                    </div>

                </div>
            </div>
        </div>

        <@parts.removeWarning/>

    </#if>

    <#if section="scripts">
        <script>
            let users = [];
            let selectedUser = null;

            $(document).ready(function () {
                initUsers();
                addListenersToBtns();
                initModal();

                $("#submit_button").click(submitClickListener);
                $("#search_button").click(searchClickListener);
                $(document).on('hide.bs.modal', '#userModal', modalCloseListener);
                $("#modal_remove_btn").click(removeModalClickListener);

            });

            //inits
            function initUsers() {
                $(".my_user_row").each(function (i, d) {
                    let data = {};
                    data["id"] = $(d).data("id");
                    data["username"] = $(d).data("username");
                    data["mail"] = $(d).data("mail");

                    users.push(data);
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

            function initModal() {
                $("#modal_add_btn").click(addClickListener);
            }


            // listeners
            function editClickListener() {
                $('#userModal').modal('show');
                let id = $(this).data("id");
                selectedUser = users.find(function (element) {
                    return element.id === id
                });

                if (selectedUser) {
                    $("#modal_username").val(selectedUser.username);
                    $("#modal_mail").val(selectedUser.mail);
                }
            }

            function removeClickListener() {
                let id = $(this).data("id");
                selectedUser = users.find(function (element) {
                    return element.id === id
                });
                showRemoveModal();
            }

            function showRemoveModal() {
                $('#removeWarningModal').modal('show');
            }

            function submitClickListener() {
                selectedUser = {};
            }

            function searchClickListener() {
                $("#search_field").val();

                $.ajax({
                    method: "GET",
                    url: getUrlRest() + "/users",
                })
            }

            function addClickListener() {

                let username = ($("#modal_username").val());
                let mail = ($("#modal_mail").val());
                let password = ($("#modal_password").val());

                if (username)
                    selectedUser["username"] = username;
                if (username)
                    selectedUser["mail"] = mail;
                if (username)
                    selectedUser["password"] = password;

                userPost(selectedUser);
            }

            function removeModalClickListener() {
                userDelete(selectedUser.id);
            }

            function modalCloseListener() {
                clearForm();
            }

            function clearForm() {
                $("#modal_username").val("");
                $("#modal_mail").val("");
                $("#modal_password").val("");
            }

            //AJAX
            function userPost(user) {
                $.ajax({
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    url: getUrlRest() + "/users",
                    data: JSON.stringify(user),
                    success: function (data) {
                        location.reload()
                    }
                })
            }

            function userDelete(id) {
                $.ajax({
                    method: "DELETE",
                    url: getUrlRest() + "/users/" + id,
                    success: function () {
                        location.reload()
                    }
                })
            }

        </script>
    </#if>
</@l.layout>
