<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="group.aspx.cs" Inherits="HomePage.en.intro.group" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content" >
	<header>
		<h1 class="pageTitle line">Organization Structure</h1>
		<p class="location">
			<a href="/en/index.aspx"><span><img src="/en/common/images/common/i_home.png" alt="home"></span></a>
			<a href="/en/intro/vision.aspx"><span>Company</span></a><em> > </em>
			<a href="/en/intro/group.aspx"><strong> Organization Structure</strong></a>
		</p>
	</header>
	<!--  내용  ***************** -->
	<img src="/en/common/images/sub/group.png" alt="">
	<div class="acc-hidden">
		<h1>회장</h1>
		<h2>CFO</h2>
		<h4>경영지원본부</h4>
		<ul>
			<li>인재경영</li>
			<li>회계</li>
			<li>자금</li>
			<li>경영전략</li>
			<li>구매 </li>
			<li>사업개발</li>
		</ul>
		<h3>COO</h3>
		<h4>인체 의약품 사업부 </h4>
		<ul>
			<li>직판영업</li>
			<li>도매영업</li>
			<li>학술개발</li>
			<li>마케팅 </li>
			<li>영업기획</li>
		</ul>
		<h4>동물 의약품 사업부 </h4>
		<ul>
			<li>영업</li>
			<li>마케팅</li>
			<li>개발</li>
			<li>영업지원</li>
		</ul>
		<h4>바이오 사업부 </h4>
		<ul>
			<li>영업</li>
			<li>기획</li>
		</ul>
		<h4>해외 사업부 </h4>
		<ul>
			<li>해외수출</li>
		</ul>				
		<h4>생산부문 </h4>
		<ul>
			<li>인체의약품</li>
			<li>동물의약품</li>
			<li>바이오</li>
		</ul>
		<h2>CTO</h2>
		<h4>중앙연구소</h4>
		<ul>
			<li>바이오</li>
		</ul>				
	</div>

	<!-- // 내용 ***************** -->         
</section>  <!--// sub_content -->

</asp:Content>