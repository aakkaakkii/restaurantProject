<#import "parts/layout.ftl" as l>

<@l.layout; section>
    <#if section="content">
        <div class="error-background m-0">
            <h1 class="display-2 text-center py-5 ">Error 500 <br> Internal Server Error</h1>
            <h3 class="font-weight-light text-center">Woops... Something went wrong</h3>
        </div>
    </#if>
</@l.layout>
