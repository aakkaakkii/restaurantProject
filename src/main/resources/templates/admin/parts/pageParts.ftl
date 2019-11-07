<#macro pager url limit start totalResults filter>
    <ul class="pagination position-absolute">
        <li class="page-item <#if start-limit lt 0>disabled</#if>">
            <a class="page-link"
               href="${url}?start=${start-limit}&limit${limit}&filter=${filter}"
            ><</a>
        </li>

        <li class="page-item"><a class="page-link" href="${url}?start=${start*2}&limit=${limit}&filter=${filter}"> ${start/limit+1}</a></li>

        <li class="page-item  <#if start+limit gte totalResults>disabled</#if>">
            <a class="page-link"
               href="${url}?start=${start+limit}&limit=${limit}&filter=${filter}"
            >></a>
        </li>
    </ul>
</#macro>

<#macro search url filter>
    <form method="get" action="/admin/${url}" class="form-inline">
        <input type="text" name="filter" class="form-control back-search" value="${filter?ifExists}"
               placeholder="Search">
        <button type="submit" class="btn search-btn ml-2">Search</button>
    </form>
</#macro>
