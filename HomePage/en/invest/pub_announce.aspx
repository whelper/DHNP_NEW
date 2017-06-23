<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="pub_announce.aspx.cs" Inherits="HomePage.en.invest.pub_announce" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content" >
	<header>
		<h1 class="pageTitle">공시자료</h1>
		<p class="location">
			<a href="/en/index.aspx"><span><img src="/en/common/images/common/i_home.png" alt="home" /></span></a>
			<a href="/en/invest/ir_info_list.aspx"><span>투자</span></a><em> > </em>
			<a href="/en/invest/pub_announce.aspx"><strong>공시자료</strong></a>
		</p>
	</header>
	<iframe src="http://dart.fss.or.kr/html/search/SearchCompanyIR3_M.html?textCrpNM=054670" name="IR" scrolling="no" frameborder="0"
  width="750" height="750" marginheight="0" marginwidth="0" title="Dart 공시자료"></iframe>

</section>  <!--// sub_content -->

</asp:Content>