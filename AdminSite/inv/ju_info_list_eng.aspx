<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="ju_info_list_eng.aspx.cs" Inherits="AdminSite.inv.ju_info_list_eng" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
  
	<div id="page-heading">
		<h1> 주식발행 </h1>
	</div>

	<div class="wrap_box">
        * 선택삭제 또는 추가 후 반드시 하단의 저장 버튼을 눌러야 적용 됩니다.<br />
        * 영문 덮어쓰기는 국문탭에만 있는 기능으로 국문에 입력한 내용을 영문에 그대로 적용 시킵니다.<br />
        * 합계 라인 표기 : 국문 = "합계", 영문 = "Total"
		<ul class="list_tab  clearfix target">
			<li ><a href="ju_info_list.aspx"> 국문 </a></li>
			<li class="tab_on"><a href="ju_info_list_eng.apsx"> 영문 </a></li>
		</ul>
		<table cellpadding="0" cellspacing="0" border="0" class="table_new" id = "ju_info_table">
			<colgroup>
				<col width="3%">
				<col width="3%">
				<col >
				<col width="25%">
				<col width="25%">
				<col width="25%">
			</colgroup>
	            <thead>
				<tr> 
					<th> </th>
					<th > 순서  </th>
					<th> <strong> 주식의 종류 </strong> </th>                                                                                                                   
					<th > 발행주식총수 </th>  
					<th> 액면총액 </th>                                                                   
					<th> 비고 </th>                                                                                                              
				</tr>
	            </thead>
	            <tbody>
            <%
                if (GetRowCount() > 0)
                {
                    for (int i = 0; i < GetRowCount(); i++)
                    {
            %>
			<tr>
                <td> <input type="checkbox"></td>
				<td><%=GetData(i, "ROWNUM")%></td>
				<td><input type="text" name="ju_info_stc" value="<%=GetData(i, "STOK_TYPE_CD")%>"></td>
				<td><input type="text" name="ju_info_pstc" value="<%=GetData(i, "PUB_STOK_TOTAL_CNT")%>"></td>
                <td><input type="text" name="ju_info_fta" value="<%=GetData(i, "FACE_TOTAL_AMT")%>"></td>
				<td><input type="text" name="ju_info_remark" value="<%=GetData(i, "REMARK")%>"></td>
			</tr>
            <% 
                    }
                }
                else
                {
            %>
			<!-- 내용이 없을 경우  -->
			<tr >
				<td colspan="6" class="no_data"> 
					<p > 내용이 없습니다. </p> 
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
				<a href="#" id = "del_ju_info"><span class="btn"> 선택삭제 </span></a> 
				<a href="#" id = "add_ju_info"><span class="btn btn-ok"> 추가 </span></a>
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
        $('#add_ju_info').click(function () {
            $('.no_data').remove();

            var total_rows = "<%= GetRowCount() %>";
            var number = 0;

            if (total_rows == "0") {
                number = $('#ju_info_table tbody tr').length;
            } else {
                number = $('#ju_info_table tbody tr').length + 1;
            }

            $('#ju_info_table tbody').append(
                '<tr>' +
					    '<td><input type="checkbox"></td>' +
					    '<td class = "num">' + number + '</td>' +
                        '<td><input type="text" name="ju_info_stc"></td>' +
					    '<td><input type="text" name="ju_info_pstc"></td>' +
					    '<td><input type="text" name="ju_info_fta"></td>' +
					    '<td><input type="text" name="ju_info_remark"></td>' +
	            '</tr>');
        });

        //자기 주식 삭제
        $('#del_ju_info').click(function () {
            $('#ju_info_table tbody').find('tr').each(function () {
                var row = $(this);
                if (row.find('input[type="checkbox"]').is(':checked')) {
                    row.remove();
                }
            });

            var n = 1;

            $('#ju_info_table tbody').find('tr').each(function () {
                var row = $(this);
                row.find('.num').text(n);

                ++n;
            });
        });
    });
</script>
</asp:Content>