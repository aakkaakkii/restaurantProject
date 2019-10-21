<#import "../parts/layout.ftl" as l>

<@l.layout; section>
    <#if section="content">
        <div class="container mt-5">
            <div class="row">
                <div class="col-8 offset-2">
                    <form action="/admin/users" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" name="username" value="${user.username}">
                            <#list roles as role>
                                <div>
                                    <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked","")}>${role}</label>
                                </div>
                            </#list>
                        </div>
                        <input type="hidden" value="${_csrf.token}" name="_csrf" >
                        <input type="hidden" value="${user.id}" name="userId">
                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </div>

    </#if>

    <#if section="scripts">
    </#if>
</@l.layout>
