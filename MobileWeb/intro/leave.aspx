<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="leave.aspx.cs" Inherits="MobileWeb.intro.leave" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	<header class="header">
		<script src="<%=GetRoot() %>/common/include/header.js" ></script> 	
		<h1 class="acc-hidden">발자취</h1>	
		<p class="location">
			<span>기업</span><em> > </em>
			<strong>발자취</strong>
		</p>
	</header>

	<!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="acc-hidden">발자취</h1>	
		<ul class="tap_3depth tap_4">
			<li> <button type="button" onclick="Content_tap(1);" class="tap_01 onhover">2010년대</button></li>
			<li> <button type="button" onclick="Content_tap(2);" class="tap_02">2000년대</button> </li>
			<li> <button type="button" onclick="Content_tap(3);" class="tap_03">1990년대</button> </li>
			<li> <button type="button" onclick="Content_tap(4);" class="tap_04">1980년대</button> </li>
		</ul>
		<!--   content -->
		<section class="content">	
			<div class="leave content_01">
				<h2 class="title_big">전략적 이노베이션</h2>
				<div class="list pT18">
					<h3>2017년</h3>
					<dl>
						<dt>03/28</dt>
						<dd>BNC KOREA 필러 제품(큐젤 등) 국내 독점 판매<br>
						    계약 체결</dd>
						<dt>03/01</dt>
						<dd>국내 최초 젖소 유방염 다가 백신 <br>
						   '히프라 스타박' 출시</dd>
					</dl>	
				</div>
				<div class="list">
					<h3>2016년</h3>
					<dl>
						<dt>10/17</dt>
						<dd>자가섬유아세포치료제 "큐어스킨" 독점 공급<br>
						    계약 체결</dd>
						<dt>10/01</dt>
						<dd>조사료 신규사업 추진</dd>
						<dt>09/13</dt>
						<dd>섬유아세포 분리방법 특허 출원</dd>
						<dt>08/29</dt>
						<dd>미슬토 주사제 "이스카도" 국내 독점 판매<br>
						    계약 체결</dd>
						<dt>05/01</dt>
						<dd>PPC제제, 일본 수출 계약 체결</dd>
						<dt>04/01</dt>
						<dd>수출의약품(제품명: Trimedat), <br>
						    Russian Pharma Awards수상</dd>
					</dl>	
				</div>
				<div class="list">
					<h3>2015년</h3>
					<dl>
						<dt>12/15</dt>
						<dd>서울대학교와 줄기세포 공동연구<br>
						    협약 체결</dd>
						<dt>12/05</dt>
						<dd>'천만불 수출탑' 수상</dd>
						<dt>12/01</dt>
						<dd>루치온 스킨케어 화장품, <br>
						    중국 수출 계약 체결</dd>
					</dl>	
				</div>
				<div class="list">
					<h3>2014년</h3>
					<dl>
						<dt>04/02</dt>
						<dd>바이오 사업 세포 배지 제조 공장 준공<br>(경기도 화성)</dd>
						<dt>03/21</dt>
						<dd>의료기기 사업 진출</dd>
					</dl>	
				</div>
				<div class="list">
					<h3> 2013년 </h3>
					<dl>
						<dt>01/21</dt>
						<dd>일본 CSTI사와 세포 배양 배지 <br>기술이전 계약</dd>
					</dl>
				</div>
				<div class="list">
					<h3>2012년</h3>
					<dl>
						<dt>11/02</dt>
						<dd>미국 GenScript사와 바이오 공정소재 <br>판매 계약</dd>
						<dt>07/13</dt>
						<dd>선도적으로 니치마켓 히트 상품 <br>루치온주(일명 ‘백옥주사’) 출시</dd>
					</dl>
				</div>
				<div class="list">
					<h3>2011년 </h3>
					<dl>
						<dt>05/01</dt>
						<dd>‘조직 및 유통구조 혁신’ 추진</dd>
						<dt>03/01</dt>
						<dd>웰빙뷰티 솔루션 및 포트폴리오 집중개발</dd>
						<dt>01/01</dt>
						<dd>“Start-up 대한뉴팜” 선포</dd>
					</dl>
				</div>

			</div>	
			<div class="leave content_02" style="display:none;">
				<h3 class="title_big">사업 다각화</h3>
				<div class="list pT18">
					<h3>2007년 </h3>
					<dl>
						<dt>11/30</dt>
						<dd>5백만불 수출의 탑 수상</dd>
						<dt>06/29</dt>
						<dd>Baverstock GmbH 지분 17% 취득, <br>유전개발사업 진출</dd> 
						<dt>05/29</dt>
						<dd>사업목적 추가<br>(자원개발 및 해외자원개발 투자사업)</dd>
					</dl>
				</div>
				<div class="list">
					<h3>2004년 </h3>
					<dl>
						<dt>10/24</dt>
						<dd>의약품유통관리기준(KGSP)<br> 적격업소 지정</dd> 
					</dl>
				</div>
				<div class="list">
					<h3>2002년 </h3>
					<dl>
						<dt>12/31</dt>
						<dd>농림부장관 표창</dd> 
						<dt>07/26</dt>
						<dd>수출유망 중소기업 지정 <br>(서울지방중소기업청)</dd> 
						<dt>02/26</dt>
						<dd>코스닥 등록</dd> 
					</dl>
				</div>
				<div class="list">
					<h3>2001년 </h3>
					<dl>
						<dt>12/05</dt>
						<dd>동물약품 KVGMP 허가</dd> 
						<dt>06/16</dt>
						<dd>중앙연구소 설립</dd> 
						<dt>04/09</dt>
						<dd>상호변경<br>(株式會社 大韓新藥 -> 대한뉴팜 주식회사)</dd> 
					</dl>
				</div>
				<div class="list">
					<h3>2000년 </h3>
					<dl>
						<dt>04/24</dt>
						<dd>주사제 KGMP 적격업소로 지정</dd> 
					</dl>
				</div>
			</div>		

			<div class="leave content_03" style="display:none;">
				<h3 class="title_big">사업 확장</h3>
				<div class="list pT18">
					<h3>1996년 </h3>
					<dl>
						<dt>03/20</dt>
						<dd>내용고형제 KGMP 적격업소로 지정</dd>
					</dl>
				</div>
				<div class="list">
					<h3>1994년</h3>
					<dl>
						<dt>06/29</dt>
						<dd>향남공장 설립 / 인체 의약품</dd>
					</dl>	
				</div>
			</div>	

			<div class="leave content_04" style="display:none;">
				<h3 class="title_big">사업 인프라 구축</h3>
				<div class="list pT18">
					<h3>1988년</h3>
					<dl>
						<dt>08/07 </dt>
						<dd>동물약품 수출입 허가</dd>
					</dl>	
				</div>
				<div class="list">
					<h3>1987년</h3>
					<dl>
						<dt>07/28</dt>
						<dd>무역업 허가</dd> 
					</dl>
				</div>	
				<div class="list">
					<h3>1984년</h3>
					<dl>
						<dt>12/20</dt>
						<dd>동물약품 제조업 허가 (농수산부)</dd> 
						<dt>10/27</dt>
						<dd>고형미네랄 사료 제조방법 특허권 양수</dd> 
						<dt>10/25</dt>
						<dd>주문용 사료 첨가제 제조 품목허가</dd> 
						<dt>10/20</dt>
						<dd>株式會社 大韓新藥 창립</dd> 
					</dl>
				</div>
			</div>	
		</section> 
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	 <script src="<%=GetRoot() %>/common/include/footer.js" ></script> 

</asp:Content>