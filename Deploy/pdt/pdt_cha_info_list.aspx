<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="pdt_cha_info_list.aspx.cs" Inherits="AdminSite.pdt.pdt_cha_info_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

    <!-- CONTENT -->
    <div id="content-outer">
    <div id="content">
	
	    <div id="page-heading">
		    <h1>제품변경정보</h1>
	    </div>

	    <div class="wrap_box">
            <ul class="list_tab  clearfix target" >
		        <li><a href="pdt_human_list.aspx">인체의약품</a></li>
		        <li class="tab_on"><a href="pdt_cha_info_list.aspx">제품변경정보</a></li>
                <li><a href="pdt_catalog_list.aspx?upr_catg_no=1">대표카탈로그</a></li>
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
					    <th><label for="pdt_name">제목</label></th>   
					    <td><input  type="text" id="title" class="span4 text" runat="server"/></td>  
					    <th><label for="datepicker">등록일</label>  </th>   
					    <td>
                            <input type="hidden" id="start_date" runat="server" />
						    <input type="text" name="start_date" title="특정 기간 시작 날짜" class="date_in" id="datepicker" onchange="javascript:start_date_ch(this.value);" /> 
						    ~ 
                            <input type="hidden" id="end_date" runat="server" />
						    <input type="text" name="end_date" title="특정 기간 종료 날짜" class="date_in" id="datepicker2" onchange="javascript:end_date_ch(this.value);" />
					    </td>
					    <td class=" aligncenter">
						    <asp:LinkButton ID="btn_global_Search" runat="server" onClick="btnSearch_Click">
					            <span class="btn s_search">검색</span>
                            </asp:LinkButton>
					    </td>
				    </tr> 
			    </tbody>
		    </table>
	
		<table cellpadding="0" cellspacing="0" border="0" class="table_new">
			<thead>
				<tr> 
					<th width="10%">번호</th>
					<th>제목</th>
					<th width="10%">작성자</th>
					<th width="15%">등록일</th>
                    <th width="10%">조회수</th>
				</tr>
			</thead>
			<tbody>
                <%
                    int total = DataTotalCount;
                    
	                if (GetRowCount() > 0)
	                {
		                for (int i = 0; i < GetRowCount(); i++)
		                {
                %>
				<tr>
                    <td><%=GetBoardNum(i, Convert.ToInt32(nowPageNo.Value), 10)%></td>
					<td class="alignleft" ><% if (GetData(i, "NEW_YN") == "Y") {%><i class="new"> NEW </i><%} %><a href="./pdt_cha_info_detail.aspx?seq_no=<%=GetData(i, "SEQ_NO")%>"><%=GetData(i, "TTL", 100)%></a></td>
					<td><%=GetData(i, "WRITER_NM")%></td>
					<td><%=GetData(i, "REG_DATE")%></td>
                    <td><%=GetData(i, "HIT_CNT")%></td>
				</tr>
                <% 
		                }
	                }
	                else
	                {
                %>
                <!-- 내용이 없을 경우  -->
                <tr >
	                <td colspan="5" class="no_data"> 
		                <p >내용이 없습니다.</p> 
	                </td>
                </tr>
                <% 
	                }
                %>
                <!-- // 내용이 없을 경우  -->
			</tbody>
		</table>
		<div class="btn_area clearfix">
			<div class="f_right">
				<a href="./pdt_cha_info_detail.aspx"><span class="btn btn-ok">등록</span></a>
			</div>
		</div>
            
        <asp:HiddenField ID="nowPageNo" runat="server"  Value="1" onvaluechanged="nowPageNo_ValueChanged"/>
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

    function start_date_ch(date) {

        document.getElementById('<%= start_date.ClientID %>').value = date;

    }

    function end_date_ch(date) {

        document.getElementById('<%= end_date.ClientID %>').value = date;

    }
</script>

</asp:Content>