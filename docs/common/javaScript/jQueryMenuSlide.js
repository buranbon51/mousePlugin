$(function () {

// クリックとタップの違いに対応させる。
// 今はやらない。
//var clickEventType = (( window.ontouchstart!==null ) ? 'click':'touchend');

    // 辞書のハンバーガーボタン
    $("#anywhere-menu-btn").on("click",function(){
        $(this).toggleClass("active");
        $("#anywhere-menu").fadeToggle(500);
    });

    $("#anywhere-menu li a").on("click",function(){
        $("#anywhere-menu-btn").removeClass("active");
        $("#anywhere-menu").fadeOut();
    });

    $('#anywhere-menu a[href*="#"]').click(function () {
        var elmHash = $(this).attr('href');
        var pos = $(elmHash).offset().top;
        $('body,html').animate({scrollTop: pos}, 700);
        return false;
    });

/*---------------------
最下部にあるパンくずリスト
-----------------------*/
    $("#close-tool").on("click",function(){
        $("#tool-every").fadeOut(500);
        $("#tool-area-button").removeClass("bton");
    });

    $(".tool-pageTop").on("click",function(){
        $("#tool-every").fadeOut(500);
        $("#tool-area-button").removeClass("bton");
    });

    $("#tool-area").on("click",function(){
        $("#tool-every").fadeToggle(500);
        $("#tool-area-button").toggleClass("bton");
    });

    $('.tool-pageTop').click(function () {
        var elmHash = $(this).attr('href');
        var pos = $(elmHash).offset().top;
        $('body,html').animate({scrollTop: pos}, 500);
        return false;
    });

/*---------------------
  スクロール
-----------------------*/

    $('.thispage-link').click(function () {
        var elmHash = $(this).attr('href');
        var pos = $(elmHash).offset().top;
        $('body,html').animate({scrollTop: pos}, 500);
        return false;
    });

/*---------------------
  アコーディオン
-----------------------*/

    //タイトル  をクリックした時の動作
    $('.slideTitle').on('click', function() {
        var svcElm = $(this).next('.slideViewContent');
        var scElm = $(svcElm).next('.slideContent');
        $(scElm).slideToggle();

        var swElm = $(this).parent('.slideWrap');
        if($(swElm).hasClass('openslide')){
            $(swElm).removeClass('openslide');
        }else{
            $(swElm).addClass('openslide');
        }
    });

    //続きを見る  をクリックした時の動作
    $('.slideViewContent-next').on('click', function() {
        var svcElm2 = $(this).parent('.slideViewContent');
        var scElm2 = $(svcElm2).next('.slideContent');
        $(scElm2).slideToggle();

        var swElm2 = $(svcElm2).parent('.slideWrap');
        if($(swElm2).hasClass('openslide')){
            $(swElm2).removeClass('openslide');
        }else{
            $(swElm2).addClass('openslide');
        }
    });

    //アコーディオンの中のアコーディオン
    $('.slideTitle-double').on('click', function() {
        var scElm_d = $(this).next('.slideContent-double');
        $(scElm_d).slideToggle();

        var swElm_d = $(this).parent('.slideWrap-double');
        if($(swElm_d).hasClass('open-double')){
            $(swElm_d).removeClass('open-double');
        }else{
            $(swElm_d).addClass('open-double');
        }
    });

});
