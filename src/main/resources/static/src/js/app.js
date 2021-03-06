// nav scroll effect

$(window).scroll(function(){
    $('nav').toggleClass('scrolled', $(this).scrollTop() > 400);
});

// end of nav scroll effect

// gallery zoom on click effect
baguetteBox.run('.grid-gallery', { animation: 'slideIn'});

// end of gallery zoom effect

// menu items

$(function () {
    $(".but").on("click", function (e) {
        e.preventDefault();
        $(".menu-content").hide();
        $("#"+this.id+"div").show();
    });
});

// reviews

ScrollReveal({ duration: 2000 });
ScrollReveal().reveal('.headline')
ScrollReveal().reveal('.tagline', { delay: 700 })
ScrollReveal().reveal('.punchline', { delay: 1200 })