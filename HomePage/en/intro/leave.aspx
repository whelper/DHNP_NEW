<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="leave.aspx.cs" Inherits="HomePage.en.intro.leave" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

    <section id="content" class="sub_content" >
			<header>
				<h1 class="pageTitle line"> History   </h1>
				<p class="location">
					<a href="/en/index.aspx"><span> <img src="/en/common/images/common/i_home.png" alt="home">  </span></a>
					<a href="/en/intro/vision.aspx"><span>Company</span></a>   <em> > </em>
					<a href="/en/intro/leave.aspx"><strong> History</strong></a>
				</p>
			</header>
			<!--  내용  ***************** -->
			<article class="tap_content_box">
				<h1 class="tap tap_01 onhover"  onclick="javascript:Content_tap(1)"><span>2010s </span> </h1>
				<div class ="leave content_01" >
					<img src="/en/common/images/sub/title_2010.gif" alt="전략적 이노베이션">
					<div class="list mT_20">
						<h2>2014</h2>
						<ul>
							<li><span>04/02</span>Completion of cell culture media manufacturing facility</li>
							<li><span>03/21</span>Launching medical device business</li>
						</ul>
					</div>
					<div class="list">
						<h2>2013</h2>
						<ul>
							<li><span>01/21</span>Signed on the Technical Tie up Agreement with CSTI Co.</li>
							<li><span>01/21</span>Signed on the Culture Media Manufacturing Technology Transfer Contact with Ragass Japan Co.</li>
						</ul>
					</div>
					<div class="list">
						<h2>2012</h2>
						<ul>
							<li><span>11/02</span>Signed on the Agreement of Sales Agent for Protein A with GenScript Co. Pharmawin Japan, and Itochu Shanghai Ltd</li>
							<li><span>07/13</span>Launching a new medicine, glutathione injection</li>
						</ul>
					</div>
					<div class="list">
						<h2>2011</h2>
						<ul>
							<li><span>05/01</span>Organization structure and sales channel renovation</li>
							<li><span>03/01</span>Focus on well-being beauty product portfolio</li>
							<li><span>01/01</span>Declaration of “Start-up Daehan New Pharm”</li>
						</ul>
					</div>
				</div>

				<h1 class="tap tap_02" onclick="javascript:Content_tap(2)"><span>2000s </span> </h1>
				<div class="leave content_02" style="display:none;">
					<img src="/en/common/images/sub/title_2000.gif" alt="사업 다각화">
					<div class="list mT_20">
						<h2 class="year green"> 2007</h2>
						<ul>
							<li><span>11/30</span>Received award of achieving USD 5M export </li>
							<li><span>06/29</span>Acquired 17% interests of Baverstock GmbH</li>
							<li><span>05/29</span>Added a new business purpose, international oil investment business </li>
						</ul>
					</div>
					<div class="list">
						<h2 class="year orange">2004</h2>
						<ul>
							<li><span>10/14</span>Authorized by KGSP</li>
						</ul>
					</div>
					<div class="list">
						<h2 class="year orange">2002</h2>
						<ul>
							<li><span>12/31</span>Commendation from Ministry of Agriculture, Food and Rural Affair</li>
							<li><span>07/26</span>Appointed as a promising export company by Seoul Regional Office Small & Medium Business Administration</li>
							<li><span>02/26</span>Listed in KOSDAQ</li>
						</ul>
					</div>
					<div class="list">
						<h2 class="year green">2001</h2>
						<ul>
							<li><span>12/05</span>Received the KVGMP license</li>
							<li><span>06/16</span>Establishing R&D center </li>
							<li><span>04/09</span>Change company name to Daehan New Pharm Co. Ltd. </li>
						</ul>
					</div>
					<div class="list">
						<h2 class="year orange">2000</h2>
						<ul>
							<li><span>04/24</span>Received the KGMP license for injection manufacturing line</li>
						</ul>
					</div>	
				</div>

				<h1 class="tap tap_03"  onclick="javascript:Content_tap(3)"><span>1990s </span> </h1>
				<div class="leave content_03" style="display:none;">
					<img src="/en/common/images/sub/title_1990.gif" alt="사업 확장">
					<div class="list mT_20">
						<h2 class="year orange">1996</h2>
						<ul>
							<li><span>03/20</span>Received the KGMP for tablet manufacturing line</li>
						</ul>
					</div>
					<div class="list">
						<h2 class="year green">1994</h2>
						<ul>
							<li><span>06/29</span> Set up pharmaceutical manufacturing facility at Hyangnam Pharmaceutical Complex</li>
						</ul>
					</div>	
				</div>

				<h1 class="tap tap_04"  onclick="javascript:Content_tap(4)"><span>1980s </span> </h1>
				<div class ="leave content_04"  style="display:none;">
					<img src="/en/common/images/sub/title_1980.gif" alt="사업 인프라 구축">
					<div class="list mT_20">
						<h2 class="year orange">1988</h2>
						<ul>
							<li><span>08/07</span>Received an import and export license for animal drug</li>
						</ul>
					</div>
					<div class="list">
						<h2 class="year green">1987</h2>
						<ul>
							<li><span>07/28 </span>Received an international trading license</li>
						</ul>	
					</div>
					<div class="list">
						<h2 class="year orange">1984</h2>
						<ul>
							<li><span>12/20</span>Animal drug manufacturing approval from Ministry of Agriculture, Food and Rural Affairs</li>
							<li><span>10/27</span>Obtained the patent for mineral block manufacturing method</li>
							<li><span>10/25</span>Received the license for animal fee manufacturing</li>
							<li><span>10/20</span>Established Daehan Shin Yak Co.</li>
						</ul>
					</div>	
				</div>
			</article>

			<!-- // 내용 ***************** -->         
		</section>  <!--// sub_content -->


</asp:Content>