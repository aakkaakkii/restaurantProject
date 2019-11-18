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

                <form class="mt-3 col-12 review-form d-flex flex-row flex-wrap" id="login-form">
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
<#--                    <div class="form-group col-md-4">-->
<#--                        <label for="date_time"><@spring.message "reservation.time"/></label>-->
<#--                        <input type="time" class="form-control" id="date_time" name="isReservedTo" value="" name="time">-->
<#--                    </div>-->

<#--                    <div class="form-group col-md-4">-->
<#--                        <label for="date"><@spring.message "reservation.date"/></label>-->
<#--                        <input type="date" class="form-control" id="date">-->
<#--                    </div>-->

                    <div class="form-group col-md-4 p-0">
                        <label for="date"><@spring.message "reservation.date"/></label>
                        <input type="text" min="0" max="20" class="form-control" id="date" autocomplete="off" name="name" placeholder="20" required>
                    </div>
                    <div class="form-group bootstrap-timepicker timepicker col-md-4">
                        <label for="date_picker"><@spring.message "reservation.time"/></label>
                        <input id="date_picker" name="isReservedTo" value="" type="text" class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group col-md-4">
                        <label for="table_id"><@spring.message "reservation.tableSize"/></label>
                        <select id="table_id" class="form-control" name="tableId">
                            <#list tables.list as table>
                                <option class="my_food_type_options" value="${table.id}"><@spring.message "reservation.tableSize"/>
                                    - ${table.tableSize}</option>
                            </#list>
                        </select>
                    </div>

                </form>
                <button type="button" id="reserve_button"
                        class="btn btn-lg btn-block my-5 ml-3 submit"><@spring.message "reservation.submit"/></button>

            </div>
            <div class="mt-5 mx-auto" id="reserved_time">
            </div>
        </div>

        <@parts.footer />

        <div class="modal fade" id="reservedMessage" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <@spring.message "reservation.successfullyReservedMessage"/>
                    </div>
                </div>
            </div>
        </div>
        <div hidden>
            <div id="is_reserved_from_text"><@spring.message "reservation.isReservedFrom"/></div>
            <div id="is_reserved_to_text"><@spring.message "reservation.isReservedTo"/></div>
        </div>

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
                let phoneNumber = $("#pNumber").val();
                let name = $("#name").val();

                let dateFrom = new Date(date + " " + dateTime);
                let dateTo = new Date(dateFrom.getTime() + (2.5 * 3600 * 1000));

                let model = {
                    phoneNumber: phoneNumber,
                    name: name,
                    isReservedFrom: dateFrom,
                    isReservedTo: dateTo,
                    tableId: tableId,
                };

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
                        clearForm();
                        $('#reservedMessage').modal('show');
                    },
                    error: function (response) {
                        let errorMessage = JSON.parse(response.responseText);
                        if (errorMessage.status == 406) {
                            getReservedTableList(data.tableId, date)
                        }
                    }
                })
            }

            function clearForm() {
                $("#date").val("");
                $("#date_time").val("");
                $("#table_id").val("");
                $("#pNumber").val("");
                $("#name").val("");
            }

            function getReservedTableList(tableId, date) {
                $.ajax({
                    method: "GET",
                    url: getUrlRest() + "/reservation/tables/" + tableId + "?date=" + date,
                    success: function (data) {
                        let html = "";
                        let list = [];

                        data.forEach(function (d) {
                            let reservedFrom = new Date(d.isReservedFrom);
                            let reservedTo = new Date(d.isReservedTo);
                            if (!list.includes(reservedFrom.getHours() + ":" + reservedFrom.getMinutes())) {
                                list.push(reservedFrom.getHours() + ":" + reservedFrom.getMinutes());
                                html += "<div>"+$("#is_reserved_from_text").html()+ " : " + reservedFrom.getHours() + " : " + reservedFrom.getMinutes() + $("#is_reserved_to_text").html()+" : " + reservedTo.getHours() + ":" + reservedTo.getMinutes() + "</div>"
                            }
                        });

                        $("#reserved_time").html(html);

                    },
                    error: function (response) {
                        console.log(response)
                    }
                })
            }

            $('#date').datepicker({
                weekStart: 0,
                startDate: new Date(),
                endDate: "+14d",
                // maxViewMode: 2,
                orientation: "bottom auto",
                daysOfWeekDisabled: "5,6",
                daysOfWeekHighlighted: "0,1,2,3,4"
            });



            $('#date_picker').timepicker({
                minuteStep: 1,
                template: 'modal',
                appendWidgetTo: 'body',
                showSeconds: false,
                showMeridian: false,
                defaultTime: false,
                template:'dropdown',
                defaultTime:'current'
            }).on('changeTime.timepicker', function(e) {
                var h= e.time.hours;
                var m= e.time.minutes;
                //convert hours into minutes
                m+=h*60;
                //10:15 = 10h*60m + 15m = 615 min
                if(m>1321)
                    $('#date_picker').timepicker('setTime', '10:00');
            });

            $('#login-form').disableAutoFill();

        </script>
    </#if>
</@l.layout>
