<#import "../parts/layout.ftl" as l>

<@l.layout; section>
    <#if section="content">
        <form action="/admin/users/" method="post">
            <button type="submit" class="btn btn-primary">Add user</button>
        </form>
        <div>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Role</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                <#list users as user>
                    <tr>
                        <td>${user.username}</td>
                        <td><#list user.roles as role>${role}<#sep>,</#list></td>
                        <td><a href="/admin/users/${user.id}">Edit</a></td>
                    </tr>
                </#list>
                </tbody>
            </table>

        </div>
    </#if>

    <#if section="scripts">
    </#if>
</@l.layout>
