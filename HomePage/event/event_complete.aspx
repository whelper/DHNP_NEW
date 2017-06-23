<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="event_complete.aspx.cs" Inherits="HomePage.evt.event_complete" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceLayer" runat="server">

<div class="container clear">
		<section class="sub_content event_content">
			<header>
				<h1 class="pageTitle"> 이벤트    </h1>
				<p class="location">
					<span> <img src="../../common/images/common/i_home.png" alt="home">  </span>
					<strong> 이벤트  </strong>
				</p>
			</header>
			<table class="table_view">				
				<colgroup>
					<col style="width:13%">
					<col style="width:11%">
					<col style="width:12%">
					<col>
					<col style="width:13%">
					<col style="width:13%">
					<col style="width:12%">
					<col>
				</colgroup>
				<thead class="event_header">

				</thead>
				<tbody>
				<tr>
					<td colspan="8">
						<div class="view_adit">
							<p class="img_center"><img src="../../common/images/event_complete.png" alt="이벤트 신청이 완료 되었습니다. 참여해 주셔서 감사합니다."></p>
							<div class="center">
								<a href="/index.aspx" class="button next">홈으로</a>
							</div>
						</div>
						<!-- // view_adit -->
					</td>
				</tr>
				</tbody>
			</table>
		</section>  <!--// sub_content -->
	</div>

</asp:Content>

