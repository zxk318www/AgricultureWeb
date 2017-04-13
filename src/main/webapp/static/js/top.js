$(document).ready(function(){
	  
	  //返回顶部
	  var bt = $('.oTop');
        var sw = $(document.body)[0].clientWidth;

        var limitsw = (sw - 1000) / 2 - 100;
        /*if (limitsw > 0){
                limitsw = parseInt(limitsw);
                bt.css("right",limitsw);
        }*/
		var m= window.location.href;
        $(window).scroll(function() {
                var st = $(window).scrollTop();
                if(st > 100 && m.search(/ftnzzintro/)==-1){
					bt.show();
                }else{
                        bt.hide();
                }
        });
		if(m.search(/ftnzzintro/)==-1) {$('.ftad_menu').hide()}
	 bt.click(function() {
		$('body,html').animate({scrollTop:0},600);
		});
     
})
	  
	 
