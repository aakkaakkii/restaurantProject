<#import "parts/layout.ftl" as l>

<@l.layout; section>
    <#if section="content">
        <div class="error-background m-0">
            <h3 class="font-weight-light text-center">Woops... Something went wrong</h3>
        </div>
    </#if>
</@l.layout>
