function changeTab(obj){

	$(obj).siblings('li').each(function(){
		$(this).find('a').removeClass('current').css('color','#666').css('background-color','#efefef');
	});	
	$(obj).find('a').addClass('current').css('color', '#30ae11').css('background-color','#fff');
	
	//$('#tabs').children('div.panes').find('div').css('display', 'none');

	//Show/Hide divs
	var objidx = $(obj).index();	
	$('#tabs').children('div.panes').find('div').each(function(){
		$(this).css('display', 'none');
		$(this).css('opacity', 0);
	})
	$('#tabs').children('div.panes').find('div').eq(objidx).css('display', 'block');
	$('#tabs').children('div.panes').find('div').eq(objidx).animate({'opacity': 1},500);
	
}

