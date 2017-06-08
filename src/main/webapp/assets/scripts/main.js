//
//
// $("#go_top").click(function() {$('html, body').animate({
//   scrollTop: $("#intro").offset().top}, 1000);
// });
//
// $("#saiba_como_funciona, #apresentacao-menu-link, #arrow").click(function() {$('html, body').animate({
//   scrollTop: $("#presentation_video").offset().top}, 1000);
// });
//
// $("#etapas-menu-link").click(function() {$('html, body').animate({
//   scrollTop: $("#terms").offset().top}, 1000);
// });
//
// // $("#inscrevase, #inscricao-menu-link, #clique_aqui_para_participar").click(function() {$('html, body').animate({
// //   scrollTop: $("#register").offset().top}, 1000);
// // });
//
// $("#conhecatambem-menu-link").click(function() {$('html, body').animate({
//   scrollTop: $("#know_also").offset().top}, 1000);
// });
//
//
//
// (function () {
//   var app;
//   app = angular.module('app', []);
//   app.directive('countdown', [
//     'Util',
//     '$interval',
//     function (Util, $interval) {
//       return {
//         restrict: 'A',
//         scope: { date: '@' },
//         link: function (scope, element) {
//           var future;
//           future = new Date(scope.date);
//           $interval(function () {
//             var diff;
//             diff = Math.floor((future.getTime() - new Date().getTime()) / 1000);
//             return element.text(Util.dhms(diff));
//           }, 1000);
//         }
//       };
//     }
//     ]);
//   app.factory('Util', [function () {
//     return {
//       dhms: function (t) {
//         var days, hours, minutes, seconds;
//         days = Math.floor(t / 86400);
//         t -= days * 86400;
//         hours = Math.floor(t / 3600) % 24;
//         t -= hours * 3600;
//         minutes = Math.floor(t / 60) % 60;
//         t -= minutes * 60;
//         seconds = t % 60;
//         return [
//         days + ' dias',
//         hours + ' horas',
//         minutes + ' minutos',
//         seconds + ' segundos'
//         ].join(' ');
//       }
//     };
//   }]);
// }.call(this));
//
//
// // menu effects
//
// onscroll = function() {
//
//   var scroll_height = document.documentElement.scrollTop || document.body.scrollTop;
//   var content_width = document.documentElement.clientWidth;
//
// // sections height
// var intro_height = $("#intro").height();
// var presentation_video_height = $("#presentation_video").height();
// var call_height = $("#call").height();
// var terms_height = $("#terms").height();
// var register_height = $("#register").height();
// var promotional_banner_height = $("#promotional").height();
//
// // menu links
// var apresentacao_menu_link = $("#apresentacao-menu-link");
// var etapas_menu_link = $("#etapas-menu-link");
// var inscricao_menu_link = $("#inscricao-menu-link");
// var conhecatambem_menu_link = $("#conhecatambem-menu-link");
//
//
// if (scroll_height >= intro_height) {
//   apresentacao_menu_link.addClass("link-menu-ativo");
//   etapas_menu_link.removeClass("link-menu-ativo");
//   inscricao_menu_link.removeClass("link-menu-ativo");
//   conhecatambem_menu_link.removeClass("link-menu-ativo");
// }
//
// if (scroll_height >= (intro_height + presentation_video_height + call_height)) {
//   apresentacao_menu_link.removeClass("link-menu-ativo");
//   etapas_menu_link.addClass("link-menu-ativo");
//   inscricao_menu_link.removeClass("link-menu-ativo");
//   conhecatambem_menu_link.removeClass("link-menu-ativo");
// }
//
// if (scroll_height >= (intro_height + presentation_video_height + call_height + terms_height)) {
//
//   apresentacao_menu_link.removeClass("link-menu-ativo");
//   etapas_menu_link.removeClass("link-menu-ativo");
//   inscricao_menu_link.addClass("link-menu-ativo");
//   conhecatambem_menu_link.removeClass("link-menu-ativo");
//
// }
//
// if (scroll_height >= (intro_height + presentation_video_height + call_height + terms_height + register_height)) {
//
//   apresentacao_menu_link.removeClass("link-menu-ativo");
//   etapas_menu_link.removeClass("link-menu-ativo");
//   inscricao_menu_link.removeClass("link-menu-ativo");
//   conhecatambem_menu_link.addClass("link-menu-ativo");
//
// }
//
// if (scroll_height < intro_height && content_width > 855) {
//   $("#go_top").fadeOut("fast");
//   $("#fixed_menu").fadeOut("fast");
//   $("#encerradas").fadeOut("fast");
//
// }
//
// if (scroll_height >= intro_height && content_width > 855) {
//   $("#go_top").fadeIn("fast");
//   $("#fixed_menu").fadeIn("fast");
//   $("#encerradas").fadeIn("fast");
//
// }
//
//   if (content_width < 855) {
//
//      $("#menu_mobile_icon").click(function () {
//       $("#fixed_menu").fadeIn();
//       $("#menu_mobile_icon").hide();
//       $("#menu_mobile_icon_close").fadeIn();
//       return false;
//     });
//
//      $("#menu_mobile_icon_close, #apresentacao-menu-link, #etapas-menu-link, #inscricao-menu-link, #conhecatambem-menu-link").click(function () {
//       $("#fixed_menu").hide();
//       $("#menu_mobile_icon").show();
//       $("#menu_mobile_icon_close").hide();
//       return false;
//     });
//
//   }
//
//
// };
//
//
//
//
//





$(document).ready(function(){

    // Init numbers buttons
    var buttons = $("#formZebra").find("input[name='no']");
    buttons.each(function(index, btn){
        $(btn).click(function(e){
            e.preventDefault();

            var number = $(this).val();
            addNumber(number);
        })
    });

    // Init backspace button
    var backspace = $("#delete");
    backspace.click(function(e){
        e.preventDefault();
        removeNumber();
    });
});

function addNumber(number) {
    var cpf_field = $("#cpf");
    var cpf = cpf_field.val();

    if (cpf.length == 3 || cpf.length == 7) {
        cpf += ".";
    } else if (cpf.length == 11) {
        cpf += "-";
    }

    cpf = cpf.concat(number);

    if (cpf.length >= 14) {
        cpf = cpf.substring(0, 14);
    }
    cpf_field.val(cpf);
}

function removeNumber() {
    var cpf_field = $("#cpf");
    var cpf = cpf_field.val();

    cpf = cpf.substring(0, cpf.length-1);
    cpf_field.val(cpf);
}


$(".limpar").click(function(){
   $("#formZebra").reset();
})
