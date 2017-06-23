<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="group.aspx.cs" Inherits="MobileWeb.intro.group" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	<header class="header">
		<script src="<%=GetRoot() %>/common/include/header.js" ></script> 	
		<h1 class="acc-hidden"> 구조도  </h1>	
		<p class="location">
			<span>기업</span>   <em> > </em>
			<strong>구조도  </strong>
		</p>
	</header>

	<!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="acc-hidden">조직도  </h1>	
		<!--   content -->
		<section class="content">
			<div class="group_content">
				<img src="<%=GetRoot() %>/common/images/group_01.png" alt="">
				<h1 class="tit_cfo">CFO</h1>
				<dl class="dl_cfo">
					<dt>경영 지원<br> 본부 </dt>
					<dd>
						<ul>
							<li>인재경영</li>
							<li>회계</li>
							<li>자금</li>
							<li>경영전략</li>
							<li>구매</li>
							<li>사업개발</li>
						</ul>
					</dd>
				</dl>
				<h1 class="tit_coo">COO</h1>
				<dl  class="dl_coo">
					<dt>인체 의약품 <br> 사업부</dt>
					<dd>
						<ul>
							<li>직판영업</li>
							<li>도매영업</li>
							<li>학술개발</li>
							<li>마케팅 </li>
							<li>영업기획</li>
						</ul>
					</dd>
				</dl>
				<dl  class="dl_coo">
					<dt>동물 의약품<br>  사업부 </dt>
					<dd>
						<ul>
							<li>영업</li>
							<li>마케팅</li>
							<li>개발</li>
							<li>영업지원</li>
						</ul>
					</dd>
				</dl>
				<dl  class="dl_coo">
					<dt>동물 의약품<br>  사업부 </dt>
					<dd>
						<ul>
							<li>영업</li>
							<li>마케팅</li>
							<li>개발</li>
							<li>영업지원</li>
						</ul>
					</dd>
				</dl>
				<dl  class="dl_coo">
					<dt>바이오 <br>  사업부 </dt>
					<dd>
						<ul>
							<li>영업</li>
							<li>기획</li>
						</ul>
					</dd>
				</dl>
				<dl  class="dl_coo">
					<dt>해외<br>사업부 </dt>
					<dd>
						<ul>
							<li>해외수출</li>
						</ul>
					</dd>
				</dl>	
				<dl  class="dl_coo">
					<dt>생산부문</dt>
					<dd>
						<ul>
							<li>인체의약품</li>
							<li>동물의약품</li>
							<li>바이오</li>
						</ul>
					</dd>
				</dl>

				<h1 class="tit_cto">CTO</h1>	
				<dl  class="dl_cto">
					<dt>중앙 <br> 연구소 </dt>
					<dd>
						<ul>
							<li>R&D</li>
						</ul>
					</dd>
				</dl>							
			</div>
		</section> 
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	 <script src="<%=GetRoot() %>/common/include/footer.js" ></script> 

</asp:Content>