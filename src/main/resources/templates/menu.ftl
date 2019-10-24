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
            <div class="row my-5">
                <div class="col-6 col-md-3 menu-category but" id="show-content">
                    <a href="#" class="text-center text-dark h3 d-block"><i class="fas fa-glass-cheers"></i><p>Alcohol</p></a>
                </div>
                <div class="col-6 col-md-3 menu-category but" id="show-content2">
                    <a href="#" class="text-center text-dark h3 d-block"><i class="fas fa-carrot"></i></i><p>Salads</p></a>
                </div>
                <div class="col-6 col-md-3 menu-category but">
                    <a href="#" class="text-center text-dark h3 d-block"><i class="fas fa-drumstick-bite"></i><p>Meat</p></a>
                </div>
                <div class="col-6 col-md-3 menu-category but">
                    <a href="#" class="text-center text-dark h3 d-block"><i class="fas fa-cookie"></i><p>Pastry</p></a>
                </div>

            </div>

            <div class="menu menu-content " id="show-contentdiv">
                <div class="row">

<#--                    <#list menuItems as menu>-->
<#--                        <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">-->
<#--                            <div class="menu-item-img col-6">-->
<#--                                <img src="https://images.unsplash.com/photo-1553909489-cd47e0907980?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">-->
<#--                            </div>-->
<#--                            <div class="menu-item-content col-6">-->
<#--                                <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>-->
<#--                                <hr>-->
<#--                                <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>-->
<#--                            </div>-->
<#--                        </div>-->
<#--                    </#list>-->














                    <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1553909489-cd47e0907980?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                  <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1553909489-cd47e0907980?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                  <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1553909489-cd47e0907980?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                  <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1553909489-cd47e0907980?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                  <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1553909489-cd47e0907980?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                  <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1553909489-cd47e0907980?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                  <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1553909489-cd47e0907980?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                  <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1553909489-cd47e0907980?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>

                </div>
            </div>


            <div class="menu menu-content " id="show-content2div">
                <div class="row">

                    <#--                    <#list menuItems as menu>-->
                    <#--                        <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">-->
                    <#--                            <div class="menu-item-img col-6">-->
                    <#--                                <img src="https://images.unsplash.com/photo-1553909489-cd47e0907980?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">-->
                    <#--                            </div>-->
                    <#--                            <div class="menu-item-content col-6">-->
                    <#--                                <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>-->
                    <#--                                <hr>-->
                    <#--                                <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>-->
                    <#--                            </div>-->
                    <#--                        </div>-->
                    <#--                    </#list>-->














                    <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1569409431561-21090d1e901a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                    <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1565396319243-49b1f67c82a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                    <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1567815883115-bcf719bdc8ad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                    <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1568051243847-b6319fad107c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                    <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1512684609856-01f6e503a294?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                    <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1563896547024-577ae082f5d8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                    <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1562376552-0d160a2f238d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1225&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>
                    <div class="menu-item col-md-6 mb-4 d-flex flex-row shadow-sm">
                        <div class="menu-item-img col-6">
                            <img src="https://images.unsplash.com/photo-1557985776-fcacad9e6967?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80" alt="">
                        </div>
                        <div class="menu-item-content col-6">
                            <h5 class="d-flex justify-content-between">Belgian Sandwich<span>$12.00</span></h5>
                            <hr>
                            <small>Two slices of bread, Tomato, Cheese, Ham, Beacon, Salad </small>
                        </div>
                    </div>

                </div>
            </div>

        </div>

        <@parts.footer />




    </#if>
</@l.layout>