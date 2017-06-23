$(function(){
	
	$("#datepicker, #datepicker2").datepicker({
		//showOn: "both", // 버튼 텍스트 모두 적용
		//buttonImage: "./images/ico-calendar.jpg", // 버튼 이미지
		//buttonImageOnly: true, // 버튼에 있는 이미지만 표시
		changeMonth: true,
		changeYear: true,
		minDate: '-10y', 
		nextText: '다음 달',
		prevText: '이전 달', 
		numberOfMonths: [1,1], 
		yearRange: 'c-100:c+10', // 년도 표시 범위
		//showButtonPanel: true,  
		//currentText: '오늘 날짜' , 
		//closeText: '닫기', 
		dateFormat: "yy-mm-dd",
		showAnim: "fade", 
		showMonthAfterYear: true ,
		dayNamesMin: ['일','월', '화', '수', '목', '금', '토' ],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
	});
})



