<#import "parts/layout.ftl" as l>
<#import "parts/sidebar.ftl" as sidebar>
<#import "/spring.ftl" as spring/>

<@l.layout; section>
    <#if section="content">
        <div id="wrapper">
            <@sidebar.sidebar location/>

            <form method="post" enctype="multipart/form-data">
                <input type="file" name="file">
                <button type="submit" class="btn btn-primary">Save</button>
            </form>

        </div>

    </#if>

    <#if section="scripts">
    </#if>
</@l.layout>
