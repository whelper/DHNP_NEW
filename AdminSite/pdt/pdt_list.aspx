
<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" EnableEventValidation="false" AutoEventWireup="true"  CodeBehind="pdt_list.aspx.cs" Inherits="AdminSite.pdt.pdt_human_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
	
	
	<div id="page-heading">
		<%if (! _category_name.Equals("")){ %>
		<h1><%=_category_name %></h1>
		<%}else{ %>
		미분류
		<%} %>
	</div>
	

	<div class="wrap_box">
        <%if (! _category_name.Equals("")){ %>
		<ul class="list_tab  clearfix target" >
		    <li class="tab_on"><a href="pdt_list.aspx?category=<%=_category %>"><%=_category_name %></a></li>
		    <li><a href="pdt_cha_info_list.aspx?category=<%=_category %>">제품변경정보</a></li>
            <li><a href="pdt_catalog_list.aspx?category=<%=_category %>">대표카탈로그</a></li>
	    </ul>    
		<%} %>
		<table class="table_search">
			<colgroup>
				<col width="10%">
				<col width="34%">
				<col width="10%">
				<col width="34%">
				<col>
			</colgroup>
			<tbody>
				<tr> 
					<th><label for="pdt_name">제품명</label></th>   
					<td><input  type="text" id="prod_nm" runat="server" class="span4 text" placeholder="제품명을  입력해 주세요 " /></td> 
					<th><label for="pdt_select">분류선택</label></th>       
					<td>
                        <asp:DropDownList ID="catg_no2" name="catg_no2" runat="server" AutoPostBack="false" style="width:180px" />
						<asp:DropDownList ID="catg_no3" name="catg_no3" runat="server" AutoPostBack="false" style="width:180px" />
					</td>
					<td rowspan="2" class=" aligncenter">
                        <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn s_search" OnClientClick="return sch();" Text="검색" />
					</td>
				</tr> 
				<tr> 
					<th>
						<label for="pdt_code"> 제품코드 </label>  
					</th>   
					<td>  
						<input id="prod_cd" runat="server" type="text" class="span4 text" placeholder="제품코드을  입력해 주세요" /> 
					</td>
					<th> 
						<label for="pdt_all">제품유형</label>      
					</th>       
					<td>        
						<label for="pdt_all"><input type="radio" runat="server" id="pdt_all" name="pdt_style" class="inline" value="" />전체</label>&nbsp;
						<label for="pdt_new"><input type="radio" runat="server" id="pdt_new" name="pdt_style" class="inline" value="PROD_NEW" />신제품</label>&nbsp;
						<label for="pdt_old"><input type="radio" runat="server" id="pdt_old" name="pdt_style" class="inline" value="PROD_ORG" />기존제품</label>&nbsp;
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
					<td class="alignleft" ><a href="pdt_detail.aspx?prod_cd=<%=GetData(i, "PROD_CD")%>&category=<%=_category %>&page_no=<%=nowPageNo.Value%>"><%=GetData(i, "PROD_NM")%></a> </td>
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
				<a href="./pdt_detail.aspx?category=<%=_category %>"><span class="btn btn-ok">등록</span></a>
			</div>
		</div>

		<asp:HiddenField ID="catg" runat="server" Value="" />
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

		function sch() {
			var catg = ($("#<%=catg_no3.ClientID%>").val()) ? $("#<%=catg_no3.ClientID%>").val() : $("#<%=catg_no2.ClientID%>").val();
			$("#<%=catg.ClientID%>").val(catg);
			$("#<%= nowPageNo.ClientID%>").val(1);
			document.forms[0].submit();
		}

		function getCategory(c) {
			var c = (typeof (c) != "undefined") ? c : $("#<%=catg_no2.ClientID%>").val();
			var c1 = "<%=_catg%>";
			if (!c) return;
			$.ajax({
				type: "GET",
				url: "/ws/common.asmx/GetChildCategory",
				data: "lang_cd=KOR&category=" + c,
				success: function (data) {
					$xml = $(data);
					var cate_cd = "";
					var cate_name = "";
					$xml.find("Category").each(function (i) {
						cate_cd = $xml.find("CATE_CD").eq(i).text();
						cate_name = $xml.find("CATE_NAME").eq(i).text();
						$("#<%=catg_no3.ClientID%>").get(0).options[i + 1] = new Option(cate_name, cate_cd);
						if (c1 == cate_cd) $("#<%=catg_no3.ClientID%>").get(0).selectedIndex = i+1;
					});

				},
				error: function (error) { alert('에러'); }
			});	
		}


		$("#<%=catg_no2.ClientID%>").change(function () {
			getCategory();
		}).filter(function () {
			var c = $("#<%=catg_no2.ClientID%>").val();
			getCategory(c);
		});
    </script>
</asp:Content>