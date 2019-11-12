<#import "parts/layout.ftl" as l>
<#import "parts/sidebar.ftl" as sidebar>
<#import "parts/pageParts.ftl" as parts>
<#import "/spring.ftl" as spring/>

<@l.layout; section>
    <#if section="content">

        <div id="wrapper">
            <@sidebar.sidebar location/>

        </div>

        <@parts.removeWarning/>

    </#if>

    <#if section="scripts">
        <script>

        </script>
    </#if>
</@l.layout>
