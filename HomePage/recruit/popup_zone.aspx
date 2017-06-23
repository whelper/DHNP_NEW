<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="popup_zone.aspx.cs" Inherits="HomePage.recruit.popup_zone" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section class="ajax_section " >
	<h1 class="popup_title_01"> 우편번호 검색 </h1>
	<div class="lineBox clear">
		<div class="zone_search">
			<label for="nameZ_01" >지역명</label>
			<input type="text" id="nameZ_01" placeholder="학동 " >
			<button type="button" class="button blue w100" onclick="ajaxPopupClose(); return false;"> 검색</button>
		</div>
	</div>  <!-- //  ajax_lineBox -->
	<div class="mB20">
		<table class=" table_scroll_box scrollTable">
			<colgroup>
				<col style="width:115px;" >
				<col>
			</colgroup>
			<thead>
				<th> 우편번호 검색 </th> 
				<th> 주소 </th>
			</thead>
			<tbody>
				<tr>
				<td> 158 -200 </td>
				<td>11111 서울시 금천구 가산동 122- 52 </td>
				</tr>
				<tr>
				<td> 158 -200 </td>
				<td> 서울시 금천구 가산동 122- 52 </td>
				</tr>
				<tr>
				<td> 158 -200 </td>
				<td> 서울시 금천구 가산동 122- 52 </td>
				</tr>
				<tr>
				<td> 158 -200 </td>
				<td> 서울시 금천구 가산동 122- 52 </td>
				</tr>
				<tr>
				<td> 158 -200 </td>
				<td> 서울시 금천구 가산동 122- 52 </td>
				</tr>
				<tr>
				<td> 158 -200 </td>
				<td> 서울시 금천구 가산동 122- 52 </td>
				</tr>
				<tr>
				<td> 158 -200 </td>
				<td> 서울시 금천구 가산동 122- 52 </td>
				</tr>
				<tr>
				<td> 158 -200 </td>
				<td> 서울시 금천구 가산동 122- 52 </td>
				</tr>
				<tr>
				<td> 158 -200 </td>
				<td> 서울시 금천구 가산동 122- 52 </td>
				</tr>
				<tr>
				<td> 158 -200 </td>
				<td> 서울시 </td>
				<tr>
				<td> 158 -200 </td>
				<td> 서울시 금천구 가산동 122- 52 </td>
				</tr>
				<tr>
				<td> 158 -200 </td>
				<td> 서울시 금천구 가산동 122- 52 </td>
				</tr>
				<tr>
				<td> 158 -200 </td>
				<td> 서울시 금천구 가산동 122- 52 </td>
				</tr>
				<tr>
				<td> 158 -200 </td>
				<td> 서울시 금천구 가산동 122- 52  </td>
				</tr>
				<tr>
				<td> 158 -200 </td>
				<td> 서울시 </td>
				</tr>
			</tbody>
		</table>
	</div>



	<!-- 	<button type="button" onclick="ajaxPopupClose(); return false;" class="button gray mR4" ><span>닫기</span></button> -->
	<button type="button" onclick="ajaxPopupClose(); return false;" class="button green w310"  > 확인 </button>
</section>

</asp:Content>