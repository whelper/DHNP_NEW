<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="vision.aspx.cs" Inherits="MobileWeb.intro.vision" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <header class="header">
		<script src="<%=GetRoot() %>/common/include/header.js" ></script> 	
		<h1 class="acc-hidden">기업</h1>	
		<p class="location">
			<span>기업</span>   <em> > </em>
			<strong>비전</strong>
		</p>
	</header>

	<!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="acc-hidden">비전</h1>	
		<!--   content -->
		<section class="content">
			<p class="vision_txt">대한뉴팜은 겉으로 드러나는 화려함보다 알찬 성장과 내실을 추구하며 <strong>건강하고 행복한 사회발전에 기여하는 회사</strong>가 될 수 있도록 항상 최선을다하겠습니다.  </p>

			<ul class="vision_content">
				<li><span class="bg_icon_01">ideology</span></li>
				<li>
					<h1 class="title_01">경영 이념 <span>[Management Philosophy]</span></h1>
					<p class="title_p">건강한 삶, 행복한 사회, 더불어 따뜻함을 <br> 함께하는 대한뉴팜 </p>
					<ul class="arrow_list">
						<li><span>▶ </span>인간의 존엄과 생명을 우선시 하는 인본경영</li>
						<li><span>▶ </span>기본과 원칙을 지키는 윤리경영</li>
						<li><span>▶ </span>끊임없이 도전하고 혁신하는 창조경영</li>
					</ul>
				</li>
			</ul>

			<ul class="vision_content">
				<li><span class="bg_icon_02">vision</span></li>
				<li>
					<h1 class="title_01">비전 <span>[Vision]</span></h1>
					<p class="title_p">특성화와 전문화로 새로운 성장모델을 만들어 <br>
						 가는 니치버스터(Nichebuster)</p>
				</li>
			</ul>

			<ul class="vision_content">
				<li><span class="bg_icon_03">goal</span></li>
				<li>
					<h1 class="title_01">전략목표2020 <span>[Strategic Target 2020]</span></h1>
					<ul>
						<li>
							<h2 class="title_p">정량</h2>
							<ul class="arrow_list mB_line">
								<li><span>▶ </span>주요사업 매출 2,000억 달성</li>
								<li><span>▶ </span>20% 이상의 지속성장 역량 확보 </li>
								<li><span>▶ </span>바이오 사업 매출비중 20% 달성</li>
								<li><span>▶ </span>해외사업 매출비중 20% 달성</li>
							</ul>
						</li>
						<li>
							<h2 class="title_p">정성</h2>
							<ul class="arrow_list">
								<li><span>▶ </span>강한 신뢰로 고객이 먼저 찾는 기업</li>
								<li><span>▶ </span>인재존중으로 창의력이 넘치는 기업</li>
								<li><span>▶ </span>안전, 환경, 사회적 책임을 다하는 기업</li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
			<ul class="vision_content">
				<li><span class="bg_icon_04">direction</span></li>
				<li>
					<h1 class="title_01">전략방향 <span>[Strategic Direction]</span></h1>
					<ul>
						<li><h2 class="title_p">1. 성장동력 육성 가속화</h2>
							<ul class="arrow_list mB">
								<li><span>▶ </span> 시장에서 인정받는 대표품목 육성</li>
								<li><span>▶ </span> 차별화된 “The Only 제품”의 선도적 개발</li>
								<li><span>▶ </span> 해외 파트너 전략적 제휴 강화</li>
								<li><span>▶ </span> 바이오 사업 집중 추진</li>
							</ul>
						</li>
						<li><h2 class="title_p">2. 철저한 현금흐름중심 경영</h2>
							<ul class="arrow_list mB">
								<li><span>▶ </span>최적의 제품 포트폴리오 운영</li>
								<li><span>▶ </span>가치중심경영으로 운영 효율 제고</li>
								<li><span>▶ </span>품질경영 강화(제품의 질, 업무의 질, 사람의 질)</li>
							</ul>
						</li>
						<li><h2 class="title_p">3. 즐거움과 활력이 넘치는 조직문화 조성</h2>
							<ul class="arrow_list">
								<li><span>▶ </span> 성과주의 신인사시스템</li>
								<li><span>▶ </span> 투명하고 정직한 의사소통</li>
								<li><span>▶ </span> 주인의식으로 책임을 다하는 인재존중</li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>

			<ul class="vision_content">
				<li><span class="bg_icon_05">capability</span></li>
				<li>
					<h1 class="title_01">핵심역량 <span>[Core Competence]</span> </h1>
					<ul class="arrow_list">
						<li><span>▶ </span>제품탐색 및 런칭</li>
						<li><span>▶ </span>맞춤형 기술영업</li>
						<li><span>▶ </span>특화된 솔루션 개발력 </li>
						<li><span>▶ </span>전략적 제휴 </li>
						<li><span>▶ </span>핵심인재 육성 </li>
					</ul>
				</li>
			</ul>

			<ul class="vision_content">
				<li><span class="bg_icon_06">value</span></li>
				<li>
					<h1 class="title_01">핵심가치 <span>[Core Value]</span></h1>
					<ul class="arrow_list">
						<li><span>▶ </span>영감과 열정</li>
						<li><span>▶ </span>도전과 혁신</li>
						<li><span>▶ </span>정직과 신뢰</li>
						<li><span>▶ </span>경청과 소통</li>
						<li><span>▶ </span>긍정적 생각과 실행</li>
					</ul>
				</li>
			</ul>

			<div class="vision_content_01">
				<h1 class="title_01">사업도메인 <span>[Business Field]</span></h1>
				<img src="<%=GetRoot() %>/common/images/vision_graph.png" alt="">
			</div>

		</section> 
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	 <script src="<%=GetRoot() %>/common/include/footer.js" ></script>

</asp:Content>