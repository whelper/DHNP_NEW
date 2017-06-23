<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="new_person.aspx.cs" Inherits="HomePage.recruit.new_person" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

	<section id="content" class="sub_content" >
		<header>
			<h1 class="pageTitle line"> 인재상  </h1>
			<p class="location">
				<a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
                <a href="/recruit/new_person.aspx"><span>채용</span></a><em> > </em>
			    <a href="/recruit/new_person.aspx"><span>대한뉴팜인</span></a><em> > </em>
				<a href="/recruit/new_person.aspx"<strong>  인재상  </strong></a>
			</p>
		</header>
		<!--  내용  ***************** -->
			<img src="/common/images/sub/recruit_new_01.png" alt="">
			<div class="acc-hidden">
			<h2>대한뉴팜 인재상</h2>
			<p>대한뉴팜은 다음과 같은 인재를 소중히 여깁니다.</p>
			<dl>
			 	<dt>기본과 원칙</dt>
			 	<dd>기본과 원칙을 지키는 인재</dd>
			 	<dt>목표와 전략</dt>
			 	<dd>목표와 전략을 달성하는 인재</dd>
			 	<dt>창의, 합리</dt>
			 	<dd>창의적이고 합리적인 인재</dd>
			 	<dt>긍정,열정</dt>
			 	<dd>긍정적이고 열정적인 인재</dd>
			</dl>
			</div>
		<!-- // 내용 ***************** -->     
	</section>  <!--// sub_content -->

</asp:Content>
