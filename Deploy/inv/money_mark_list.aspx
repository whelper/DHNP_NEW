<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="money_mark_list.aspx.cs" Inherits="AdminSite.inv.money_mark_list" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
  
	<div id="page-heading">
		<h1> 재무상태표 </h1>
	</div>

	<div class="wrap_box clear">
        * 선택삭제 또는 추가 후 반드시 하단의 저장 버튼을 눌러야 적용 됩니다.<br />
        * 영문 덮어쓰기는 국문탭에만 있는 기능으로 국문에 입력한 내용을 영문에 그대로 적용 시킵니다.
		<ul class="list_tab  clearfix target">
			<li class="tab_on"><a href="money_mark_list.aspx"> 국문 </a></li>
			<li><a href="money_mark_list_eng.aspx"> 영문 </a></li>
		</ul>
		<!-- 1. 유동자산   -->
		<table cellpadding="0" cellspacing="0" border="0" id= "tbl_current_assets" class="table_frm td_center">
			<colgroup>
				<col width="3%">
				<col width="3%">
				<col width="23%">
				<col width="23%">
				<col width="23%">
				<col width="23%">
			</colgroup>
	            <thead>
				<tr> 
					<th colspan="3" rowspan="2" > <strong> 과목 </strong> </th>                                                                                                                   
					<th> 
						<input type="text" class="mB5" placeholder="제 30기 " name = "subject1" value="<%=GetData(0, 0, "FIRST_COL") %>"> 
						<input type="text" placeholder="(2013/12/31 현재) " name = "subject1_1" value="<%=GetData(0, 1, "FIRST_COL") %>"> 
					</th>  
					<th> 
						<input type="text" class="mB5" placeholder="제 29기 " name = "subject2" value="<%=GetData(0, 0, "SECOND_COL") %>"> 
						<input type="text" placeholder="(2013/12/31 현재) "  name = "subject2_1" value="<%=GetData(0, 1, "SECOND_COL") %>"> 
					</th>                                                                 
					<th> 
						<input type="text" class="mB5" placeholder="제 28기 " name = "subject3" value="<%=GetData(0, 0, "THIRD_COL") %>"> 
						<input type="text" placeholder="(2013/12/31 현재) " name = "subject3_1" value="<%=GetData(0, 1, "THIRD_COL") %>"> 
					</th>                                                                                                        
				</tr>
	            </thead>
	            <tbody>
	                <tr>
					<td colspan="3" class="alignleft"><strong>  Ⅰ 유동자산</strong> </td>
					<td><input type="text" name= "ca_data1" value="<%=GetData(0, 2, "FIRST_COL") %>"></td>
					<td><input type="text" name= "ca_data2" value="<%=GetData(0, 2, "SECOND_COL") %>"></td>
					<td><input type="text" name= "ca_data3" value="<%=GetData(0, 2, "THIRD_COL") %>"></td>
	                </tr>
                    <%  
    
                        if (GetRowCount(1) > 0)
                        {
                            for (int i = 0; i < GetRowCount(1); i++)
                            {
                %>
                 <tr>
					<td><input type="checkbox" name="name_01"></td>
					<td><strong><%=GetData(1, i, "ROWNUM")%></strong></td>
                    <td><input type="text" name="ca_ttl" value="<%=GetData(1, i, "ATC_NM")%>"></td>
					<td><input type="text" name="ca_con1" value="<%=GetData(1, i, "L_ATC_AMT")%>"></td>
					<td><input type="text" name="ca_con2" value="<%=GetData(1, i, "C_ATC_AMT")%>"></td>
					<td><input type="text" name="ca_con3" value="<%=GetData(1, i, "R_ATC_AMT")%>"></td>		
	            </tr>
                <% 
                            }
                        }
                %>
                    
			    </tbody>
		</table>

		<div class="btn_area clearfix">
			<div class="f_right">
				<a href="#" id = "del_current_assets"><span class="btn"> 선택삭제 </span></a> 
				<a href="#" id = "add_current_assets"><span class="btn btn-ok w55"> 추가 </span></a>
			</div>
		</div>

		<table cellpadding="0" cellspacing="0" border="0" class="table_frm td_center mB50">
			<colgroup>
				<col width="29%">
				<col width="23%">
				<col width="23%">
				<col width="23%">
			</colgroup>
			<tbody>
				<tr> 
					<th><strong>  유동자산 계 </strong> </th>                                                                                                                   
					<td><input type="text" name= "ca_data4" value="<%=GetData(0, 3, "FIRST_COL") %>"></td>  
					<td><input type="text" name= "ca_data5" value="<%=GetData(0, 3, "SECOND_COL") %>"></td>                                                                   
					<td><input type="text" name= "ca_data6" value="<%=GetData(0, 3, "THIRD_COL") %>"></td>                                                                                                              
				</tr>
			</tbody>
		</table>
		<!-- //  1. 유동자산   -->	

		<!-- 2. 비유동자산   -->
		<table cellpadding="0" cellspacing="0" border="0" id= "tbl_n_current_assets" class="table_frm td_center">
			<colgroup>
				<col width="3%">
				<col width="3%">
				<col width="23%">
				<col width="23%">
				<col width="23%">
				<col width="23%">
			</colgroup>
	            <tbody>
	                <tr>
					    <td colspan="3" class="alignleft"> <strong> Ⅱ 비유동자산</strong>  </td>
					    <td><input type="text" name= "nca_data1" value="<%=GetData(0, 4, "FIRST_COL") %>"></td>
					    <td><input type="text" name= "nca_data2" value="<%=GetData(0, 4, "SECOND_COL") %>"></td>
					    <td><input type="text" name= "nca_data3" value="<%=GetData(0, 4, "THIRD_COL") %>"></td>
	                </tr>
                     </tr>
                    <%  
    
                        if (GetRowCount(2) > 0)
                        {
                            for (int i = 0; i < GetRowCount(2); i++)
                            {
                %>
                 <tr>
					<td><input type="checkbox" name="name_01"></td>
					<td><strong><%=GetData(2, i, "ROWNUM")%></strong></td>
                    <td><input type="text" name="nca_ttl" value="<%=GetData(2, i, "ATC_NM")%>"></td>
					<td><input type="text" name="nca_con1" value="<%=GetData(2, i, "L_ATC_AMT")%>"></td>
					<td><input type="text" name="nca_con2" value="<%=GetData(2, i, "C_ATC_AMT")%>"></td>
					<td><input type="text" name="nca_con3" value="<%=GetData(2, i, "R_ATC_AMT")%>"></td>		
	            </tr>
                <% 
                            }
                        }
                %>
			    </tbody>
		</table>
		<div class="btn_area clearfix">
			<div class="f_right">
				<a href="#" id = "del_n_current_assets"><span class="btn mR5"> 선택삭제 </span></a> 
				<a href="#" id = "add_n_current_assets"><span class="btn btn-ok w55"> 추가 </span></a>
			</div>
		</div>	
		<table cellpadding="0" cellspacing="0" border="0" class="table_frm mB50">
			<colgroup>
				<col width="29%">
				<col width="23%">
				<col width="23%">
				<col width="23%">
			</colgroup>
			<tbody>
				<tr> 
					<th><strong>  비유동자산 계 </strong>  </th>                                                                                                                   
					<td><input type="text" name= "nca_data4" value="<%=GetData(0, 5, "FIRST_COL") %>"></td>  
					<td><input type="text" name= "nca_data5" value="<%=GetData(0, 5, "SECOND_COL") %>"></td>                                                                   
					<td><input type="text" name= "nca_data6" value="<%=GetData(0, 5, "THIRD_COL") %>"></td>                                                                                                              
				</tr>
				<tr> 
					<th><strong>  자산 계 </strong>  </th>                                                                                                                   
					<td><input type="text" name= "ca_t_data1" value="<%=GetData(0, 6, "FIRST_COL") %>"></td>  
					<td><input type="text" name= "ca_t_data2" value="<%=GetData(0, 6, "SECOND_COL") %>"></td>                                                                   
					<td><input type="text" name= "ca_t_data3" value="<%=GetData(0, 6, "THIRD_COL") %>"></td>                                                                                                              
				</tr>
			</tbody>
		</table>
		<!-- //  2. 비유동자산   -->

		<!-- 3. 유동부채    -->
		<table cellpadding="0" cellspacing="0" border="0" id= "tbl_current_debt" class="table_frm ">
			<colgroup>
				<col width="3%">
				<col width="3%">
				<col width="23%">
				<col width="23%">
				<col width="23%">
				<col width="23%">
			</colgroup>
	            <tbody>
	                <tr>
					<td colspan="3" class="alignleft"><strong>  Ⅲ 유동부채  </strong> </td>
					<td><input type="text" name= "cd_data1" value="<%=GetData(0, 7, "FIRST_COL") %>"></></td>
					<td><input type="text" name= "cd_data2" value="<%=GetData(0, 7, "SECOND_COL") %>"></td>
					<td><input type="text" name= "cd_data3" value="<%=GetData(0, 7, "THIRD_COL") %>"></td>
	                </tr>
                     </tr>
                    <%  
    
                        if (GetRowCount(3) > 0)
                        {
                            for (int i = 0; i < GetRowCount(3); i++)
                            {
                %>
                 <tr>
					<td><input type="checkbox" name="name_01"></td>
					<td><strong><%=GetData(3, i, "ROWNUM")%></strong></td>
                    <td><input type="text" name="cd_ttl" value="<%=GetData(3, i, "ATC_NM")%>"></td>
					<td><input type="text" name="cd_con1" value="<%=GetData(3, i, "L_ATC_AMT")%>"></td>
					<td><input type="text" name="cd_con2" value="<%=GetData(3, i, "C_ATC_AMT")%>"></td>
					<td><input type="text" name="cd_con3" value="<%=GetData(3, i, "R_ATC_AMT")%>"></td>		
	            </tr>
                <% 
                            }
                        }
                %>
			</tbody>
		</table>
		<div class="btn_area clearfix">
			<div class="f_right">
				<a href="#" id = "del_current_debt"><span class="btn mR5"> 선택삭제 </span></a> 
				<a href="#" id = "add_current_debt"><span class="btn btn-ok w55"> 추가 </span></a>
			</div>
		</div>	
		<table cellpadding="0" cellspacing="0" border="0" class="table_frm mB50">
			<colgroup>
				<col width="29%">
				<col width="23%">
				<col width="23%">
				<col width="23%">
			</colgroup>
			<tbody>
				<tr> 
					<th><strong>  유동부채 계 </strong>  </th>                                                                                                                   
					<td><input type="text" name= "cd_data4" value="<%=GetData(0, 8, "FIRST_COL") %>"></td>  
					<td><input type="text" name= "cd_data5" value="<%=GetData(0, 8, "SECOND_COL") %>"></td>                                                                   
					<td><input type="text" name= "cd_data6" value="<%=GetData(0, 8, "THIRD_COL") %>"></td>                                                                                                              
				</tr>
			</tbody>
		</table>
		<!-- // 3. 유동부채    -->

		<!-- 4. 비유동부채   -->
		<table cellpadding="0" cellspacing="0" border="0" id= "tbl_n_current_debt" class="table_frm">
			<colgroup>
				<col width="3%">
				<col width="3%">
				<col width="23%">
				<col width="23%">
				<col width="23%">
				<col width="23%">
			</colgroup>
	            <tbody>
	                <tr>
					<td colspan="3" class="alignleft"><strong>  Ⅳ 비유동부채  </strong>  </td>
					<td><input type="text" name= "ncd_data1" value="<%=GetData(0, 9, "FIRST_COL") %>"></td>
					<td><input type="text" name= "ncd_data2" value="<%=GetData(0, 9, "SECOND_COL") %>"></td>
					<td><input type="text" name= "ncd_data3" value="<%=GetData(0, 9, "THIRD_COL") %>"></td>
	                </tr>
                     </tr>
                    <%  
    
                        if (GetRowCount(4) > 0)
                        {
                            for (int i = 0; i < GetRowCount(1); i++)
                            {
                %>
                 <tr>
					<td><input type="checkbox" name="name_01"></td>
					<td><strong><%=GetData(4, i, "ROWNUM")%></strong></td>
                    <td><input type="text" name="ncd_ttl" value="<%=GetData(4, i, "ATC_NM")%>"></td>
					<td><input type="text" name="ncd_con1" value="<%=GetData(4, i, "L_ATC_AMT")%>"></td>
					<td><input type="text" name="ncd_con2" value="<%=GetData(4, i, "C_ATC_AMT")%>"></td>
					<td><input type="text" name="ncd_con3" value="<%=GetData(4, i, "R_ATC_AMT")%>"></td>		
	            </tr>
                <% 
                            }
                        }
                %>
			</tbody>
		</table>
		<div class="btn_area clearfix">
			<div class="f_right">
				<a href="#" id = "del_n_current_debt"><span class="btn mR5"> 선택삭제 </span></a> 
				<a href="#" id = "add_n_current_debt""><span class="btn btn-ok w55"> 추가 </span></a>
			</div>
		</div>	
		<table cellpadding="0" cellspacing="0" border="0" class="table_frm mB50">
			<colgroup>
				<col width="29%">
				<col width="23%">
				<col width="23%">
				<col width="23%">
			</colgroup>
			<tbody>
				<tr> 
					<th><strong>  비유동부채 계 </strong>  </th>                                                                                                                   
					<td><input type="text" name= "ncd_data4" value="<%=GetData(0, 10, "FIRST_COL") %>"></td>  
					<td><input type="text" name= "ncd_data5" value="<%=GetData(0, 10, "SECOND_COL") %>"></td>                                                                   
					<td><input type="text" name= "ncd_data6" value="<%=GetData(0, 10, "THIRD_COL") %>"></td>                                                                                                              
				</tr>
				<tr> 
					<th><strong>  부채 계 </strong>  </th>                                                                                                                   
					<td><input type="text" name= "cd_t_data1" value="<%=GetData(0, 11, "FIRST_COL") %>"></td>  
					<td><input type="text" name= "cd_t_data2" value="<%=GetData(0, 11, "SECOND_COL") %>"></td>                                                                   
					<td><input type="text" name= "cd_t_data3" value="<%=GetData(0, 11, "THIRD_COL") %>"></td>                                                                                                              
				</tr>
			</tbody>
		</table>
		<!-- // 4. 비유동부채    -->

		<!-- 5. 자본   -->
		<table cellpadding="0" cellspacing="0" border="0" id="tbl_capital" class="table_frm">
			<colgroup>
				<col width="3%">
				<col width="3%">
				<col width="23%">
				<col width="23%">
				<col width="23%">
				<col width="23%">
			</colgroup>
	            <tbody>
	                <tr>
					<td colspan="3" class="alignleft"> <strong> Ⅴ 자본 </strong>  </td>
					<td><input type="text" name="cp_data1" value="<%=GetData(0, 12, "FIRST_COL") %>"></td>
					<td><input type="text" name="cp_data2" value="<%=GetData(0, 12, "SECOND_COL") %>"></td>
					<td><input type="text" name="cp_data3" value="<%=GetData(0, 12, "THIRD_COL") %>"></td>
	                </tr>
                     </tr>
                    <%  
    
                        if (GetRowCount(5) > 0)
                        {
                            for (int i = 0; i < GetRowCount(5); i++)
                            {
                %>
                 <tr>
					<td><input type="checkbox" name="name_01"></td>
					<td><strong><%=GetData(5, i, "ROWNUM")%></strong></td>
                    <td><input type="text" name="cp_ttl" value="<%=GetData(5, i, "ATC_NM")%>"></td>
					<td><input type="text" name="cp_con1" value="<%=GetData(5, i, "L_ATC_AMT")%>"></td>
					<td><input type="text" name="cp_con2" value="<%=GetData(5, i, "C_ATC_AMT")%>"></td>
					<td><input type="text" name="cp_con3" value="<%=GetData(5, i, "R_ATC_AMT")%>"></td>		
	            </tr>
                <% 
                            }
                        }
                %>
			</tbody>
		</table>
		<div class="btn_area clearfix">
			<div class="f_right">
				<a href="#" id = "del_capital"><span class="btn mR5"> 선택삭제 </span></a> 
				<a href="#" id = "add_capital"><span class="btn btn-ok w55"> 추가 </span></a>
			</div>
		</div>	
		<table cellpadding="0" cellspacing="0" border="0" class="table_frm mB50">
			<colgroup>
				<col width="29%">
				<col width="23%">
				<col width="23%">
				<col width="23%">
			</colgroup>
			<tbody>
				<tr> 
					<th><strong>  자본 계 </strong>  </th>                                                                                                                   
					<td><input type="text" name="cp_data4" value="<%=GetData(0, 13, "FIRST_COL") %>"></td>  
					<td><input type="text" name="cp_data5" value="<%=GetData(0, 13, "SECOND_COL") %>"></td>                                                                   
					<td><input type="text" name="cp_data6" value="<%=GetData(0, 13, "THIRD_COL") %>"></td>                                                                                                              
				</tr>
				<tr> 
					<th><strong>  부채 / 자본 계 </strong>  </th>                                                                                                                   
					<td><input type="text" name="cad_t_data1" value="<%=GetData(0, 14, "FIRST_COL") %>"></td>  
					<td><input type="text" name="cad_t_data2" value="<%=GetData(0, 14, "SECOND_COL") %>"></td>                                                                   
					<td><input type="text" name="cad_t_data3" value="<%=GetData(0, 14, "THIRD_COL") %>"></td>                                                                                                              
				</tr>
			</tbody>
		</table>

        <div class="btn_area clearfix">
            <div class="f_right">
                <input type="checkbox" id="eng_override" runat="server" checked /><b>영문 덮어쓰기</b>
            </div>
        </div>

		<!-- // 5. 자본   -->
		<div class="f_right">
            <asp:LinkButton ID="btnBTM" runat="server" onClick="btnSave_Click" OnClientClick="return confirm('저장하시겠습니까?');">
				<span class="btn btn-ok w80">저장</span>
            </asp:LinkButton>
		</div>

	</div><!--//  wrap_box -->
	
		
</div>
</div>

<!--//  CONTENT -->
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        
        //유동 자산 추가
        $('#add_current_assets').click(function () {
            var number = $('#tbl_current_assets tbody tr').length;

            $('#tbl_current_assets tbody').append(
                '<tr>' +
					    '<td><input type="checkbox" name="name_01"></td>' +
					    '<td><strong>' + number + '</strong></td>' +
					    '<td><input type="text" placeholder="현금및현금성자산" name="ca_ttl" ></td>' +
					    '<td><input type="text" name="ca_con1"></td>' +
					    '<td><input type="text" name="ca_con2"></td>' +
					    '<td><input type="text" name="ca_con3"></td>' +
	            '</tr>');
        });

        //유동 자산 삭제
        $('#del_current_assets').click(function () {
            $('#tbl_current_assets tbody').find('tr').each(function () {
                var row = $(this);
                if (row.find('input[type="checkbox"]').is(':checked')) {
                    row.remove();
                }
            });

            var n = 0;

            $('#tbl_current_assets tbody').find('tr').each(function () {
                if (n > 0) {
                    var row = $(this);
                    row.find('strong').text(n);
                }
                ++n;
            });
        });

        //비 유동 자산 추가
        $('#add_n_current_assets').click(function () {
            var number = $('#tbl_n_current_assets tbody tr').length;

            $('#tbl_n_current_assets tbody').append(
                '<tr>' +
					    '<td><input type="checkbox" name="name_02"></td>' +
					    '<td><strong>' + number + '</strong></td>' +
					    '<td><input type="text" placeholder="장기금융자산" name="nca_ttl"></td>' +
					    '<td><input type="text" name="nca_con1"></td>' +
					    '<td><input type="text" name="nca_con2"></td>' +
					    '<td><input type="text" name="nca_con3"></td>' +
	            '</tr>');
        });

        //비 유동 자산 삭제
        $('#del_n_current_assets').click(function () {
            $('#tbl_n_current_assets tbody').find('tr').each(function () {
                var row = $(this);
                if (row.find('input[type="checkbox"]').is(':checked')) {
                    row.remove();
                }
            });

            var n = 0;

            $('#tbl_n_current_assets tbody').find('tr').each(function () {
                if (n > 0) {
                    var row = $(this);
                    row.find('strong').text(n);
                }
                ++n;
            });
        });

        //유동 부채 추가
        $('#add_current_debt').click(function () {
            var number = $('#tbl_current_debt tbody tr').length;

            $('#tbl_current_debt tbody').append(
                '<tr>' +
					    '<td><input type="checkbox" name="name_03"></td>' +
					    '<td><strong>' + number + '</strong></td>' +
					    '<td><input type="text" placeholder="매입체무" name="cd_ttl"></td>' +
					    '<td><input type="text" name="cd_con1"></td>' +
					    '<td><input type="text" name="cd_con2"></td>' +
					    '<td><input type="text" name="cd_con3"></td>' +
	            '</tr>');
        });

        //유동 부채 삭제
        $('#del_current_debt').click(function () {
            $('#tbl_current_debt tbody').find('tr').each(function () {
                var row = $(this);
                if (row.find('input[type="checkbox"]').is(':checked')) {
                    row.remove();
                }
            });

            var n = 0;

            $('#tbl_current_debt tbody').find('tr').each(function () {
                if (n > 0) {
                    var row = $(this);
                    row.find('strong').text(n);
                }
                ++n;
            });
        });

        //비 유동 부채 추가
        $('#add_n_current_debt').click(function () {
            var number = $('#tbl_n_current_debt tbody tr').length;

            $('#tbl_n_current_debt tbody').append(
                '<tr>' +
					    '<td><input type="checkbox" name="name_04"></td>' +
					    '<td><strong>' + number + '</strong></td>' +
					    '<td><input type="text" placeholder="사채" name="ncd_ttl"></td>' +
					    '<td><input type="text" name="ncd_con1"></td>' +
					    '<td><input type="text" name="ncd_con2"></td>' +
					    '<td><input type="text" name="ncd_con3"></td>' +
	            '</tr>');
        });

        //비 유동 부채 삭제
        $('#del_n_current_debt').click(function () {
            $('#tbl_n_current_debt tbody').find('tr').each(function () {
                var row = $(this);
                if (row.find('input[type="checkbox"]').is(':checked')) {
                    row.remove();
                }
            });

            var n = 0;

            $('#tbl_n_current_debt tbody').find('tr').each(function () {
                if (n > 0) {
                    var row = $(this);
                    row.find('strong').text(n);
                }
                ++n;
            });
        });

        //자본 추가
        $('#add_capital').click(function () {
            var number = $('#tbl_capital tbody tr').length;

            $('#tbl_capital tbody').append(
                '<tr>' +
					    '<td><input type="checkbox" name="name_05"></td>' +
					    '<td><strong>' + number + '</strong></td>' +
					    '<td><input type="text" placeholder="장기차입금" name="cp_ttl"></td>' +
					    '<td><input type="text" name="cp_con1"></td>' +
					    '<td><input type="text" name="cp_con2"></td>' +
					    '<td><input type="text" name="cp_con3"></td>' +
	            '</tr>');
        });

        //자본 삭제
        $('#del_capital').click(function () {
            $('#tbl_capital tbody').find('tr').each(function () {
                var row = $(this);
                if (row.find('input[type="checkbox"]').is(':checked')) {
                    row.remove();
                }
            });

            var n = 0;

            $('#tbl_capital tbody').find('tr').each(function () {
                if (n > 0) {
                    var row = $(this);
                    row.find('strong').text(n);
                }
                ++n;
            });
        });
    });
</script>
        
</asp:Content>
