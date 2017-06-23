<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="event_view.aspx.cs" Inherits="HomePage.evt.event_view" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceLayer" runat="server">

<div class="container clear">
<section class="sub_content event_content">
	<h1 class="pageTitle"> 이벤트    </h1>
	<p class="location">
		<span> <img src="../../common/images/common/i_home.png" alt="home">  </span>
		<strong> 이벤트  </strong>
	</p>
	<!--  내용  ***************** -->
	<table class="table_view">
		<caption class="hidden"> <%=GetData(0, "EVT_TTL")%>   </caption>
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
			<tr>
				<th scope="row" colspan="8"> 
                    <% if (GetData(0, "STATUS_EVT") == "R") { %>
                        <span>이벤트 예정</span>
                    <% } else if (GetData(0, "STATUS_EVT") == "E") {%>
                        <span>이벤트 종료</span>
                    <% } %>
                    <strong> <%=GetData(0, "EVT_TTL")%></strong> 
                </th>
			</tr>
			<tr>
				<td colspan="8"> <span>이벤트 기간 : <%=GetData(0, "START_DATE")%> ~ <%=GetData(0, "END_DATE")%></span></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="8">
					<div class="view_adit">
                        <% foreach (string item in GetData(0, "CONT_T").Split(new string[] { Environment.NewLine }, StringSplitOptions.None)) { %>
							<p><%=item%></p>
                        <% } %>

                        <% if ("".Equals(GetData(0, "IMG_TITLE")) == false){%>
						    <p><br></p>
						    <p class="img_center">&nbsp;<img src="<%=GetData(0, "IMG_TITLE")%>"><br style="clear:both;"></p>
                        <% } %>
						<!--s 추가 -->
						<div class="event_write">

							<table>
								<colgroup>
									<col>
									<col style="width: 80%">
								</colgroup>
								<tbody>
                                
                                <% int item_idx = 0;  %>
                                <% if (GetData(0, "STATUS_EVT") == "R") { %>
                                     <% foreach (string item in GetData(0, "ITEMS").Split(new string[] { Environment.NewLine }, StringSplitOptions.None)) { %>
                                    <tr>
									    <th><%=item%></th>
									    <% if (item_idx == 0) { %><td rowspan="7" class="center" style="font-size:2em">이벤트 예정입니다.</td> <% } %>
								    </tr>

                                     <% ++item_idx;  %>
                                     <% } %>
                                <% } else if (GetData(0, "STATUS_EVT") == "E") {%>
                                     <% foreach (string item in GetData(0, "ITEMS").Split(new string[] { Environment.NewLine }, StringSplitOptions.None)) { %>
                                    <tr>
									    <th><%=item%></th>
                                        <% if (item_idx == 0) { %><td rowspan="7" class="center" style="font-size:2em">이벤트가 종료되었습니다.</td> <% } %>									    
								    </tr>
                                     <% ++item_idx;  %>
                                     <% } %>
                                <% } else {%>
                                     <% foreach (string item in GetData(0, "ITEMS").Split(new string[] { Environment.NewLine }, StringSplitOptions.None)) { %>
                                    <tr>
									    <th><%=item%></th>
									    <td>
										    <label>
											    <input type="text" id="item_<%=item_idx%>" name="item_<%=item_idx%>">
										    </label>
									    </td>
								    </tr>
                                     <% ++item_idx;  %>
                                     <% } %>
                                <% } %>
								
							</tbody></table>

                            <% if (GetData(0, "STATUS_EVT") == "Y") { %>
							<div class="center">								
                                <asp:LinkButton ID="btnSave" runat="server" OnClientClick="return CheckValid();" class="button next " onclick="btnSave_Click">신청</asp:LinkButton>
							</div>
                            <% } %>
						</div>

						<div class="event_info">
                        
                        <% foreach (string item in GetData(0, "CONT_B").Split(new string[] { Environment.NewLine }, StringSplitOptions.None))
                           { %>
							<p><%=item%></p>
                        <% } %>
							
						</div>
						<!--e 추가 -->
					</div>
					<!-- // view_adit -->
				</td>
			</tr>
		</tbody>
	</table>
	<!--<p class="listview_btns">
		<button type="button"  class="btn_view_prev"> 이전글  </button>
		<button type="button"  class="btn_view_next"> 다음글  </button>
		<button type="button" onclick="javascript:history.back();" class="btn_view_list">목록보기 </button>
	</p>-->
	<!-- // 내용 ***************** -->         
</section>  <!--// sub_content -->
</div>

<form>
    <input type="hidden" id="EE_SEQ_NO" name="EE_SEQ_NO" value="<%=GetData(0, "SEQ_NO")%>">
    <input type="hidden" id="EVT_TTL" name="EVT_TTL" value="<%=GetData(0, "EVT_TTL")%>">
    <input type="hidden" id="CONT_Q" name="CONT_Q">
    <input type="hidden" id="CONT_A" name="CONT_A">
</form>

<script language="javascript" type="text/javascript">
    function CheckValid() {
        
        var cont_q = '';
        var cont_a = '';

        <% int cont_a_idx = 0; %>
        <% foreach (string item in GetData(0, "ITEMS").Split(new string[] { Environment.NewLine }, StringSplitOptions.None)) { %>
        if ($("#item_<%=cont_a_idx%>").val() == "") {
            alert('<%=item%> 항목을 입력해주세요');
            return false;
        } else {            
            <% if((cont_a_idx + 1) == item_idx){ %>
                cont_q = cont_q + '<%=item%>';
                cont_a = cont_a + $("#item_<%=cont_a_idx%>").val();            
            <% }else{ %>
                cont_q = cont_q + '<%=item%>|';
                cont_a = cont_a + $("#item_<%=cont_a_idx%>").val() + '|';            
            <% } %>     
        }
        <% ++cont_a_idx;  %>
        <% } %>

        $("#CONT_Q").val(cont_q);
        $("#CONT_A").val(cont_a);
    }
</script>

</asp:Content>

