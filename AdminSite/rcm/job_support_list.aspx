<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="job_support_list.aspx.cs" Inherits="AdminSite.rcm.job_support_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
  
	<div id="page-heading">
		<h1>지원 현황
            <span class="title_small">
                - 
                <%
                if (GetRowCount(1)> 0) {  
                %>
				   <%=GetData(1, 0, "DUTY_NM")%>
                <% 
                  }
                %>
            </span>
        </h1> 
	</div>
	<div class="wrap_box">
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
					<th> <label for="pdt_name"> 이름  </label>  </th>   
					<td>  <input  type="text" id="chi_nm" class="span4 text" runat="server" placeholder="이름을  입력해 주세요 "> </td> 
					<th>  <label for="pdt_select"> 채용결과 </label> </th>       
					<td>
						<label for="name_01" class="mR10" >	
							<input type="radio" id="succ_yn" name="succ_yn" runat="server" class="inline" value="">전체 
						</label>  
						<label for="name_02" class="mR10" >	
							<input type="radio" id="succ_yn_c" name="succ_yn" runat="server" class="inline" value="C"> 미확인        
						</label>
						<label for="name_02" class="mR10" >	
							<input type="radio" id="succ_yn_y" name="succ_yn" runat="server" class="inline" value="Y"> 합격        
						</label> 
						<label for="name_03" class="mR10" >	
							<input type="radio" id="succ_yn_n" name="succ_yn" runat="server" class="inline" value="N"> 불합격        
						</label>  
					</td>
					<td  rowspan="2" class=" aligncenter">
						<asp:LinkButton ID="btn_Search" runat="server" onClick="btnSearch_Click">
					       <span class="btn s_search">검색</span>
                        </asp:LinkButton>
					</td>
				</tr> 
				<tr> 
					<th>
						<label for="pdt_code"> 지원직군  </label>  
					</th>   
					<td>  
						<select  id="pdt_select" class="input_list_selection" runat="server">
							<option value=""> 전체  </option>
							<option value="RCM_JOBGROUP_ADMIN"> 관리직   </option>
							<option value="RCM_JOBGROUP_SALES"> 영업직    </option>
							<option value="RCM_JOBGROUP_PROD"> 생산가능직    </option>
							<option value="RCM_JOBGROUP_RESCH"> 연구직    </option>
							<option value="RCM_JOBGROUP_PROF"> 전문직    </option>
							<option value="RCM_JOBGROUP_TECH"> 기술직    </option>
					      </select>

					</td> 
					<th> 
						<label for="name_11"> 지원유형 </label>      
					</th>       
					<td>
						<label for="name_11" class="mR10" >	
							<input type="radio" id="rcm_type_1" name="rcm_type" runat="server" class="inline" /> 전체 
						</label>  
						<label for="name_12" class="mR10" >	
							<input type="radio" id="rcm_type_2" name="rcm_type" runat="server" class="inline/"> 정규직      
						</label>  
						<label for="name_13" class="mR10">
							<input type="radio" id="rcm_type_3" name="rcm_type" runat="server" class="inline/"> 계약직    
					      </label> 
						<label for="name_04" class="mR10">
							<input type="radio" id="rcm_type_4" name="rcm_type" runat="server" class="inline"/> 인턴    
					      </label>
						<label for="name_05">
							<input type="radio" id="rcm_type_5" name="rcm_type" runat="server" class="inline" /> 기타     
					      </label> 
					</td> 
				</tr> 
                <tr> 
					<th>
						<label for="name_21"> 신입/경력 </label>  
					</th>   
					<td>  
						<label for="name_21" class="mR10" >	
							<input type="radio" id="rcm_career_1" name="rcm_career" runat="server" class="inline" /> 전체 
						</label>  
						<label for="name_22" class="mR10" >	
							<input type="radio" id="rcm_career_2" name="rcm_career" runat="server" class="inline" /> 신입      
						</label>  
						<label for="name_23" class="mR10">
							<input type="radio" id="rcm_career_3" name="rcm_career" runat="server" class="inline" /> 경력    
					     </label> 
					</td> 
					<th> 
						<label for="name_31">  </label>      
					</th>       
					<td>
						
					</td> 
				</tr> 
			</tbody>
		</table>
	
		<table cellpadding="0" cellspacing="0" border="0" class="table_new" style="margin-bottom:10px" >
			<thead>
				<tr> 
					<th width="5%"> 번호 </th>
					<th width="12%"> 이름 </th>
					<th width="12%"> 지원유형  </th>
					<th width="10%"> 지원직군  </th>
                    <th width="8%" > 신입/경력  </th>
					<th width="12%"> 연락처  </th>
					<th> 이메일  </th>
					<th width="12%"> 결과  </th>
					<th width="12%"> 등록일  </th>
				</tr>
			</thead>
			<tbody>
            <%
                if (GetRowCount(0)> 0)
                {
                    for (int i = 0; i < GetRowCount(0); i++)
                    {
            %>
				<tr>
					<td><%=GetBoardNum(i, Convert.ToInt32(nowPageNo.Value), int.Parse(Pagesize))%></td>
					<td ><a href="job_support_detail.aspx?reg_seq_no=<%=RegSeqNo%>&support_no=<%=GetData(0, i, "SUPPORT_NO") %>"><%=GetData(0, i, "CHI_NM") %></a></td>
					<td><%=GetData(0, i, "SUPPORT_TYPE_NM")%></td>
					<td><%=GetData(0, i, "SUPPORT_POS_NM")%></td>
                    <td><%=GetData(0, i, "SUPPORT_CR_NM")%></td>
					<td><%=GetData(0, i, "CELLTEL")%></td>
					<td><%=GetData(0, i, "EMAIL")%></td>
					<td><%=GetData(0, i, "SUCC_NM")%></td>
					<td><%=GetData(0, i, "REG_DT")%></td>
				</tr>
            <% 
                    }
                }
                else
                {
            %>
			<!-- 내용이 없을 경우  -->
			<tr >
				<td colspan="8" class="no_data"> 
					<p > 내용이 없습니다. </p> 
				</td>
			</tr>
            <% 
                }
            %>
			</tbody>
		</table>

       <asp:DropDownList   ID="select_Pagesize"   class="input_list_selection" runat="server" style="width:100px" onselectedindexchanged = "select_Page_Change" AutoPostBack = "true">
            <asp:ListItem Value="10">10</asp:ListItem>
            <asp:ListItem Value="50">50</asp:ListItem>
            <asp:ListItem Value="100">100</asp:ListItem>
		</asp:DropDownList>
        
        <asp:LinkButton ID="btn_Excel" runat="server" onclick="btn_Excel_Click">
			<span class="btn s_search">엑셀다운로드</span>
        </asp:LinkButton>

        <asp:HiddenField ID="nowPageNo" runat="server"  Value="1" onvaluechanged="nowPageNo_ValueChanged"/>			
        <%= AdminSite.page.paging.getPageNo(DataTotalCount, Convert.ToInt32(nowPageNo.Value), int.Parse(Pagesize))%>


	</div>
	<!--//  wrap_box -->
	
		
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