<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="product_view.aspx.cs" Inherits="HomePage.pr.product_view" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section class="sub_content" >
			<h1 class="pageTitle"> 신제품    </h1>
			<p class="location">
				<span> <img src="../../common/images/common/i_home.png" alt="home">  </span>
				<span> 홍보  </span>   <em> > </em>
				<strong> 신제품  </strong>
			</p>
			<!--  내용  ***************** -->
			<table class="table_view" >
				<caption class="hidden"> 신제품 상세보기   </caption>
				<colgroup>
					<col style="width:13%" >
					<col style="width:11%" >
					<col style="width:12%" >
					<col >
					<col style="width:13%" >
					<col style="width:13%" >
					<col style="width:12%" >
					<col >
				</colgroup>
				<thead>
					<tr>
						<th scope="row" colspan="1"> <span> 제목 </span> </th>
						<td colspan="7"> 대한뉴팜(주) 신제품 콕시멸-에스 기사-양계연구 </td>
					</tr>
					<tr>
						<th scope="col"> <span> 번호  </span></th>
						<td> 2143 </td>
						<th scope="col"> <span> 작성자  </span>  </th>
						<td> 관리자 </td>
						<th scope="col">  <span> 날짜   </span> </th>
						<td> 2014/01/21 </td>
						<th scope="col">  <span> 조회수    </span> </th>
						<td> 999</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td  colspan="8">
							<div  class="view_adit">
								<p>대한뉴팜(주) (대표이사 : 배건우)는 음수투약하는 콕시듐증 치료제 ‘콕시멸-에스’ 를 최근 출시, 판매한다. 
								신제품 ‘콕시멸-에스’의 주원료인 디클라주릴은 원충 생활사의 다양한 단계에서 광범위한 효과를 발휘하여 콕시듐
								증을 치료한다. ‘콕시멸-에스’는 기존의 디클라주릴 사료첨가제와 달리 음수투약함으로써 투여가 용이하며 효과가 
								신속하게 나타난다. 최근 경상대학교 수의과대학 동물의학연구소에서는 경남지역의 콕시듐증이 다발하는 육계 
								농장을 대상으로 ‘콕시멸-에스’의 임상시험을 진행한 결과, 대조군에 비해 ‘콕시멸-에스’를 투여하
								였을 때 닭의 폐사율이 현저하게 감소하는 경향을 보였다.
								</p>
								<p> 또한 분변의 설사지수와 부검시 장상해도 역시 감소하
								였다.  VT콕시듐증은 모든 조류에서 감수성이 있으나 특히 닭, 칠면조에서 발생이 심하여 양계산업에 있어서 경제적인 
								피해가 매우 큰 질병이다. 원충이 장관내에 기생하여 설사와 장염을 유발하며 특히 육계농장에서 연변, 설사 및 
								혈변으로 증체율 저하와 출하일령의 연장으로 이어진다
								</p>
							</div>	 
							<!-- // view_adit -->
						</td>
					</tr>
				</tbody>
			</table>
			<p class="listview_btns">
				<button type="button"  class="btn_view_prev"> 이전글  </button>
				<button type="button"  class="btn_view_next"> 다음글  </button>
				<button type="button" onclick="javascript:history.back();" class="btn_view_list">목록보기 </button>
			</p>
			<!-- // 내용 ***************** -->         
		</section>  <!--// sub_content -->

</asp:Content>
