<#import "parts/layout.ftl" as l >
<#import "/spring.ftl" as spring/>
<#import "parts/pageparts.ftl" as parts/>

<@l.layout; section >
    <#if section = "content" >
        <@parts.navbar />

    <#--        navbar ends here-->

        <div class="booking-background">
            <div class="color-overlay"></div>
            <div class="booking-text-background">
                <h3 class=" display-2"><@spring.message "reservation.heading" /></h3>
            </div>
        </div>

        <div class="container mb-5">
            <div class="row">
                <h2 class="mt-5 feedback-heading mx-auto"><@spring.message "contact.feedback.heading"/></h2>
                <form class="mt-3 col-12 review-form d-flex flex-row flex-wrap">
                    <div class="form-group col-md-4">
                        <label for="name"><@spring.message "reservation.name"/></label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="John Doe" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="pNumber"><@spring.message "reservation.number"/></label>
                        <input type="tel" class="form-control" id="pNumber" name="pNumber"
                               pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}-[0-9]{4}" required
                               placeholder="Example:123-45-678-9123">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="date"><@spring.message "reservation.date"/></label>
                        <input type="date" class="form-control" id="date" name="date">
                    </div>

                    <div class="form-group col-md-4">
                        <label for="date"><@spring.message "reservation.date"/></label>
                        <input type="time" class="form-control" id="date_time"
                               name="isReservedTo" value="">
                    </div>

                    <div class="form-group col-md-4">
                        <label for="name"><@spring.message "reservation.name"/></label>
                            <select id="table_id" class="form-control" name="tableId">
                                <#list tables.list as table>
                                    <option class="my_food_type_options" value="${table.id}">table size
                                        - ${table.tableSize}</option>
                                </#list>
                            </select>
                        </div>
                    </div>

                </form>
                <button type="button" id="reserve_button"  class="btn btn-lg btn-block my-5 ml-3 submit"><@spring.message "reservation.submit"/></button>
            </div>
        </div>

        <div id="reserved_time">

        </div>

        <@parts.footer />

    </#if>

    <#if section = "scripts">
        <script>
            $(document).ready(function () {
                $("#reserve_button").click(onReserveClick);
            });

            //listeners
            function onReserveClick() {
                let date = $("#date").val();
                let dateTime = $("#date_time").val();
                let tableId = $("#table_id").val();


                let dateFrom = new Date(date + " " + dateTime);
                let dateTo = new Date(dateFrom.getTime() + (2.5*3600*1000));

                let model = {
                    isReservedFrom: dateFrom,
                    isReservedTo: dateTo,
                    tableId:tableId,
                }



                reserveTable(model, date);
            }

            //AJAX
            function reserveTable(data, date) {
                $.ajax({
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    url: getUrlRest() + "/reservation",
                    data: JSON.stringify(data),
                    success: function (data) {
                        location.reload()
                    },
                    error: function (response) {
                        let errorMessage = JSON.parse(response.responseText);
                        if (errorMessage.status == 406){
                            getReservedTableList(data.tableId, date)
                        }
                    }
                })
            }

            function getReservedTableList(tableId, date) {
                $.ajax({
                    method: "GET",
                    url: getUrlRest() + "/reservation/tables/" + tableId + "?date=" + date,
                    success: function (data) {
                        let html = "";

                        data.forEach(function (d) {
                            let reservedFrom = new Date(d.isReservedFrom);
                            let reservedTo = new Date(d.isReservedTo);
                            html += "<div> is reserved FROM: " + reservedFrom.getHours() + ":" + reservedFrom.getMinutes() + " TO: " + reservedTo.getHours() + ":" + reservedTo.getMinutes() + "</div>"
                        });

                        $("#reserved_time").html(html);

                    },
                    error: function (response) {
                        console.log(response)
                    }
                })
            }

        </script>
    </#if>
</@l.layout>
