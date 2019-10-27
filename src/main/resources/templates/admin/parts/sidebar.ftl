<#import "/spring.ftl" as spring/>

<#macro sidebar location>
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3"><@spring.message "admin.adminPanel" /></div>
        </a>

        <hr class="sidebar-divider my-0">

        <li class="nav-item <#if location=="users">active</#if>">
            <a class="nav-link" href="/admin/users">
                <i class="fas fa-fw fa-group"></i>
                <span>users</span>
            </a>
        </li>

        <hr class="sidebar-divider">

        <div class="sidebar-heading">
            menu
        </div>

        <li class="nav-item <#if location=="category">active</#if>">
            <a class="nav-link" href="/admin/category">
                <i class="fas fa-fw fa-group"></i>
                <span>category</span>
            </a>
        </li>
        <li class="nav-item <#if location=="dishes">active</#if>">
            <a class="nav-link" href="/admin/users">
                <i class="fas fa-fw fa-group"></i>
                <span>dishes</span>
            </a>
        </li>

        <hr class="sidebar-divider">


        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
</#macro>
