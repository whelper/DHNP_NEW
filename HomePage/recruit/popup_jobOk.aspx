<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="popup_jobOk.aspx.cs" Inherits="HomePage.recruit.popup_jobOk" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section class="ajax_section" >
	<h1 class="acc-hidden"> 입사지원 완료   </h1>
	<div class="lineBox_1">
		<p class="job_ok_neme">
			<strong class="i_my"> 김대한  </strong> 님의  입사지원이 완료되었습니다. 
		</p>
	</div> 

	<button type="button" onclick="ajaxPopupClose(); return false;" class="button green w310" > 확인</button>
</section> 

</asp:Content>