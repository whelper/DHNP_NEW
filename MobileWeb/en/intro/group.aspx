<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="group.aspx.cs" Inherits="MobileWeb.en.intro.group" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	<header class="header">
		<script src="<%=GetRoot() %>/en/common/include/header.js" ></script> 	
		<h1 class="acc-hidden">Organization Structure</h1>	
		<p class="location">
			<span>Company</span>   <em> > </em>
			<strong>Organization Structure</strong>
		</p>
	</header>

	<!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/en/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="acc-hidden">조직도  </h1>	
		<!--   content -->
		<section class="content">
			<div class="group_content">
				<img src="../common/images/group_01.png" alt="">
				<h1 class="tit_cfo">CFO</h1>
				<dl class="dl_cfo">
					<dt>Business<br> Management </dt>
					<dd>
						<ul>
							<li>HR</li>
							<li>Accounting</li>
							<li>Finance</li>
							<li>Biz Statgy</li>
							<li>Procurement</li>
							<li>Biz Development</li>
						</ul>
					</dd>
				</dl>
				<h1 class="tit_coo">COO</h1>
				<dl  class="dl_coo">
					<dt>Pharmaceutical</dt>
					<dd>
						<ul>
							<li>Direct Sales</li>
							<li>Wholesales</li>
							<li>Biz Development</li>
							<li>Marketing</li>
							<li>Sales Planing</li>
						</ul>
					</dd>
				</dl>
				<dl  class="dl_coo">
					<dt>Animal Health & <br> Nutrition</dt>
					<dd>
						<ul>
							<li>Sales</li>
							<li>Marketing</li>
							<li>Product Development</li>
							<li>Sales Support</li>
						</ul>
					</dd>
				</dl>
				<dl  class="dl_coo">
					<dt>Bioprocess</dt>
					<dd>
						<ul>
							<li>Ssales</li>
							<li>Sales Support</li>
						</ul>
					</dd>
				</dl>
				<dl  class="dl_coo">
					<dt>International<br>Sales </dt>
					<dd>
						<ul>
							<li>International Sales</li>
						</ul>
					</dd>
				</dl>	
				<dl  class="dl_coo">
					<dt>Production</dt>
					<dd>
						<ul>
							<li>Medicine</li>
							<li>Animai Health</li>
							<li>Culture Media</li>
						</ul>
					</dd>
				</dl>

				<h1 class="tit_cto">CTO</h1>	
				<dl  class="dl_cto">
					<dt>R&D Center</dt>
					<dd>
						<ul>
							<li>R&D </li>
						</ul>
					</dd>
				</dl>							
			</div>	
		</section> 
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	 <script src="<%=GetRoot() %>/en/common/include/footer.js" ></script> 

</asp:Content>
