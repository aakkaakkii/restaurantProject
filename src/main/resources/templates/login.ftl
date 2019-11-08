<#import "parts/layout.ftl" as l>
<#import "parts/login.ftl" as login>

<@l.layout; section>
    <#if section="content">
        <@login.login "/login" />
    </#if>
</@l.layout>
