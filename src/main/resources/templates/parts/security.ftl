<#assign
    known = Session.SPRING_SECURITY_CONTEXT??>

<#if known>
    <#assign
        user = Session.SPRING_SECURITY_CONTEXT.authentification.principal
        name = user.getUsername()
        isAdmin = user.isAdmin()
        >
</#if>
