<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="job_guide_list.aspx.cs" Inherits="HomePage.recruit.job_guide_list" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content">
		<header>
			<h1 class="pageTitle line">입사지원</h1>
			<p class="location">
				<a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
                <a href="/recruit/new_person.aspx"><span>채용</span></a><em> > </em>
			    <a href="/recruit/job_guide_list.aspx"><span>입사지원</span></a><em> > </em>
			    <a href="/recruit/job_guide_list.aspx"><strong>입사지원</strong></a>
			</p>
		</header>
		<!--  내용  ***************** -->
		<p class="search_left">
			<label for="<%= rcm_jobgroup.ClientID %>" class="acc-hidden">직군 선택하기</label>
            <asp:DropDownList ID="rcm_jobgroup" runat="server" AutoPostBack="false" />
			<label for="<%= rcm_career.ClientID %>" class="acc-hidden">대상 선택하기</label>
			<asp:DropDownList ID="rcm_career" runat="server" AutoPostBack="false" />
			<asp:Button ID="btnSearch" runat="server" CssClass="btn_search_i" OnClick="btnSearch_Click" Text="Search" />
		<p>

		<table id="j_table" class="table_list" border="1" >
			<caption class="hidden">입사지원 리스트</caption>
			<colgroup>
				<col style="width:9%" />
				<col  />
				<col style="width:12%" />
				<col style="width:8%" />
				<col style="width:25%" />
				<col style="width:12%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">모집분야</th>
					<th scope="col">직군</th>
					<th scope="col">대상</th>
					<th scope="col">등록일</th>
					<th scope="col">진행상황</th>
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
					<td><%=GetBoardNum(i, Convert.ToInt32(nowPageNo.Value), 10)%></td>
					<td><span class="wCut"><%=GetData(i, "RCM_TTL")%></span></td>
					<td><%=GetData(i, "RCM_JG_N")%></td>
					<td><%=GetData(i, "RCM_RC_N")%></td>
					<td><%=GetData(i, "START_DATE")%> ~ <%=GetData(i, "END_DATE")%></td>
                    <%
                        if (GetData(i, "IS_PROCESSING").Equals("Y"))
                        {
                    %>
					<td><a href="/recruit/job_guide_join.aspx?reg_seq_no=<%=GetData(i, "REG_SEQ_NO") %>&rcm_duty_no=<%=GetData(i, "RCM_DUTY_NO") %>" class="button job_on">진행중</a></td>
                    <% 
                        }
                        else
                        {
                    %>
                    <td><a href="javascript:alert('마감된 공고 입니다.');" class="button job_off">마감</a></td>
                    <%
                        }
                    %>
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
						<p > 등록된 채용공고가 없습니다. </p> 
					</td>
				</tr>
            <%
                }    
            %>
				<!-- // 내용이 없을 경우  -->	
			</tbody>
		</table>

		<div class="page_Num"> 
	        <asp:HiddenField ID="nowPageNo" runat="server"  Value="1" onvaluechanged="nowPageNo_ValueChanged"/>
	        <%= HomePage.page.paging.getPageNo(DataTotalCount, Convert.ToInt32(nowPageNo.Value), 10)%>
		</div><!--// page_Num -->

		<dl class="jop_dl">
			<dt> <span> 지원서 작성 요령  </span></dt>
			<dd> &middot; 입사지원 관련 궁금하신 점은 채용공고를 이용하여 주시기 바랍니다. </dd>
			<dd> &middot; 채용전형 일정은 채용공고를 통해 공지합니다. </dd>
			<dd> &middot; 합격여부는 전형결과확인통해 안내드립니다.</dd>
		</dl>

		<!-- // 내용 ***************** -->         
	</section>  <!--// sub_content -->
    <script type="text/javascript" >
        function movePage(page_no) {
            document.getElementById('<%= nowPageNo.ClientID %>').value = page_no;
            document.forms[0].submit();
        }
    </script>
</asp:Content>
