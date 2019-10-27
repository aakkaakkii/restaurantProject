<#macro pager url limit start totalResults filter>
    <ul class="pagination">
        <li class="page-item <#if start-limit lt 0>disabled</#if>">
            <a class="page-link"
               href="${url}?start=${start-limit}&limit${limit}&filter=${filter}"
            >Previous</a>
        </li>

        <li class="page-item"><a class="page-link" href="${url}?start=${start*2}&limit=${limit}&filter=${filter}">1</a></li>

        <li class="page-item  <#if start+limit gte totalResults>disabled</#if>">
            <a class="page-link"
               href="${url}?start=${start+limit}&limit=${limit}&filter=${filter}"
            >Next</a>
        </li>
    </ul>
</#macro>
