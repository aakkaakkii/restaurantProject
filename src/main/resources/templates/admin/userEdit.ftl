<#import "parts/layout.ftl" as l>
<#import "parts/sidebar.ftl" as sidebar>

<@l.layout; section>
    <#if section="content">
        <div id="wrapper">
            <@sidebar.sidebar/>
            <div class="container mt-5">
                <div class="row">
                    <div class="col-8 offset-2">
                        <form action="/admin/users" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" name="username" value="${user.username}">
                                <#list roles as role>
                                    <div>
                                        <label><input type="checkbox"
                                                      name="${role}" ${user.roles?seq_contains(role)?string("checked","")}>${role}
                                        </label>
                                    </div>
                                </#list>
                            </div>
                            <input type="hidden" value="${_csrf.token}" name="_csrf">
                            <input type="hidden" value="${user.id}" name="userId">
                            <button type="submit" class="btn btn-primary">Save</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </#if>

    <#if section="scripts">
        <script>
        </script>
    </#if>
</@l.layout>
