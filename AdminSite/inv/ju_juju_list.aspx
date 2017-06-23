<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="ju_juju_list.aspx.cs" Inherits="AdminSite.inv.ju_juju_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
  
	<div id="page-heading">
		<h1> 주주구성 </h1>
	</div>

	<div class="wrap_box">
        * 선택삭제 또는 추가 후 반드시 하단의 저장 버튼을 눌러야 적용 됩니다.<br />
        * 영문 덮어쓰기는 국문탭에만 있는 기능으로 국문에 입력한 내용을 영문에 그대로 적용 시킵니다.
		<ul class="list_tab  clearfix target">
			<li class="tab_on"><a href="ju_juju_list.aspx"> 국문 </a></li>
			<li ><a href="ju_juju_list_eng.aspx"> 영문 </a></li>
		</ul>


		<table cellpadding="0" cellspacing="0" border="0" class="table_frm thNo" id = "ju_juju_table">
			<colgroup>
					<col  style="width:2.8%;">
				<col >
				<col  style="width:10.3%;">
				<col  style="width:10.3%;">
				<col  style="width:10.3%;">
				<col  style="width:10.3%;">
				<col  style="width:10.3%;">
				<col  style="width:10.3%;">
				<col  style="width:10.3%;">
				<col  style="width:10.3%;">
				<col  style="width:10.3%;">
			</colgroup>
	            <thead>
				<tr> 
					<th rowspan="3"> </th>
					<th rowspan="3" > 순서  </th>
					<th rowspan="3"> 성명  </th>                                                                                                                   
					<th rowspan="3"> 관계 </th>  
					<th rowspan="3"> 주식의 종류 </th>                                                                   
					<th colspan="6"> 소유주식수(지분율) </th>                                                                                                              
				</tr>
				<tr> 
					<th colspan="2"> 기초  </th>
					<th > 증가   </th>
					<th > 감소   </th>                                                                                                                   
					<th  colspan="2"> 기말 </th>                                                                                                           
				</tr>
				<tr> 
					<th> 주식수  </th>
					<th >지분율  </th>
					<th > 주식수  </th>                                                                                                                   
					<th > 주식수  </th>   
					<th > 주식수  </th>   
					<th > 지분율  </th>                                                                                                             
				</tr>
	            </thead>
                <tbody>
                <%  
    
	                if (GetRowCount(0) > 0)
	                {
		                for (int i = 0; i < GetRowCount(0); i++)
		                {
                %>
                 <tr>
					<td><input type="checkbox" "<%=GetData(i, "SEQ_NO")%>"></td>
					<td><strong><%=GetData(0, i, "ROWNUM")%></strong></td>
					<td><input type="text" class="w80" name="juju_name" value="<%=GetData(0, i, "NM")%>"></td>
					<td><input type="text" class="w80" name="juju_rel" value="<%=GetData(0, i, "REL")%>"></td>
					<td><input type="text" class="w80" name="juju_stc" value="<%=GetData(0, i, "STOK_TYPE_CD")%>"></td>
					<td><input type="text" class="w80" name="juju_bsc" value="<%=GetData(0, i, "BASIC_STCK_CNT")%>"></td>
					<td><input type="text" class="w80" name="juju_bsr" value="<%=GetData(0, i, "BASIC_SHARE_RATIO")%>"></td>
					<td><input type="text" class="w80" name="juju_isc" value="<%=GetData(0, i, "INC_STCK_CNT")%>"></td>
					<td><input type="text" class="w80" name="juju_dsc" value="<%=GetData(0, i, "DECR_STCK_CNT")%>"></td>
					<td><input type="text" class="w80" name="juju_etsc" value="<%=GetData(0, i, "END_TERM_STCK_CNT")%>"></td>
					<td><input type="text" class="w80" name="juju_etsr" value="<%=GetData(0, i, "END_TERM_SHARE_RATIO")%>"></td>		
	            </tr>
                <% 
		                }
	                }
	                else
	                {
                %>
                <!-- 내용이 없을 경우  -->
                <tr >
	                <td colspan="11" class="no_data"> 
		                <p > 내용이 없습니다. </p> 
	                </td>
                </tr>
                <% 
	                }
                %>
                <!-- // 내용이 없을 경우  -->
			</tbody>
		</table>
		<div class="btn_area clearfix mB50">
			<div class="f_right">
				<a href="#" id = "del_juju"><span class="btn"> 선택삭제 </span></a> 
				<a href="#" id = "add_juju"><span class="btn btn-ok"> 추가 </span></a>
			</div>
		</div>	

		<table cellpadding="0" cellspacing="0" border="0" class="table_frm thNo ">
			<colgroup>
				<col >
				<col  style="width:10.3%;">
				<col  style="width:10.3%;">
				<col  style="width:10.3%;">
				<col  style="width:10.3%;">
				<col  style="width:10.3%;">
				<col  style="width:10.3%;">
				<col  style="width:10.3%;">
			</colgroup>

             <tbody>
              
                <tr> 
                    <th rowspan="3>"><strong> 계 </strong> </th>    
					<td><input type="text" class="w80" name="juju_tstc" value="<%=GetData(1, 0, "T_STOK_TYPE_CD")%>"></td>                                                                                                               
					<td><input type="text" class="w80" name="juju_tbsc" value="<%=GetData(1, 0, "T_BASIC_STCK_CNT")%>"></td>
					<td><input type="text" class="w80" name="juju_tbsr" value="<%=GetData(1, 0, "T_BASIC_SHARE_RATIO")%>"></td>
					<td><input type="text" class="w80" name="juju_tisc" value="<%=GetData(1, 0, "T_INC_STCK_CNT")%>"></td>
					<td><input type="text" class="w80" name="juju_tdsc" value="<%=GetData(1, 0, "T_DECR_STCK_CNT")%>"></td>
					<td><input type="text" class="w80" name="juju_tetsc" value="<%=GetData(1, 0, "T_END_TERM_STCK_CNT")%>"></td>
					<td><input type="text" class="w80" name="juju_tetsr" value="<%=GetData(1, 0, "T_END_TERM_SHARE_RATIO")%>"></td>				                                                                                                           
				</tr>
                 <tr>  
					<td><input type="text" class="w80" name="juju_tstc" value="<%=GetData(1, 1, "T_STOK_TYPE_CD")%>"></td>                                                                                                               
					<td><input type="text" class="w80" name="juju_tbsc" value="<%=GetData(1, 1, "T_BASIC_STCK_CNT")%>"></td>
					<td><input type="text" class="w80" name="juju_tbsr" value="<%=GetData(1, 1, "T_BASIC_SHARE_RATIO")%>"></td>
					<td><input type="text" class="w80" name="juju_tisc" value="<%=GetData(1, 1, "T_INC_STCK_CNT")%>"></td>
					<td><input type="text" class="w80" name="juju_tdsc" value="<%=GetData(1, 1, "T_DECR_STCK_CNT")%>"></td>
					<td><input type="text" class="w80" name="juju_tetsc" value="<%=GetData(1, 1, "T_END_TERM_STCK_CNT")%>"></td>
					<td><input type="text" class="w80" name="juju_tetsr" value="<%=GetData(1, 1, "T_END_TERM_SHARE_RATIO")%>"></td>				                                                                                                           
				</tr>
                 <tr>  
					<td><input type="text" class="w80" name="juju_tstc" value="<%=GetData(1, 2, "T_STOK_TYPE_CD")%>"></td>                                                                                                               
					<td><input type="text" class="w80" name="juju_tbsc" value="<%=GetData(1, 2, "T_BASIC_STCK_CNT")%>"></td>
					<td><input type="text" class="w80" name="juju_tbsr" value="<%=GetData(1, 2, "T_BASIC_SHARE_RATIO")%>"></td>
					<td><input type="text" class="w80" name="juju_tisc" value="<%=GetData(1, 2, "T_INC_STCK_CNT")%>"></td>
					<td><input type="text" class="w80" name="juju_tdsc" value="<%=GetData(1, 2, "T_DECR_STCK_CNT")%>"></td>
					<td><input type="text" class="w80" name="juju_tetsc" value="<%=GetData(1, 2, "T_END_TERM_STCK_CNT")%>"></td>
					<td><input type="text" class="w80" name="juju_tetsr" value="<%=GetData(1, 2, "T_END_TERM_SHARE_RATIO")%>"></td>				                                                                                                           
				</tr>
            </tbody>
		</table>

        <div class="btn_area clearfix">
            <div class="f_right">
                <input type="checkbox" id="eng_override" runat="server" checked /><b>영문 덮어쓰기</b>
            </div>
        </div>

		<div class="btn_area clearfix">
            <div class="f_right">
			    <asp:LinkButton ID="btnBTM" runat="server" onClick="btnSave_Click" OnClientClick="return confirm('저장하시겠습니까?');">
					    <span class="btn btn-ok">저장</span>
                </asp:LinkButton>
            </div>
		</div>
	</div><!--//  wrap_box -->
	
		
</div>
</div>
<!--//  CONTENT -->
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        //자기 주식 추가
        $('#add_juju').click(function () {
            $('.no_data').remove();

            var number = $('#ju_juju_table tbody tr').length + 1;

            $('#ju_juju_table tbody').append(
                '<tr>' +
					    '<td><input type="checkbox"></td>' +
					    '<td><strong>' + number + '</strong></td>' +
                        '<td><input type="text" class="w80" name="juju_name"></td>' +
					    '<td><input type="text" class="w80" name="juju_rel"></td>' +
					    '<td><input type="text" class="w80" name="juju_stc"></td>' +
					    '<td><input type="text" class="w80" name="juju_bsc"></td>' +
					    '<td><input type="text" class="w80" name="juju_bsr"></td>' +
                        '<td><input type="text" class="w80" name="juju_isc"></td>' +
                        '<td><input type="text" class="w80" name="juju_dsc"></td>' +
                        '<td><input type="text" class="w80" name="juju_etsc"></td>' +
                        '<td><input type="text" class="w80" name="juju_etsr"></td>' +
	            '</tr>');		
        });

        //자기 주식 삭제
        $('#del_juju').click(function () {
            $('#ju_juju_table tbody').find('tr').each(function () {
                var row = $(this);
                if (row.find('input[type="checkbox"]').is(':checked')) {
                    row.remove();
                }
            });

            var n = 1;

            $('#ju_juju_table tbody').find('tr').each(function () {
                var row = $(this);
                row.find('strong').text(n);

                ++n;
            });
        });
    });
</script>
</asp:Content>