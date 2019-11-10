<#import "/spring.ftl" as spring/>

<#macro pager url limit start totalResults filter>
    <ul class="pagination position-absolute">
        <li class="page-item <#if start-limit lt 0>disabled</#if>">
            <a class="page-link"
               href="${url}?start=${start-limit}&limit${limit}&filter=${filter}"
            ><</a>
        </li>

        <li class="page-item"><a class="page-link"> ${start/limit+1}</a></li>

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
        <button type="submit" class="btn search-btn ml-2"><@spring.message "search"/></button>
    </form>
</#macro>

<#macro removeWarning>
    <div class="modal fade" id="removeWarningModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title"><@spring.message "warning"/></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <@spring.message "warningMessage"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary"
                            id="modal_remove_btn"><@spring.message "yes"/></button>
                    <button type="button" class="btn btn-secondary"
                            data-dismiss="modal"><@spring.message "no"/></button>
                </div>

            </div>
        </div>
    </div>
</#macro>
