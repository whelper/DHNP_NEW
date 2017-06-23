<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="product_list.aspx.cs" Inherits="HomePage.pr.product_list" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section class="sub_content" >
			<h1 class="pageTitle"> 신제품    </h1>
			<p class="location">
				<span> <img src="../../common/images/common/i_home.png" alt="home">  </span>
				<span> 홍보  </span>   <em> > </em>
				<strong> 신제품  </strong>
			</p>
			<!--  내용  ***************** -->
			<table class="table_list" border="1">
				<caption class="hidden"> 신제품 리스트   </caption>
				<colgroup>
					<col style="width:10%">
					<col >
					<col style="width:10%">
					<col style="width:15%">
					<col style="width:10%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호 </th>
						<th scope="col">제목</th>
						<th scope="col">작성자 </th>
						<th scope="col">등록일  </th>
						<th scope="col">조회수  </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td scope="row" > 9999 </td>
						<td><a href="product_view.html"> <i class="new"> NEW </i>  대한뉴팜㈜, 3분기 성장 지속 </a> </td>
						<td> 관리자  </td>
						<td> 2014/02/21 </td>
						<td> 9357 </td>
					</tr>
					<tr>
						<td scope="row" > 9999 </td>
						<td><a href="product_view.html"> <i class="new"> NEW </i> 쿠울펜정(아세트아미노펜)-허가변경 지시내용(효능효과,용법용량효능효과,용법용량효능효과,용법용량</a></td>
						<td> 관리자  </td>
						<td> 2014/02/21 </td>
						<td> 9357 </td>
					</tr>
					<tr>
						<td scope="row" > 9999 </td>
						<td><a href="product_view.html"> 메가백정 400밀리그램-허가사항변경(용법용량)</a></td>
						<td> 관리자  </td>
						<td> 2014/02/21 </td>
						<td> 9357 </td>
					</tr>
					<tr>
						<td scope="row" > 9999 </td>
						<td><a href="product_view.html"> 메가백정 400밀리그램-허가사항변경(용법용량)</a></td>
						<td> 관리자  </td>
						<td> 2014/02/21 </td>
						<td> 9357 </td>
					</tr>	
					<tr>
						<td scope="row" > 9999 </td>
						<td><a href="product_view.html"> 메가백정 400밀리그램-허가사항변경(용법용량)</a></td>
						<td> 관리자  </td>
						<td> 2014/02/21 </td>
						<td> 9357 </td>
					</tr>
					<tr>
						<td scope="row" > 9999 </td>
						<td><a href="product_view.html"> 메가백정 400밀리그램-허가사항변경(용법용량)</a></td>
						<td> 관리자  </td>
						<td> 2014/02/21 </td>
						<td> 9357 </td>
					</tr>
					<tr>
						<td scope="row" > 9999 </td>
						<td><a href="product_view.html"> 메가백정 400밀리그램-허가사항변경(용법용량)</a></td>
						<td> 관리자  </td>
						<td> 2014/02/21 </td>
						<td> 9357 </td>
					</tr>
					<tr>
						<td scope="row" > 9999 </td>
						<td><a href="product_view.html"> 메가백정 400밀리그램-허가사항변경(용법용량)</a></td>
						<td> 관리자  </td>
						<td> 2014/02/21 </td>
						<td> 9357 </td>
					</tr>
					<tr>
						<td scope="row" > 9999 </td>
						<td><a href="product_view.html"> 메가백정 400밀리그램-허가사항변경(용법용량)</a></td>
						<td> 관리자  </td>
						<td> 2014/02/21 </td>
						<td> 9357 </td>
					</tr>
					<tr>
						<td scope="row" > 9999 </td>
						<td><a href="product_view.html"> 메가백정 400밀리그램-허가사항변경(용법용량)</a></td>
						<td> 관리자  </td>
						<td> 2014/02/21 </td>
						<td> 9357 </td>
					</tr>
					<tr>
						<td scope="row" > 9999 </td>
						<td><a href="product_view.html"> 메가백정 400밀리그램-허가사항변경(용법용량)</a></td>
						<td> 관리자  </td>
						<td> 2014/02/21 </td>
						<td> 9357 </td>
					</tr>
					<tr>
						<td scope="row" > 9999 </td>
						<td><a href="product_view.html"> 메가백정 400밀리그램-허가사항변경(용법용량)</a></td>
						<td> 관리자  </td>
						<td> 2014/02/21 </td>
						<td> 9357 </td>
					</tr>
					<!-- 내용이 없을 경우  -->
					<tr >
						<td colspan="5" class="no_data"> 
							<p > 내용이 없습니다. </p> 
						</td>
					</tr>
					<!-- // 내용이 없을 경우  -->				
				</tbody>
			</table>

			<div class="page_Num"> 
				<strong class="first"> <a href="#" > first  </a></strong>
				<strong class="prev"> <a href="#"> prev  </a></strong>
				<a href="#"> 1 </a> 
				<a href="#"> 2 </a>
				<a href="#" class="onhover"> 3 </a>
				<a href="#"> 4 </a>
				<a href="#"> 5 </a>
				<strong class="next"> <a href="#"> next  </a></strong>
				<strong class="last">  <a href="#"> last </a></strong>
			</div><!--// page_Num -->
			
			<form title=" 검색하기 " >
				<p class="search_center">
					<label  for="f_01" class="acc-hidden"> 검색하기 </label>
					<select class="list" id="f_01" >
						<option selected="selected" > 제목 </option>
						<option> 제목 + 내용</option>
					</select>
					<input type="search" class="list" > 
					<button type="submit" class="btn_search small fB"> Search  </button>
				<p>
			</form>
			<!-- // 내용 ***************** -->         
		</section>  <!--// sub_content -->

</asp:Content>
