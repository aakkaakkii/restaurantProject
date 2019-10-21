<#import "parts/layout.ftl" as l>
<#import "parts/login.ftl" as login>

<@l.layout; section>
    <#if section="content">
        Login page
        <@login.login "/login" />
        <a href="/registration">Add new user</a>

        With Facebook: <a href="/login/facebook">click here</a>
    </#if>
</@l.layout>
