<#macro login path>
<form action="${path}" method="post" class="login-form col-3 p-5">
    <h3 class="text-center text-white">Account Login</h3>
    <div class="form-group"></div>
        <label for="username" class="text-white"> User Name : </label>
        <input type="text" class="form-control" id="username" name="username"/>
    </div>
    <div class="form-group"></div>
        <label for="password" class="text-white"> Password : </label>
        <input type="password" class="form-control" id="password" name="password"/>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <input type="submit" value="Sign In" class="btn btn-lg btn-light my-3 "/>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <input type="submit" value="Sign Out"/>
</form>
</#macro>




<#--<form action="${path}" method="post" class="login-form">-->
<#--    <div><label> User Name : <input type="text" name="username"/> </label></div>-->
<#--    <div><label> Password: <input type="password" name="password"/> </label></div>-->
<#--    <input type="hidden" name="_csrf" value="${_csrf.token}" />-->
<#--    <div><input type="submit" value="Sign In"/></div>-->
<#--</form>-->