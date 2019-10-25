<#import "parts/layout.ftl" as l>
<#import "parts/sidebar.ftl" as sidebar>

<@l.layout; section>
    <#if section="content">
        <div id="wrapper">
            <@sidebar.sidebar/>

            <form method="post" enctype="multipart/form-data">
                <input type="file" name="file">
                <button type="submit" class="btn btn-primary">Save</button>
            </form>

        </div>

    </#if>

    <#if section="scripts">
    </#if>
</@l.layout>
