<#import "parts/layout.ftl" as l >
<#import "/spring.ftl" as spring/>
<#import "parts/pageparts.ftl" as parts/>

<@l.layout; section >
    <#if section = "content" >

    <#--        navbar start-->
        <@parts.navbar />

    <#--    navbar end     -->

        <div class="menu-background">
            <div class="color-overlay"></div>
            <div class="menu-text-background">
                <h3 class=" display-2">Menu</h3>

            </div>

        </div>

    <#--        MENU STARTS HERE -->

        <div class="container">
            <div class="row my-5 justify-content-center">


                <#list categories.list as category>
                    <div class="col-6 col-md-3 menu-category but">
                        <span data-id="${category.id}"
                              class="text-center text-dark h3 d-block my_menu_category"><img
                                    style="width: 30px; height: 30px"
                                    src="/img/${category.imgName}"><p>${category.nameEn}</p></span>
                    </div>
                </#list>

            </div>


            <div>
                <div class="row" id="food_list">
                    <#if categories.list?? && categories.list[0]?? && categories.list[0].foods??>
                        <#list categories.list[0].foods as food>
                            <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                                <div class="menu-item-img col-6">
                                    <img src="img/<#if food.imgName??>${food.imgName}</#if>" alt="">
                                </div>
                                <div class="menu-item-content col-6">
                                    <h5 class="d-flex justify-content-between">${food.nameEn}<span>$${food.price}</span>
                                    </h5>
                                    <hr>
                                    <small>${food.descriptionEn}</small>
                                    <small><#if food.foodType??>${food.foodType.nameEn}</#if></small>
                                </div>
                            </div>
                        </#list>
                    </#if>

                </div>
            </div>

        </div>

        <@parts.footer />

    </#if>

    <#if section = "scripts" >
        <script>
            let categories = [];

            $(document).ready(function () {
                init();
            });

            function init() {
                $(".my_menu_category").each(function (i, d) {

                    $(d).click(categoryEventListener);
                    categories.push({id: $(d).data("id")})
                })
            }

            //Listeners
            function categoryEventListener() {
                getFoods($(this).data("id"))
            }

            //functions

            function updateMenu(data) {
                let menuContainer = $("#food_list");
                let newMenu = "";

                data.forEach(function (d) {
                    newMenu += '<div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">' +
                        '                            <div class="menu-item-img col-6">' +
                        '                                <img src="img/' + d.imgName + '" alt="">' +
                        '                            </div>' +
                        '                            <div class="menu-item-content col-6">' +
                        '                                <h5 class="d-flex justify-content-between">' + d.nameEn + '<span>$' + d.price + '</span>' +
                        '                                </h5>' +
                        '                                <hr>' +
                        '                                <small>' + d.descriptionEn + '</small>' +
                        '                            </div>' +
                        '                        </div>'
                });

                menuContainer.html(newMenu)

            }

            //AJAX
            function getFoods(id) {
                $.ajax({
                    method: "GET",
                    url: getUrlRest() + "/food/category/" + id,
                    success: function (data) {
                        updateMenu(data);
                    }
                })
            }

        </script>
    </#if>
</@l.layout>
