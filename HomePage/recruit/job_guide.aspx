<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="job_guide.aspx.cs" Inherits="HomePage.recruit.job_guide" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content" >
			<header>
				<h1 class="pageTitle"> 채용절차  </h1>
				<p class="location">
					<a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
                    <a href="/recruit/new_person.aspx"><span>채용</span></a><em> > </em>
			        <a href="/recruit/job_notify_list.aspx"><span>상시채용</span></a><em> > </em>
			        <a href="/recruit/job_guide.aspx"><strong>채용절차</strong></a>
				</p>
			</header>
			<!--  내용  ***************** -->
			<img src="/common/images/sub/job_guide.jpg" alt="">
			<div class="acc-hidden">
				<h1> 인재채용 </h1>
				<h2> 대한 뉴팜의 인재채용은 다음과 같은 절차에 의해 진행됩니다.</h2>
				<ul>
					<li> 입사지원서 작성 </li>
					<li> 서류 전형  </li>
					<li> 면접일정 통보  </li>
					<li> 1차 실무진 면접  </li>
					<li> 입사완료  </li>
					<li> 입사일자 및 연봉 등 최종 확인  </li>
					<li> 최종합격 통보  </li>	
					<li> 2차 임원진 면접  </li>					
				</ul>
				<h3> 최종면접의 결과는 홈페이지 채용결과 확인을 통해 안내합니다.(최종합격자는 유선통보 병행)
						입사시 준비하여 제출할 서류는 다음과 같습니다. </h3>
				<ul>
					<li> 최종학력 성적(고졸자의 경우 생활기록부) 및 졸업증명서 사본 각 1부 </li>	
					<li> 전 직장 경력증명서 및 원천징수영수증(경력자 대상) 각 1부</li>
					<li> 자격증 사본 각 1부 </li>
					<li> 가족관계증명원 1부</li>
					<li> 주민등록등본 및 반명함판사진 각 3장</li>
				</ul>	
			</div>
			<!-- // 내용 ***************** -->         
		</section>  <!--// sub_content -->

</asp:Content>