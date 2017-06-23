<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="money_bill_list.aspx.cs" Inherits="AdminSite.inv.money_bill_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
  
	<div id="page-heading">
		<h1> 손익계산서 </h1>
	</div>

	<div class="wrap_box">
        * 선택삭제 또는 추가 후 반드시 하단의 저장 버튼을 눌러야 적용 됩니다.<br />
        * 영문 덮어쓰기는 국문탭에만 있는 기능으로 국문에 입력한 내용을 영문에 그대로 적용 시킵니다.
		<ul class="list_tab  clearfix target">
			<li class="tab_on"><a href="money_bill_list.aspx"> 국문 </a></li>
			<li><a href="money_bill_list_eng.aspx"> 영문 </a></li>
		</ul>
		<table cellpadding="0" cellspacing="0" border="0" class="table_frm thNo" id="tbl_money_bill">
			<colgroup>
				<col width="2%">
				<col >
				<col width="24%">
				<col width="23%">
				<col width="23%">
				<col width="23%">
			</colgroup>
	            <thead>
				<tr> 
					<th> </th>
					<th > 순서  </th>
					<th> <strong> 과목 </strong> </th>                                                                                                                   
				    <th> 
						    <input type="text" class="mB5" placeholder="제 30기 " name = "subject1" value="<%=GetData(0, 0, "FLAGB") %>"> 
						    <input type="text" placeholder="(2013/12/31 현재) " name = "subject1_1" value="<%=GetData(0, 0, "REG_DAY") %>"> 
					    </th>  
					    <th> 
						    <input type="text" class="mB5" placeholder="제 29기 " name = "subject2" value="<%=GetData(0, 1, "FLAGB") %>"> 
						    <input type="text" placeholder="(2013/12/31 현재) "  name = "subject2_1" value="<%=GetData(0, 1, "REG_DAY") %>"> 
					    </th>                                                                 
					    <th> 
						    <input type="text" class="mB5" placeholder="제 28기 " name = "subject3" value="<%=GetData(0, 2, "FLAGB") %>"> 
						    <input type="text" placeholder="(2013/12/31 현재) " name = "subject3_1" value="<%=GetData(0, 2, "REG_DAY") %>"> 
					    </th>                                                                                                      
				    </tr>
	            </thead>
	            <tbody>
                    <%  
    
                        if (GetRowCount(1) > 0)
                        {
                            for (int i = 0; i < GetRowCount(1); i++)
                                {
                    %>
                     <tr>
					    <td><input type="checkbox" name="name_01"></td>
					    <td><strong><%=GetData(1, i, "ROWNUM")%></strong></td>
                        <td><input type="text" name="ttl"  value="<%=GetData(1, i, "ATC_NM")%>"></td>
					    <td><input type="text" name="con1" value="<%=GetData(1, i, "FIRST_COL")%>"></td>
					    <td><input type="text" name="con2" value="<%=GetData(1, i, "SECOND_COL")%>"></td>
					    <td><input type="text" name="con3" value="<%=GetData(1, i, "THIRD_COL")%>"></td>		
	                </tr>
                    <% 
                                }
                            }
                    %>
                    
			</tbody>
		</table>

        <div class="btn_area clearfix">
            <div class="f_right">
                <input type="checkbox" id="eng_override" runat="server" checked /><b>영문 덮어쓰기</b>
            </div>
        </div>

		<div class="btn_area clearfix">
			<div class="f_right">
				<a href="#" id = "del_money_bill"><span class="btn"> 선택삭제 </span></a> 
				<a href="#" id = "add_money_bill"><span class="btn btn-ok"> 추가 </span></a>

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
        $('#add_money_bill').click(function () {
            var number = $('#tbl_money_bill tbody tr').length+1;

            $('#tbl_money_bill tbody').append(
                '<tr>' +
					    '<td><input type="checkbox" name="name_01"></td>' +
					    '<td><strong>' + number + '</strong></td>' +
					    '<td><input type="text" name="ttl" ></td>' +
					    '<td><input type="text" name="con1"></td>' +
					    '<td><input type="text" name="con2"></td>' +
					    '<td><input type="text" name="con3"></td>' +
	            '</tr>');
        });

        //유동 자산 삭제
        $('#del_money_bill').click(function () {
            $('#tbl_money_bill tbody').find('tr').each(function () {
                var row = $(this);
                if (row.find('input[type="checkbox"]').is(':checked')) {
                    row.remove();
                }
            });

            var n = 1;

            $('#tbl_money_bill tbody').find('tr').each(function () {
                var row = $(this);
                row.find('strong').text(n);
                ++n;
            });
        });
    });
</script>
</asp:Content>
