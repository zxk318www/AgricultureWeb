$(function(){
	$(".sz_brandlist ul").css({width:$(".sz_brandlist ul li").length*(125+30)+"px"});
	var numwidth=(125+30)*3;
	$(".sz_brandIn .brandbt_prev").click(function(){
		var obj=$(".sz_brandlist").find("ul");
		if (!(obj.is(":animated"))) {
			var lefts=parseInt(obj.css("left").slice(0,-2));
			if(lefts<20){
				obj.animate({left:lefts+numwidth},500);
			}
		}
	})
	$(".sz_brandIn .brandbt_next").click(function(){
		var obj=$(".sz_brandlist").find("ul");
		var objcds=-(20+(Math.ceil(obj.find("li").length/3)-2)*numwidth);
		if (!(obj.is(":animated"))) {
			var lefts=parseInt(obj.css("left").slice(0,-2));
			if(lefts>objcds){
				obj.animate({left:lefts-numwidth},500);
			}
		}
	})
	$(".brand2 ul").css({width:$(".brand2 ul li").length*(150+14)+"px"});
	var numwidth4=(150+14)*4;
	$(".Brandbox2 .brandbt_prev").click(function(){
		var obj=$(".brand2").find("ul");
		if (!(obj.is(":animated"))) {
			var lefts=parseInt(obj.css("left").slice(0,-2));
			if(lefts<14){
				obj.animate({left:lefts+numwidth4},500);
			}
		}
	})
	$(".Brandbox2 .brandbt_next").click(function(){
		var obj=$(".brand2").find("ul");
		var objcds=-(5+(Math.ceil(obj.find("li").length/3)-2)*numwidth4);
		if (!(obj.is(":animated"))) {
			var lefts=parseInt(obj.css("left").slice(0,-2));
			if(lefts>objcds){
				obj.animate({left:lefts-numwidth4},500);
			}
		}
	})
	
	$(".sz_prolist ul").css({width:$(".sz_prolist ul li").length*(145+10)+"px"});
	var numwidth2=(145+15)*6;
	$(".sz_proIn .brandbt_prev").click(function(){
		var obj=$(".sz_prolist").find("ul");
		if (!(obj.is(":animated"))) {
			var lefts=parseInt(obj.css("left").slice(0,-2));
			if(lefts<0){
				obj.animate({left:lefts+numwidth2},500);
			}
		}
	})
	$(".sz_proIn .brandbt_next").click(function(){
		var obj=$(".sz_prolist").find("ul");
		var objcds=-(0+(Math.ceil(obj.find("li").length/6)-2)*numwidth2);
		if (!(obj.is(":animated"))) {
			var lefts=parseInt(obj.css("left").slice(0,-2));
			if(lefts>objcds){
				obj.animate({left:lefts-numwidth2},500);
			}
		}
	})
	
	$(".sz_comlist ul").css({width:$(".sz_comlist ul li").length*(216+14)+"px"});
	var numwidth3=(208+15)*4;
	$(".sz_comIn .brandbt_prev").click(function(){
		var obj=$(".sz_comlist").find("ul");
		if (!(obj.is(":animated"))) {
			var lefts=parseInt(obj.css("left").slice(0,-2));
			if(lefts<0){
				obj.animate({left:lefts+numwidth3},500);
			}
		}
	})
	$(".sz_comIn .brandbt_next").click(function(){
		var obj=$(".sz_comlist").find("ul");
		var objcds=-(0+(Math.ceil(obj.find("li").length/4)-2)*numwidth);
		if (!(obj.is(":animated"))) {
			var lefts=parseInt(obj.css("left").slice(0,-2));
			if(lefts>objcds){
				obj.animate({left:lefts-numwidth3},500);
			}
		}
	})
})
