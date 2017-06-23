<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="notice_list.aspx.cs" Inherits="HomePage.pr.notice_list" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content" >
	<header>
		<h1 class="pageTitle">공시자료</h1>
		<p class="location">
			<a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
			<a href="/pr/news_list.aspx"><span>홍보</span></a><em> > </em>
			<a href="/pr/notice_list.aspx"><strong>공시자료</strong></a>
		</p>
	</header>
	<iframe src="http://dart.fss.or.kr/html/search/SearchCompanyIR3_M.html?textCrpNM=054670" name="IR" scrolling="yes" frameborder="0"
  width="750" height="750" marginheight="0" marginwidth="0" title="Dart 공시자료"></iframe>

</section>  <!--// sub_content -->

</asp:Content>