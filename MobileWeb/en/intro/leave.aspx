<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="leave.aspx.cs" Inherits="MobileWeb.en.intro.leave" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	<header class="header">
		<script src="<%=GetRoot() %>/en/common/include/header.js" ></script> 	
		<h1 class="acc-hidden">History</h1>	
		<p class="location">
			<span>Company</span><em> > </em>
			<strong>History</strong>
		</p>
	</header>

	<!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/en/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="acc-hidden">History</h1>	
		<ul class="tap_3depth tap_4">
			<li> <button type="button" onclick="Content_tap(1);" class="tap_01 onhover">2010s</button></li>
			<li> <button type="button" onclick="Content_tap(2);" class="tap_02">2000s</button> </li>
			<li> <button type="button" onclick="Content_tap(3);" class="tap_03">1990s</button> </li>
			<li> <button type="button" onclick="Content_tap(4);" class="tap_04">1980s</button> </li>
		</ul>
		<!--   content -->
		<section class="content">	
			<div class="leave content_01">
				<h2 class="title_big">Strategic Innovation</h2>
				<div class="list pT18">
					<h3>2014</h3>
					<dl>
						<dt>04/02</dt>
						<dd>Completion of cell culture media manufacturing facility</dd>
						<dt>03/21</dt>
						<dd>Launching medical device business</dd>
					</dl>	
				</div>
				<div class="list">
					<h3> 2013 </h3>
					<dl>
						<dt>01/21</dt>
						<dd>Signed on the Technical Tie up Agreement with CSTI Co.</dd>
						<dt>01/21</dt>
						<dd>Signed on the Culture Media Manufacturing Technology Transfer Contact with Ragass Japan Co.</dd>
					</dl>
				</div>
				<div class="list">
					<h3>2012</h3>
					<dl>
						<dt>11/02</dt>
						<dd>Signed on the Agreement of Sales Agent for Protein A with GenScript Co. Pharmawin Japan, and Itochu Shanghai Ltd</dd>
						<dt>07/13</dt>
						<dd>Launching a new medicine, glutathione injection</dd>
					</dl>
				</div>
				<div class="list">
					<h3>2011</h3>
					<dl>
						<dt>05/01</dt>
						<dd>Organization structure and sales channel renovation</dd>
						<dt>03/01</dt>
						<dd>Focus on well-being beauty product portfolio</dd>
						<dt>01/01</dt>
						<dd>Declaration of “Start-up Daehan New Pharm”</dd>
					</dl>
				</div>

			</div>	
			<div class="leave content_02" style="display:none;">
				<h3 class="title_big">Business Diversification</h3>
				<div class="list pT18">
					<h3>2007 </h3>
					<dl>
						<dt>11/30</dt>
						<dd>Received award of achieving USD 5M export</dd>
						<dt>06/29</dt>
						<dd>Acquired 17% interests of Baverstock GmbH</dd> 
						<dt>05/29</dt>
						<dd>Added a new business purpose, international oil investment business</dd>
					</dl>
				</div>
				<div class="list">
					<h3>2004 </h3>
					<dl>
						<dt>10/14</dt>
						<dd>Authorized by KGSP</dd> 
					</dl>
				</div>
				<div class="list">
					<h3>2002 </h3>
					<dl>
						<dt>12/31</dt>
						<dd>Commendation from Ministry of Agriculture, Food and Rural Affair</dd> 
						<dt>07/26</dt>
						<dd>Appointed as a promising export company by Seoul Regional Office Small & Medium Business Administration</dd> 
						<dt>02/26</dt>
						<dd>Listed in KOSDAQ</dd> 
					</dl>
				</div>
				<div class="list">
					<h3>2001 </h3>
					<dl>
						<dt>12/05</dt>
						<dd>Received the KVGMP license</dd> 
						<dt>06/16</dt>
						<dd>Establishing R&D center</dd> 
						<dt>04/09</dt>
						<dd>Change company name to Daehan New Pharm Co. Ltd.</dd> 
					</dl>
				</div>
				<div class="list">
					<h3>2000 </h3>
					<dl>
						<dt>04/24</dt>
						<dd>Received the KGMP license for injection manufacturing line</dd> 
					</dl>
				</div>
			</div>		

			<div class="leave content_03" style="display:none;">
				<h3 class="title_big">Business Expansion</h3>
				<div class="list pT18">
					<h3>1996 </h3>
					<dl>
						<dt>03/20</dt>
						<dd>Received the KGMP for tablet manufacturing line</dd>
					</dl>
				</div>
				<div class="list">
					<h3>1994</h3>
					<dl>
						<dt>06/29</dt>
						<dd>Set up pharmaceutical manufacturing facility at Hyangnam Pharmaceutical Complex</dd>
					</dl>	
				</div>
			</div>	

			<div class="leave content_04" style="display:none;">
				<h3 class="title_big">Building Business Infra</h3>
				<div class="list pT18">
					<h3>1988</h3>
					<dl>
						<dt>08/07 </dt>
						<dd>Received an import and export license for animal drug</dd>
					</dl>	
				</div>
				<div class="list">
					<h3>1987</h3>
					<dl>
						<dt>07/28</dt>
						<dd>Received an international trading license</dd> 
					</dl>
				</div>	
				<div class="list">
					<h3>1984</h3>
					<dl>
						<dt>12/20</dt>
						<dd>Animal drug manufacturing approval from Ministry of Agriculture, Food and Rural Affairs</dd> 
						<dt>10/27</dt>
						<dd>Obtained the patent for mineral block manufacturing method</dd> 
						<dt>10/25</dt>
						<dd>Received the license for animal fee manufacturing</dd> 
						<dt>10/20</dt>
						<dd>Established Daehan Shin Yak Co.</dd> 
					</dl>
				</div>
			</div>	
		</section> 
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	 <script src="<%=GetRoot() %>/en/common/include/footer.js" ></script> 

</asp:Content>
