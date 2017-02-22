  function abrir(url) { 
open(url,'','top=100,left=240,width=700,height=500') ; 
} 

$(document).on("ready",function(){
    
   $("#banner").css({"height":$(window).height()+"px"});               
   var flag = false;
    var scroll;


    
    $(window).scroll(function(){
        scroll=$(window).scrollTop();
        
        if(scroll > 200){
            if(!flag){
                $("#logo").css({"margin-top":"-5px", "width":"100px", "height":"50px", "margin-left":"-200px", "margin-right":"-1200px"});
                 $(".let").css({"color":"white"});
                $("header").css({"background-color":"#08184C"});
                $("#l1").mouseover(function() {
                    $("#l1").css( {"color":"#00FFF3"} );
                 });
                $("#l1").mouseout(function() {
                    $("#l1").css( {"color":"white"} );
                 });   
                 $("#l2").mouseover(function() {
                    $("#l2").css( {"color":"#00FFF3"} );
                 });
                $("#l2").mouseout(function() {
                    $("#l2").css( {"color":"white"} );
                 });    
                 $("#l3").mouseover(function() {
                    $("#l3").css( {"color":"#00FFF3"} );
                 });
                $("#l3").mouseout(function() {
                    $("#l3").css( {"color":"white"} );
                 });    
               
                document.getElementById('player').play();
                flag=true;
            }
        }else{
            if (flag){
                $("#logo").css({"margin-top":"150px", "width":"500px", "height":"250px", "margin-left":"120px"});
                 $("header").css({"background-color":"transparent"});
                $(".let").css({"color":"transparent"});
                $("#l1").mouseover(function() {
                    $("#l1").css( {"color":"transparent"} );
                 });
                $("#l1").mouseout(function() {
                    $("#l1").css( {"color":"transparent"} );
                 });
                $("#l2").mouseover(function() {
                    $("#l2").css( {"color":"transparent"} );
                 });
                $("#l2").mouseout(function() {
                    $("#l2").css( {"color":"transparent"} );
                 });
                $("#l3").mouseover(function() {
                    $("#l3").css( {"color":"transparent"} );
                 });
                $("#l3").mouseout(function() {
                    $("#l3").css( {"color":"transparent"} );
                 });
                flag=false; 
            }   
        }
    });
    
});

    
    