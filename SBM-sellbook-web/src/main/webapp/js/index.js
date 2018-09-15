
//书库部分关于书籍图片的处理
$(function(){
	$(".right_books").hover(function(){
		$(this).addClass("find_fa").css("border-bottom","2px solid #48B30F")
			.siblings().removeClass("find_fa").css("border-bottom","2px solid #FFFFFF");
		$(".find_fa").find(".hidden_span").fadeIn();
	}).mouseleave(function(){
		$(".find_fa").css("border-bottom","2px solid #FFFFFF").find(".hidden_span").fadeOut();
	});
	$(".left_books").hover(function(){
		$(this).addClass("find_fa_left").css("border-bottom","2px solid #48B30F")
			.siblings().removeClass("find_fa_left").css("border-bottom","2px solid #FFFFFF");
		$(".find_fa_left").find(".hidden_span_left").fadeIn();
	}).mouseleave(function(){
		$(".find_fa_left").css("border-bottom","2px solid #FFFFFF").find(".hidden_span_left").fadeOut();
	})
})

//书库部分按钮的文字改变
$(function(){
	$(".btn_find").hover(function(){
		$(this).children().html("GO");
	}).mouseout(function(){
		$(this).children().html("去看看");
	})
})

//书库部分按钮背景颜色的改变
$(function(){
	$('.screen li').click(function(){
		$(this).addClass("active").siblings().removeClass("active");
	})
})

//心愿单部分的按钮内容改变
$(function(){
	$(".list_btn").hover(function(){
		$(this).children().html("我去写");
	}).mouseout(function(){
		$(this).children().html("我也想");
	})
})

//首页部分切换公告栏和活动栏
$(function(){
	$('.sec_ul_1').show();
	$(".index_li_1").hover(function(){
		$(".sec_ul_2").hide();
		$(".sec_ul_1").show();
	})
	$(".index_li_2").hover(function(){
		$(".sec_ul_2").show();
		$(".sec_ul_1").hide();
	})
})

//书籍详情页面的图片的显示
$(function(){
	var $li_1=$('.book_ul_1 img');
	var $li_2=$('.book_ul_2 li');
	var index=0;
	$li_2.hover(function(){
		index=$(this).index();
		$li_1.eq(index).addClass("img_find").show()
			.siblings().removeClass("img_find").hide();
	})
})

//心愿单详情页面的点赞动画
$(function(){
	$(".ld_icon").click(function(){
		$(this).css("color","red");
	})
})

//书架部分的图标显示
$(function(){
	$("#bc_book_btn").click(function(){
		$(".bc_icon").toggle();
	})
	$("#bc_wish_btn").click(function(){
		$(".bc_list_icon").toggle();
	})
	$(".bc_icon").click(function(){
		$(this).parent().remove();
	})
	$(".bc_list_icon").click(function(){
		$(this).parent().remove();
	})
})


//论坛的评论隐藏和显示
$(function(){
	$(".com_icon_btn").click(function(){
		$(".com_hide").show();
		$(this).hide();
		$(".com_icon_btn_2").show();
	})
	$(".com_icon_btn_2").click(function(){
		$(".com_hide").hide();
		$(this).hide();
		$(".com_icon_btn").show();
	})
})

//物品详情页面的交易按钮
$(function(){
	$("#details_link").click(function(){
		$(".details_fix").show();
	})
	$("#details_fix_btn").click(function(){
		$(".details_fix").hide();
	})
})

//心愿单详情页面的交易按钮
$(function(){
	$("#ld_btn").click(function(){
		$(".ld_fix").show();
	})
	$("#ld_fix_btn").click(function(){
		$(".ld_fix").hide();
	})
})


//物品详情页面的加入购物车按钮
$(function(){
	$("#details_collect").click(function(){
		$(this).html("已加入");
	})
})

////书库页面的下一页按钮
//$(function(){
//	$("#stack_ul_btn").click(function(){
//		var li_index=$("#ul_icon>li").eq().hasClass("active");
//		alert(li_index);
//	})
//})
//书库页面的下面的分页
$(function(){
	$("#ul_icon>li").click(function(){
		$(this).addClass("active")
			.siblings().removeClass("active");
	})
})




