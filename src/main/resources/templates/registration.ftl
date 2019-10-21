<#import "parts/layout.ftl" as l>
<#import "parts/login.ftl" as login>


<@l.layout; section>
    <#if section="content">
        Add new user
        <@login.login "/registration" />
    </#if>
</@l.layout>
