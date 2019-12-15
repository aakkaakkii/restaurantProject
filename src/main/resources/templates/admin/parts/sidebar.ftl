<#import "/spring.ftl" as spring/>

<#macro sidebar location>
    <ul class="navbar-nav sidebar-bg sidebar sidebar-dark accordion" id="accordionSidebar">

        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
            <div class="sidebar-brand-text mx-3"><@spring.message "admin.adminPanel" /></div>
        </a>

        <hr class="sidebar-divider my-0">

        <li class="nav-item <#if location=="users">active</#if>">
            <a class="nav-link" href="/admin/users">
                <span><@spring.message "admin.sidebar.users" /></span>
            </a>
        </li>

        <hr class="sidebar-divider">

        <div class="sidebar-heading">
            <@spring.message "admin.sidebar.menu" />
        </div>

        <li class="nav-item <#if location=="category">active</#if>">
            <a class="nav-link" href="/admin/category">
                <span><@spring.message "admin.sidebar.category" /></span>
            </a>
        </li>
        <li class="nav-item <#if location=="food">active</#if>">
            <a class="nav-link" href="/admin/food">
                <span><@spring.message "admin.sidebar.dishes" /></span>
            </a>
        </li>
        <li class="nav-item <#if location=="foodType">active</#if>">
            <a class="nav-link" href="/admin/foodType">
                <span><@spring.message "admin.sidebar.foodType" /></span>
            </a>
        </li>

        <hr class="sidebar-divider">

        <li class="nav-item <#if location=="service">active</#if>">
            <a class="nav-link" href="/admin/news">
                <span><@spring.message "admin.sidebar.news" /></span>
            </a>
        </li>

        <hr class="sidebar-divider">

        <li class="nav-item <#if location=="review">active</#if>">
            <a class="nav-link" href="/admin/review">
                <span><@spring.message "admin.sidebar.review" /></span>
            </a>
        </li>

        <hr class="sidebar-divider">

        <div class="sidebar-heading">
            <@spring.message "admin.sidebar.reservation" />
        </div>

        <li class="nav-item <#if location=="reservation">active</#if>">
            <a class="nav-link" href="/admin/reservation">
                <span><@spring.message "admin.sidebar.reservation" /></span>
            </a>
        </li>
        <li class="nav-item <#if location=="table">active</#if>">
            <a class="nav-link" href="/admin/table">
                <span><@spring.message "admin.sidebar.table" /></span>
            </a>
        </li>

        <hr class="sidebar-divider">

        <div class="text-center d-none d-md-inline">
            <#if .locale="en">
                <a style="color:white" href="?locale=fn">FI</a>
            <#else>
                <a style="color:white" href="?locale=en">EN</a>
            </#if>
        </div>

        <hr class="sidebar-divider">

        <div class="text-center d-none d-md-inline">
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button class="btn   sign_out" type="submit">Sign Out</button>
            </form>
        </div>

    </ul>
</#macro>
