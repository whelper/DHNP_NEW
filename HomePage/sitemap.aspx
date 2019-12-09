<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sitemap.aspx.cs" Inherits="HomePage.sitemap" %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=1024" /> 
	<link rel="shortcut icon" type="image/x-icon" href="/view/favicon.ico?1" />
	<!--[if IE ]>
        <meta http-equiv="X-UA-Comaptible" content="IE=edge">
    <![endif]-->
	<title>대한뉴팜  </title>
	<!-- SEO: 검색 엔진 최적화 -->
	<meta name="description" content="대한뉴팜의 소개와 제품소개입니다. " />
	<meta name="keywords" content="대한뉴팜, 의약품 " />

	<link rel="stylesheet" href="/common/css/default.css" />
	<link rel="stylesheet" href="/common/css/common.css" />
	<link rel="stylesheet" href="/common/css/sub.css" />
	<link rel="stylesheet" href="/common/css/table.css" />
	<link rel="stylesheet" href="/common/css/print.css"  media="print" />
	<!-- Html5 및 css3 미지원 브라우저를 위한 설정 js-->
	<!--[if IE ]>
		<script type="text/javascript" src="/common/js/html5shiv.js"></script>
        <script type="text/javascript" src="/common/js/html5shiv-printshiv.js"></script>
		<script type="text/javascript" src="/common/js/respond.min.js"></script>
	<![endif]-->
	<!--[if lt IE 7]>
		<script src="/common/js/IE7.js"></script>
        <script type="text/javascript" src="/common/js/html5shiv-printshiv.js"></script>
	<![endif]-->
	<script type="text/javascript" src="/common/js/jquery-1.9.1.min.js" ></script> 
	<script type="text/javascript" src="/common/js/jquery-ui.min.js" ></script> 
	<script type="text/javascript" src="/common/js/common.js" ></script> 
</head>
<body> 
<div class="wrap" >
	<nav id="skip">
		<h1 class="acc-hidden"> 바로가기 네비게이션 </h1>
		<a href="#content"> 본문내용 바로가기 </a>
	</nav>
	<header class="header">
		<div class="header_bg">&nbsp;</div> <!-- // header_bg -->
		<div class="header_content">
			<h1 class="logo"> <a href="./"> 대한뉴팜 </a></h1>
			<nav class="lnb">
				<h1 class="acc-hidden"> 로컬 네비게이션 </h1>
				<ul class="lnb_ul">
					<li><a href="/customer/inquire.aspx"><span class="lnb_contact"> contact</span>  </a></li>
					<li><a href="sitemap.aspx"><span class="lnb_sitemap">Sitemap</span></a></li>
					<li><a href="/en/index.aspx"><span class="lnb_english"> english </span> </a></li>
					<li><a href="javascript:window.print()" ><span class="lnb_print"> 인쇄하기 </span> </a></li>
				</ul>
			</nav>  <!-- // lnb -->
			<nav class="gnb">
				<h1 class="acc-hidden"> 글로벌 네비게이션 </h1>
				<ul class="gnb_ul">
					<li> <a href="/intro/vision.aspx"   class="gnb_01"> 기업 </a>
						<ul  class="ly" style="display:none;">
							<li><a href="/intro/vision.aspx" >비전</a></li>
							<li><a href="/intro/leave.aspx">발자취</a></li>
							<li><a href="/intro/group.aspx">조직도</a></li>
							<li><a href="/intro/location.aspx"> 오시는길 </a></li>
						</ul>
					</li>
					<li><a href="/products/human_new_list.aspx" class="gnb_02 "> 제품  </a>
						<ul  class="ly" style="display:none;">
							<li><a href="/products/product_new_list.aspx?category=01&menu=0102"> 인체 의약품 </a></li>
							<li><a href="/products/product_new_list.aspx?category=02&menu=0202"> 동물 의약품 </a></li>
							<li><a href="/products/product_list.aspx?category=03&menu=0301"> 바이오 의약품  </a></li>
							<li><a href="/products/product_list.aspx?category=04&menu=0401" > 수출 의약품 </a></li>
							<li><a href="/products/product_list.aspx?category=07&menu=0501"> 건강기능식품  </a></li>
                        	<li><a href="/products/product_list.aspx?category=08&menu=0601"> 의료기기  </a></li>
						</ul>
					</li>
					<li><a href="/pr/news_list.aspx" class="gnb_03"> 홍보  </a>
						<ul  class="ly" style="display:none;">
							<li><a href="/pr/news_list.aspx" >새소식</a></li>
							<li><a href="/pr/global_list.aspx">해외자원개발</a></li>
						</ul>
					</li>
					<li><a href="/invest/ir_info_list.aspx" class="gnb_04">  투자  </a>
						<ul  class="ly" style="display:none;">
							<li><a href="/invest/business.aspx"> 경영정보  </a></li>
							<li><a href="/invest/money_mark.aspx"> 재무정보   </a></li>
							<li><a href="/invest/stock_info.aspx"> 주식정보  </a></li>
                            <!--
                            <li><a href="/invest/pub_announce.aspx">공시자료</a></li>
                            -->
							<li><a href="/invest/notice_list.aspx"> 공고사항  </a></li>
						</ul>
					</li>
					<li><a href="/recruit/new_person.aspx" class="gnb_05"> 채용    </a>
						<ul  class="ly" style="display:none;">
							<li><a href="/recruit/new_person.aspx"> 대한뉴팜인   </a></li>
							<li><a href="/recruit/job_notify_list.aspx"> 상시채용    </a></li>
							<li><a href="/recruit/job_guide_list.aspx"> 입사지원    </a></li>
							<li><a href="/recruit/faq_list.aspx"> FAQ </a></li>
						</ul>
					</li>
				</ul>
			</nav>  <!-- // gnb -->
		</div> <!-- // header_content --> 
	</header>
	<hr>
	
	<div  class="container clear">
			<header>
				<h1 class="pageTitle line"> 사이트맵  <span>Sitemap</span>  </h1>
				<p class="location">
					<a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
					<a href="sitemap.aspx"><strong>Sitemap</strong></a>
				</p>
			</header>
			<!--  내용  ***************** -->

			 <section class="sitemap">
			 	<div class="col">
			 		<h1>기업 </h1>
			 		<ul>
						<li><a href="/intro/vision.aspx" >비전</a></li>
						<li><a href="/intro/leave.aspx">발자취</a></li>
						<li><a href="/intro/group.aspx">조직도</a></li>
						<li><a href="/intro/location.aspx"> 오시는길 </a></li>
			 		</ul>
			 	</div>
			 	<div class="col" style="width:160px;">
			 		<h1>제품 </h1>
			 		<ul>
			 			<li><a href="/products/product_new_list.aspx?category=01&menu=0102"> 인체 의약품 </a>
							<ul>
								<li><a href="/products/product_new_list.aspx?category=01&menu=0102"> 신제품 </a></li>
								<li><a href="/products/product_list.aspx?category=01&menu=0101"> 제품소개 </a></li>
								<li><a href="/products/human_change_list.aspx?menu=0103"> 제품변경정보 </a></li>
							</ul>
			 			</li>
			 			<li><a href="/products/product_new_list.aspx?category=02&menu=0202">동물 의약품</a>
							<ul>
								<li><a href="/products/product_new_list.aspx?category=02&menu=0202">신제품</a></li>
								<li><a href="/products/product_list.aspx?category=02&menu=0201">제품소개</a></li>
								<li><a href="/products/product_list.aspx?category=0207&menu=0203">관납제품 </a></li>
							</ul>
			 			</li>
			 			<li><a href="/products/product_list.aspx?category=03&menu=0301">바이오 의약품 </a>
							<ul>
								<li><a href="/products/product_list.aspx?category=03&menu=0301">제품군</a></li>
								<li><a href="/products/bio_rnd.aspx?&menu=0302">연구분야</a> </li>
							</ul>
			 			</li>
			 			<li><a href="/products/product_list.aspx?category=04&menu=0401">수출 의약품</a>
							<ul>
								<li><a href="/products/product_list.aspx?category=04&menu=0401">인체 의약품</a></li>
								<li><a href="/products/product_list.aspx?category=05&menu=0402">동물 의약품</a></li>
								<li><a href="/products/product_list.aspx?category=06&menu=0403">기타</a></li>								
							</ul>
			 			</li>
			 			<li><a href="/products/product_list.aspx?category=07&menu=0501">건강기능식품</a>
							<ul>
								<li><a href="/products/product_list.aspx?category=07&menu=0501">제품소개</a></li>
							</ul>
			 			</li>
			 			<li><a href="/products/product_list.aspx?category=08&menu=0601">의료기기</a>
							<ul>
								<li><a href="/products/product_list.aspx?category=08&menu=0601">제품소개</a></li>
							</ul>
			 			</li>
			 		</ul>
			 	</div>
			 	<div class="col">
			 		<h1>홍보 </h1>
			 		<ul>
			 			<li><a href="/pr/news_list.aspx">새소식 </a></li>
			 			<li><a href="/pr/global_list.aspx">해외자원투자</a></li>
			 		</ul>
			 	</div>
			 	<div class="col">
			 		<h1>투자 </h1>
			 		<ul>
			 			<li><a href="/invest/business.aspx">경영정보 </a>
							<ul>
                                <li><a href="/invest/business.aspx">사업전략</a></li>
								<li><a href="/invest/ir_info_list.aspx">IR자료</a></li>
							</ul>
			 			</li>
			 			<li><a href="/invest/money_mark.aspx"> 재무정보</a>
							<ul>
								<li><a href="/invest/money_mark.aspx"> 재무상태표</a></li>
								<li><a href="/invest/money_bill.aspx">손익계산서 </a></li>
							</ul>
			 			</li>
			 			<li><a href="/invest/stock_info.aspx">주식정보 </a>
							<ul>
								<li><a href="/invest/stock_info.aspx">주식발행</a></li>
								<li><a href="/invest/treasury_stock.aspx">자기주식</a></li>
							</ul>
			 			</li>
                        <!--
                        <li><a href="/invest/pub_announce.aspx">공시자료</a></li>
                        -->
			 			<li><a href="/invest/notice_list.aspx">공지/공고 </a></li>
			 		</ul>
			 	</div>
			 	<div class="col">
			 		<h1>채용</h1>
			 		<ul>
			 			<li><a href="/recruit/new_person.aspx">대한뉴팜인  </a> 
							<ul>
								<li><a href="/recruit/new_person.aspx">인재상 </a></li>
								<li><a href="/recruit/new_evaluation.aspx">평가보상</a> </li>
								<li><a href="/recruit/new_interest.aspx">복리후생 </a></li>
								<li><a href="/recruit/new_edu.aspx">교육제도 </a></li>
							</ul>
			 			</li>
			 			<li><a href="/recruit/job_notify_list.aspx">채용안내</a> 
							<ul>
								<li><a href="/recruit/job_notify_list.aspx">채용공고</a> </li>
								<li><a href="/recruit/job_guide.aspx">채용절차</a></li>
								<li><a href="/recruit/result_list.aspx">전형결과확인</a></li>
							</ul>
			 			</li>
			 			<li><a href="/recruit/job_guide_list.aspx">입사지원 </a> </li>
			 			<li><a href="/recruit/faq_list.aspx">FAQ  </a> </li>
			 		</ul>
			 	</div>
			 	<div class="col">
			 		<h1>고객 </h1>
			 		<ul>
			 			<li><a href="/customer/inquire.aspx">제품문의  </a> </li>
			 		</ul>
			 	</div>	
			 </section>

			<!-- // 내용 ***************** -->         

	</div><!--// container -->
<!--	
	<aside id="quick_menu">
		<h1> <span>  Quick menu  </span> </h1>
		<ul>
			<li class="qu_01"> <a href="./"> home </a> </li>
			<li class="qu_02"> <a href="/products/human_new_list.aspx"> 인체의 약품  </a> </li>
			<li class="qu_03"> <a href="/products/animal_new_list.aspx"> 동물의 약품  </a> </li>
			<li class="qu_04"> <a href="/products/bio_badge_list.aspx"> 바이오공정소재  </a> </li>
			<li class="qu_05"> <a href="/recruit/job_notify_list.aspx"> </a> </li>
		</ul>
	</aside>	
-->
	<hr>
	<footer class="footer">
		<article class="footer_content">
			<h1 class="logo_footer"><img src="/common/images/common/logo_footer.png" alt="주) 대한뉴팜" ></h1>
			<nav class="fnb clear"> 
				<h1 class="acc-hidden"> 하단 메뉴 </h1>
				<ul class="fnb_ul ">
					<li> <a href="/main/terms.aspx" title="이용약관" target="_blank" onClick="window.open(this.href,'popup', 'width=600, height=800'); return false;">이용약관 </a> <em>&nbsp;</em> </li>
				    <li> <a href="/main/agreement.aspx" title="개인정보취급방침" target="_blank" onClick="window.open(this.href, '_blank', 'toolbar=no, scrollbars=no, resizable=no, top=100, left=200, width=600, height=700'); return false;"  class="line">개인정보취급방침</a></li>
				</ul>
			</nav>
			<address class="address clear">
				<span class="addr">경기도 화성시 향남읍 제약공단1길 66  </span>
				<span class="num">사업자번호 : 229-81-10729</span> <br>
				<span class="ceo">대표자명 : 이완진, 이영섭   </span>
				<span class="tel">대표전화 : (02)581-2333 </span>
				<span class="fax">팩스 : (02)581 1644 </span>
				<p class="copyright">Copyright   &copy;   Daehan New Pharm Co.,LTD   All right reserved.</p>
			</address>
   		</article> 
	</footer> <!-- // footer -->
</div> <!--// wrap-->

<script type="text/javascript">
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date(); a = s.createElement(o),
  m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-52745434-1', 'auto');
    ga('send', 'pageview');

</script>

</body>
</html>