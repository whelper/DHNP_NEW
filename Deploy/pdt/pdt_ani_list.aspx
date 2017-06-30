<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="pdt_ani_list.aspx.cs" Inherits="AdminSite.pdt.pdt_ani_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
	
	<div id="page-heading">
		<h1>동물 의약품</h1>
	</div>

	<div class="wrap_box">
        <ul class="list_tab  clearfix target" >
		    <li class="tab_on"><a href="pdt_ani_list.aspx">동물의약품</a></li>
            <li><a href="pdt_catalog_list.aspx?upr_catg_no=2">대표카탈로그</a></li>
	    </ul>
		<table class="table_search">
			<colgroup>
				<col width="10%" />
				<col width="34%" />
				<col width="10%" />
				<col width="34%" />
				<col />
			</colgroup>
			<tbody>
				<tr> 
					<th><label for="pdt_name">제품명</label></th>   
					<td><input  type="text" id="prod_nm" runat="server" class="span4 text" placeholder="제품명을 입력해 주세요." /></td> 
					<th><label for="pdt_select">분류선택</label></th>
					<td>
						<asp:DropDownList ID="catg_no2" runat="server" AutoPostBack="false" />
					</td>
					<td rowspan="2" class=" aligncenter">
                        <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn s_search" onclick="btnSearch_Click" Text="검색" />
					</td>
				</tr> 
				<tr> 
					<th>
						<label for="pdt_code">제품코드</label>  
					</th>   
					<td>  
						<input type="text" id="prod_cd" runat="server" class="span4 text" placeholder="제품코드을 입력해 주세요 " /> 
					</td> 
					<th> 
						<label for="pdt_all">제품유형</label>      
					</th>  
					<td>        
						<label for="pdt_all"><input type="radio" runat="server" id="pdt_all" name="pdt_style" class="inline" value="" />전체</label>&nbsp;
						<label for="pdt_new"><input type="radio" runat="server" id="pdt_new" name="pdt_style" class="inline" value="PROD_NEW" />신제품</label>&nbsp;
						<label for="pdt_old"><input type="radio" runat="server" id="pdt_org" name="pdt_style" class="inline" value="PROD_ORG" />기존제품</label>&nbsp;
						<label for="pdt_kwan"><input type="radio" runat="server" id="pdt_godl" name="pdt_style" class="inline" value="PROD_GODL" />관납제품</label>&nbsp;
					</td> 
				</tr> 
			</tbody>
		</table>
	
		<table cellpadding="0" cellspacing="0" border="0" class="table_new">
			<thead>
				<tr> 
					<th width="5%">번호</th>
					<th width="10%">제품코드</th>
					<th width="15%">제품유형</th>
					<th>제품명</th>
					<th width="15%">분류</th>
					<th width="10%">분류번호</th>
					<th width="10%">등록일</th>
				</tr>
			</thead>
			<tbody>
            <%
                int total = DataTotalCount;
                
                if (GetDataCount() > 0)
                {
                    for (int i = 0; i < GetDataCount(); i++)
                    {
            %>
				<tr>
					<td><%=GetBoardNum(i, Convert.ToInt32(nowPageNo.Value), 10)%></td>
					<td><%=GetData(i, "PROD_CD")%></td>
					<td><%=GetData(i, "PROD_TYPE_NM")%></td>
					<td class="alignleft" ><a href="pdt_ani_detail.aspx?prod_cd=<%=GetData(i, "PROD_CD")%>"><%=GetData(i, "PROD_NM")%></a> </td>
					<td><%=GetData(i, "CATG_NM2")%></td>
					<td><%=GetData(i, "CATG_NO")%></td>
					<td><%=GetData(i, "REG_DT")%></td>
				</tr>
            <%
                    }
                }
                else
                {
            %>
                <tr >
	                <td colspan="7" class="no_data"> 
		                <p>등록된 제품이 없습니다.</p>
	                </td>
                </tr>
            <%
                }
            %>
			</tbody>
		</table>
		<div class="btn_area clearfix">
			<div class="f_right">
				<a href="./pdt_ani_detail.aspx"><span class="btn btn-ok">등록</span></a>
			</div>
		</div>

		<asp:HiddenField ID="nowPageNo" runat="server" Value="1" onvaluechanged="nowPageNo_ValueChanged"/>
	    <%= AdminSite.page.paging.getPageNo(DataTotalCount, Convert.ToInt32(nowPageNo.Value), 10)%>

	</div><!--//  wrap_box -->
	
		
</div>
</div>
<!--//  CONTENT -->
    <script type="text/javascript" >
        function movePage(page_no) {
            document.getElementById('<%= nowPageNo.ClientID %>').value = page_no;
            document.forms[0].submit();
        }
    </script>
</asp:Content>
