<#import "parts/layout.ftl" as l>

<@l.layout; section>
    <#if section="content">
        <div class="error-background m-0">
            <h1 class="display-2 text-center py-5 ">Error 404</h1>
            <h3 class="font-weight-light text-center">Woops. Looks Like This Page Does not Exist.</h3>
        </div>
    </#if>
</@l.layout>
