<#import "parts/layout.ftl" as l>
<#import "parts/sidebar.ftl" as sidebar>
<#import "/spring.ftl" as spring/>

<@l.layout; section>
    <#if section="content">

        <div id="wrapper">
            <@sidebar.sidebar/>


            <div class="container">
                <div class="row mb-2  mt-2">
                    <div class="col-auto">
                        <button id="submitButton" type="submit"  data-toggle="modal" data-target="#userModal" class="btn btn-primary">Add user</button>
                    </div>
                    <div class="col-auto">
                        <input class="form-control form-control-lg" type="text" placeholder="search">
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
                                    <td><#if user.mail??>${user.mail}</#if></td>
                                    <td>
                                        <a data-id="${user.id}" data-toggle="modal" data-target="#userModal"
                                           class="my_edit_btn">Edit</a>
                                        <a data-id="${user.id}" class="my_remove_btn"><@spring.message "remove"/></a>
                                    </td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="row">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                        </ul>
                    </nav>
                </div>
            </div>


        </div>

        <div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title"><@spring.message "add"/></h5>
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
                                <input type="text" class="form-control" id="modal_email" value="">
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary"
                                id="modal_add_btn"><@spring.message "add"/></button>
                        <button type="button" class="btn btn-secondary"
                                data-dismiss="modal"><@spring.message "close"/></button>
                    </div>

                </div>
            </div>
        </div>
    </#if>

    <#if section="scripts">
        <script>
            let users = [];
            let selectedUser = null;

            $(document).ready(function () {
                initUsers();
                addListenersToBtns();
                initModal();

                $("#submitButton").click(submitClickListener);

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
                let id = $(this).data("id");

                selectedUser = users.find(function (element) {
                    return element.id === id
                });

                if (selectedUser) {
                    $("#modal_username").val(selectedUser.username);
                    $("#modal_email").val(selectedUser.mail);
                }
            }

            function removeClickListener() {
                let id = $(this).data("id");

                userDelete(id);
            }

            function submitClickListener() {
                selectedUser = {};
            }

            function addClickListener() {
                selectedUser["username"]= $("#modal_username").val();
                selectedUser["mail"]= $("#modal_email").val();
                selectedUser["password"]= $("#modal_password").val();
                userPost(selectedUser);
            }

            function clearForm() {

            }

            //AJAX
            function userPost(user) {
                $.ajax({
                    method:"POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    url:getUrlRest()+"/users",
                    data:JSON.stringify(user),
                    success:function (data) {
                        location.reload()
                    }
                })
            }

            function userDelete(id) {
                $.ajax({
                    method:"DELETE",
                    url:getUrlRest()+"/users/"+id,
                    success:function () {
                        location.reload()
                    }
                })
            }

        </script>
    </#if>
</@l.layout>
