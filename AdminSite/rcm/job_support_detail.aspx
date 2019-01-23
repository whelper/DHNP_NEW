<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="job_support_detail.aspx.cs" Inherits="AdminSite.rcm.job_support_detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
  
	<div id="page-heading">
		<h1> 입사지원 현황 </h1>
	</div>
	<div class="wrap_box">
		<!-- 01 기본 인적사항   -->
		<h2 class="sub_title_02 mT10"> 기본 인적사항</h2>
		<table class="table_search height tdLeft mB30">
			<colgroup>
				<col width="20%" />
				<col width="15%" />
				<col width="15%" />
				<col width="15%" />
				<col />
			</colgroup>
			<tbody>
				<tr> 
					<th rowspan="6">
                        <% 
                            if (GetData(0, 0, "IMG") == "")
                            {
                        %>
                        <div><img src="/common/images/photo_user.jpg" alt="" /> </div>
                        <% 
                            }
                            else
                            {
                        %>
						<div><img src="<%=GetData(0, 0, "IMG")%>" alt="" onerror="this.src='/common/images/photo_user.jpg'" style="width:110px;height:146px"/> </div>
                        <% 
                            }
                        %>
					</th>       
				</tr> 
				<tr>
					<th>성명(한자)</th>       
					<td><span><%=GetData(0, 0, "CHI_NM") %></span> </td>
					<th>  생년월일  </th>       
					<td><span><%=GetData(0, 0, "BIRTHDAY")%></span> </td>
				</tr>
				<tr>
					<th>전화번호</th>       
					<td colspan="3" class="alignleft "><span><%=GetData(0, 0, "TEL")%></span> </td>
				</tr>
				<tr>
					<th>핸드폰</th>       
					<td colspan="3" class="alignleft "><span><%=GetData(0, 0, "CELLTEL")%></span> </td>
				</tr>
				<tr>
					<th>E-mail</th>       
					<td colspan="3" class="alignleft "><span><%=GetData(0, 0, "EMAIL")%></span> </td>
				</tr>
				<tr>
					<th>주소</th>       
					<td colspan="3"><span><%=GetData(0, 0, "ADDR")%> <%=GetData(0, 0, "ADDR_DTL")%> (<%=GetData(0, 0, "ZIPCODE_STR")%><%=(GetData(0, 0, "ZIPCODE_END")!="000")?"-"+GetData(0, 0, "ZIPCODE_END"):""%>)</span> </td>
				</tr>
			</tbody>
		</table>
		<!-- // 01 기본 인적사항  -->

		<!-- 02 지원구분  -->
		<h2 class="sub_title_02"> 지원구분 </h2>
		<table class="table_search heightLeft mB30">
			<colgroup>
				<col width="10%" />
				<col />
			</colgroup>
			<tbody>
				<tr> 
					<th> 지원구분  </th>       
					<td>
						  <span class="wCol_4 inlineB "><b> 유형 </b>  :  <%=GetData(0, 0, "SUPPORT_TYPE_NM")%>  </span> 
						  <span class="wCol_4 inlineB "><b>직군 </b>   :  <%=GetData(0, 0, "SUPPORT_POS_NM")%>  </span> 
						  <span class="wCol_4 inlineB "><b>경력 </b>  :  <%=GetData(0, 0, "SUPPORT_CR_NM")%>  </span> 
					</td>
				</tr> 
				<tr>
					<th>  지원직무 </th>       
					<td>
						  <span class="w80p inlineB"><b> <%=GetData(0, 0, "SUPPORT_UPR_DUTY_NM")%> </b>  :  <%=GetData(0, 0, "SUPPORT_DUTY_NM")%>   </span> 
					</td>
				</tr>
				<tr>
					<th> 희망직급  </th>       
					<td>
						  <span class="w80p inlineB"><%=GetData(0, 0, "HOPE_POSITION_NM")%></span> 
					</td>
				</tr>
				<tr>
					<th> 지원동기  </th>
					<td> 
                        <%
                            if (GetData(0, 0, "SUPPORT_MOTIVE").Equals("RCM_M_ETC"))
                            {
                        %>
						<span class="w80p inlineB " ><%=GetData(0, 0, "SUPPORT_MOTIVE_NM")%> (<%=GetData(0, 0, "SUPPORT_MOTIVE_R")%>)</span> 
                        <% 
                            }
                            else
                            {
                        %>
                        <span class="w80p inlineB " ><%=GetData(0, 0, "SUPPORT_MOTIVE_NM")%></span> 
                        <%
                            } 
                        %>
					</td>
				</tr>
				<tr>
					<th> 희망근무지   </th>
					<td> 
						<span class="wCol_4 inlineB "><%=GetData(0, 0, "HOPE_WORK_PLACE_NM")%></span> 
					</td>
				</tr>
				<tr>
					<th> 입사가능일   </th>
					<td> 
						<span class="wCol_4 inlineB "><%=GetData(0, 0, "JOINCOMP_PB_DATE")%></span> 
					</td>
				</tr>
                <tr>
					<th>희망연봉</th>
					<td> 
						<span class="wCol_4 inlineB "><%=GetData(0, 0, "SALARY_REQ")%></span> 
					</td>
				</tr>
			</tbody>
		</table>
		<!-- // 02 지원구분  -->

		<!-- 03 학력사항  -->
		<h2 class="sub_title_02"> 학력사항 - 고등학교</h2>
		<table class="table_search height mB30">
			<colgroup>
				<col width="20%" />
				<col width="20%" />
				<col width="20%" />
				<col width="20%" />
				<col  />
			</colgroup>
			<tbody>
				<tr> 
					<th>졸업년월</th> 
					<th>학교명</th>       
				    <th>소재지</th> 
					<th>전공</th> 
					<th>학점</th>   
				</tr> 
				<tr>
                <% 
                    if (GetData(0, 0, "HS_QUAL_EXAM_YN").Equals("Y"))
                    {
                %>
					<td><%=GetData(0, 0, "HS_GRAD_DATE")%>년 <%=GetData(0, 0, "HS_GRAD_SELECT_NM")%>(대입검정고시)</td>       
                <% 
                    }
                    else
                    {
                %>
                    <td><%=GetData(0, 0, "HS_GRAD_DATE")%>년 <%=GetData(0, 0, "HS_GRAD_SELECT_NM")%></td>
                <% 
                    }
                %>
					<td><b><%=GetData(0, 0, "HS_NM")%></b></td>
					<td><%=GetData(0, 0, "HS_LOC_NM")%></td>
					<td><%=GetData(0, 0, "HS_MAJOR_NM")%></td>
					<td> - </td>
				</tr>
			</tbody>
		</table>

        <!-- 03 학력사항  -->
        <h2 class="sub_title_02"> 학력사항-대학교 이상</h2>
		<table class="table_search height mB30">
			<colgroup>
				<col />
				<col width="20%" />
				<col width="20%" />
				<col width="20%" />
				<col width="20%" />
			</colgroup>
			<tbody>
				<tr> 
					<th>졸업년월  </th> 
					<th>학교명  </th>       
				       <th>소재지 </th> 
					<th>전공 </th> 
					<th>학점    </th>   
				</tr>
                <%
                    if (GetRowCount(1) > 0)
                    {
                        for (int i = 0; i < GetRowCount(1); i++)
                        {
                %> 
				<tr>
					<td><%=GetData(1, i, "ADMIS_YEAR")%>년 <%=GetData(1, i, "ADMIS_NM")%> ~ <%=GetData(1, i, "GRADUT_YEAR")%>년 <%=GetData(1, i, "GRADUT_NM")%> </td>       
					<td><b><%=GetData(1, i, "SCH_NM")%> / <%=GetData(1, i, "TYPE_NM")%></b></td>
					<td><%=GetData(1, i, "MATER_NM")%> (<%=GetData(1, i, "BSL_TSL_NM")%>)</td>
					<td> <%=GetData(1, i, "ABILITY_NM")%> (<%=GetData(1, i, "ABILITY_DEPT_NM")%>)</td>
					<td><%=GetData(1, i, "SCORE")%></td>
				</tr>
				<tr> 
					<th>졸업 논문명</th>       
					<td colspan="4" class=" alignleft"><%=GetData(1, i, "GRADUT_DISSERT_NM")%></td>
				</tr>
                <% 
                        }
                    }
                %>
			</tbody>
		</table>
		<!-- // 03 학력사항  -->

        <%
            string total_work_term = "" ;
            int total_work_days = 0;
            
            if (GetRowCount(2) > 0)
            {
                for (int i = 0; i < GetRowCount(2); i++)
                {
                    string RSN_YEAR = GetData(2, i, "RSN_YEAR");
                    string JOINCOMP_YEAR = GetData(2, i, "JOINCOMP_YEAR");
                    string CAREER_TERM_NM = GetData(2, i, "CAREER_TERM_NM");

                    if (RSN_YEAR != null && RSN_YEAR.Length > 0 && JOINCOMP_YEAR != null && JOINCOMP_YEAR.Length > 0)
                    {
                        try
                        {
                            if (CAREER_TERM_NM.Equals("재직중") == true)
                            {
                                total_work_days += (int)(DateTime.Now - DateTime.Parse(JOINCOMP_YEAR)).TotalDays;
                            }
                            else
                            {
                                total_work_days += (int)(DateTime.Parse(RSN_YEAR) - DateTime.Parse(JOINCOMP_YEAR)).TotalDays;
                            }
                            
                        }
                        catch (Exception e)
                        {

                        }       
                    } 
                   
                }
            }

            if (total_work_days > 0)
            {
                int work_year = total_work_days / 365;
                int work_month = (total_work_days % 365) / 30;

                total_work_term = (work_year > 0) ? work_year.ToString() + "년" : "";
                total_work_term += (work_month > 0) ? " " + work_month.ToString() + "개월" : "";
            }    
        %>

		<!-- 04 경력사항   -->
		<h2 class="sub_title_02"> 경력사항
         <%   if( total_work_term.Length > 0){%>
                  ( <%=total_work_term %>)
         <%}%> 
        </h2>
		<table class="table_search height mB30">
			<colgroup>
				<col width="20%" />
				<col width="17%" />
				<col width="15%" />
				<col width="15%" />
				<col  />
			</colgroup>
            <%
                if (GetRowCount(2) > 0)
                {
                    for (int i = 0; i < GetRowCount(2); i++)
                    {
            %> 
            <% 
                int work_days = 0;

                string RSN_YEAR = GetData(2, i, "RSN_YEAR");
                string JOINCOMP_YEAR = GetData(2, i, "JOINCOMP_YEAR");
                string CAREER_TERM_NM = GetData(2, i, "CAREER_TERM_NM");

                if (RSN_YEAR != null && RSN_YEAR.Length > 0 && JOINCOMP_YEAR != null && JOINCOMP_YEAR.Length > 0)
                {
                    try{
                        if (CAREER_TERM_NM.Equals("재직중") == true)
                        {
                            work_days = (int)(DateTime.Now - DateTime.Parse(JOINCOMP_YEAR)).TotalDays;
                        }
                        else
                        {
                            work_days = (int)(DateTime.Parse(RSN_YEAR) - DateTime.Parse(JOINCOMP_YEAR)).TotalDays;
                        }
                        
                    }
                    catch (Exception e)
                    {

                    } 
                }         
                        
                int work_year = work_days / 365;
                int work_month = (work_days % 365) / 30;
                int work_day = (work_days % 365) % 30;

                string work_term = (work_year > 0) ? work_year.ToString() +"년" : "";
                work_term += (work_month > 0) ? " "+ work_month.ToString() + "개월" : "";
                //work_term += (work_day > 0) ? work_day.ToString() + "일" : "";
            %>
			<tr> 
				<th> 근무기간 (<%=work_term%>) </th>      
				<th>회사명  </th>
				<th>부서/직급/직책   </th>  
				<th>급여 (연봉)   </th>   
				<th>직무내용  </th> 
			</tr>
			<tr>
				<td><%=GetData(2, i, "JOINCOMP_YEAR")%> ~  <%=GetData(2, i, "RSN_YEAR")%> (<%=GetData(2, i, "CAREER_TERM_NM")%>)</td>             
				<td><%=GetData(2, i, "COMPANY_NM")%></td>       
				<td><%=GetData(2, i, "DEPT_NM")%> / <%=GetData(2, i, "POSIT_NM")%> / <%=GetData(2, i, "DUTY_NM")%></td>
				<td><%=GetData(2, i, "SAL")%>만</td>              
				<td><%=GetData(2, i, "JOB_CONT")%></td>
			</tr>
			<tr> 
				<th> 수행프로젝트  </th>       
				<td colspan="5"  class="alignleft">
					<span class="inlineB w90p"><%=GetData(2, i, "PROJECT")%></span> 
				</td>
			</tr>
			<tr> 
				<th> 상세업무  </th>       
				<td colspan="5"  class="alignleft">
					<span class="inlineB w90p"><%=GetData(2, i, "DTL_BUSIN")%></span> 
				</td>
			</tr>
			<tr> 
				<th> 주요 업무성과  </th>       
				<td colspan="5"  class="alignleft">
					<span class="inlineB w90p"><%=GetData(2, i, "MAJOR_JOB_OUTC")%></span> 
				</td>
			</tr>
			<tr> 
				<th> 이직사유   </th>       
				<td colspan="5"  class="alignleft">
					<span class="inlineB w90p"><%=GetData(2, i, "CHANGE_JOB_REASON")%></span> 
				</td>
			</tr>
            <% 
                    }
                }
            %>
		</table>
		<!-- 04 경력사항    -->

		<!-- 05 자격사항   -->
		<h2 class="sub_title_02"> 자격사항  </h2>
		<table class="table_search height mB30">
			<colgroup>
				<col width="25%" />
				<col width="25%" />				
				<col width="25%" />
				<col  />
			</colgroup>
			<tr> 
				<th>자격종류  </th>       
				<th>취득일자  </th>   
				<th>발행처  </th>   
			</tr> 
            <%
                if (GetRowCount(3) > 0)
                {
                    for (int i = 0; i < GetRowCount(3); i++)
                    {
            %> 
			<tr>
				<td><%=GetData(3, i, "CDT_KIND")%></td>          
				<td><%=GetData(3, i, "ACQ_DT")%></td>       
				<td><%=GetData(3, i, "PUB_PLACE")%></td>       
			</tr>
             <% 
                    }
                }
                else
                {
            %>
            <tr><td colspan="3">등록된 자격증이 없습니다.</td></tr>   
            <% 
                }
            %>
		</table>
		<!-- 05 자격사항   -->

		<!-- 06 자기소개서   -->
		<h2 class="sub_title_02"> 자기소개서 </h2>
		<table class="table_search mB30">
			<colgroup>
				<col width="20%"  />
				<col />
			</colgroup>
			<tbody>
				<tr> 
					<th> 성장과정</th>       
					<td>
						<span class="value_box w90p_h100"><%=GetData(0, 0, "INTRO_GROW_PROCESS")%></span> 
					</td>
				</tr> 
				<tr>
					<th>  성격상의 장단점</th>       
					<td>
						<span class="value_box w90p_h100"><%=GetData(0, 0, "INTRO_CHAR__ADV_FAULT")%></span> 
					</td>
				</tr>
				<tr>
					<th> 지원동기</th>
					<td> 
						<span class="value_box w90p_h100"><%=GetData(0, 0, "INTRO_SUPPORT_MOTIVE")%></span> 
					</td>
				</tr>
				<tr>
					<th> 입사 후 포부</th>
					<td> 
						<span class="value_box w90p_h100"><%=GetData(0, 0, "INTRO_JOINCOMP_ASPIRA")%></span> 
					</td>
				</tr>
			</tbody>
		</table>
		<!-- // 06 자기소개서   -->

		<!-- 07 가족사항   -->
		<h2 class="sub_title_02"> 가족사항  </h2>
		<table class="table_search height mB30">
			<colgroup>
				<col width="14.285%" />
				<col width="14.285%" />
				<col width="14.285%" />
				<col width="14.285%" />
				<col width="14.285%" />
				<col width="14.285%" />				
				<col  />
			</colgroup>
			<tr> 
				<th>관계</th>       
				<th>성명</th>   
				<th>연령</th>   
				<th>학력</th>   
				<th>직업</th>
				<th>직장명</th>   
				<th>직위</th>  
			</tr>
            <%
                if (GetRowCount(4) > 0)
                {
                    for (int i = 0; i < GetRowCount(4); i++)
                    {
            %> 
			<tr>
				<td><%=GetData(4, i, "REL_NM")%></td>       
				<td><%=GetData(4, i, "NM")%></td>
				<td><%=GetData(4, i, "AGE")%></td>
				<td><%=GetData(4, i, "ABILITY")%></td>
				<td><%=GetData(4, i, "JOB")%></td>
				<td><%=GetData(4, i, "JOB_NM")%></td>
				<td><%=GetData(4, i, "POSIT")%></td>
			</tr>
            <% 
                    }
                }
                else
                {
            %>
            <tr><td colspan="7">등록된 가족사항이 없습니다.</td></tr>   
            <% 
                }
            %>
		</table>
		<!-- 07 가족사항   -->

        <!-- 08 첨부파일   -->
		<h2 class="sub_title_02"> 첨부파일  </h2>
		<table class="table_search height mB30">
			<colgroup>			
				<col  />
				<col width="30%" />	
			</colgroup>
			<tr> 
				<th>파일명</th>       
				<th>다운로드</th>   
			</tr> 
			<%
                if (GetRowCount(5) > 0)
                {
                    for (int i = 0; i < GetRowCount(5); i++)
                    {
            %> 
			<tr>
				<td><%=GetFileName(GetData(5, i, "FILE_PATH"))%></td>       
				<td><a href="<%=GetData(5, i, "FILE_PATH")%>">다운로드</a></td>
			</tr>
            <% 
                    }
                }
                else
                {
            %>
            <tr><td colspan="2">등록된 첨부파일이 없습니다.</td></tr>
            <% 
                }
            %>
		</table>
		<!-- 08 첨부파일   -->

        <!-- 09 채용공고   -->
		<h2 class="sub_title_02 mT10"> 채용공고</h2>
		<table class="table_search height tdLeft mB30">
			<colgroup>
				<col />
				<col  />
			</colgroup>
			<tbody>
				<tr>
					<th>본 채용을 어떻게 알고 지원하셨나요?</th>       
					<td class="alignleft "><span><%=GetData(0, 0, "SUPPORT_KNOW")%></span> </td>
				</tr>
			</tbody>
		</table>
		<!-- // 01 기본 인적사항  -->

        <% 
            if (GetDataTableCount(6) > 0 && GetData(6, 0, "AUTH_SUB_YN").Equals("N"))
            {
        %>
		<div class="alignleft mB50 mL10 no_print" >
			<label for="name_01" class="w80  inlineB" > 
				 <input type="radio" id="succ_y" name="succ_yn" runat="server"/> 
				 <label  for="name_01">합격</label> 
			</label> 
			<label for="name_02" class="w80  inlineB"> 	
				 <input type="radio" id="succ_n" name="succ_yn" runat="server" /> 
			        <label  for="name_02">불합격 </label>   
			</label> 
		</div>
        <% 
            }
        %>

		<div class="btn_area clearfix no_print" >
			<div class="f_left"><a href="javascript:history.back();"><span class="btn">목록</span></a></div>
			<div class="f_right">
				<a href="javascript:window.print()"><span class="btn"> 인쇄 </span></a>
                <% 
                    if (GetDataTableCount(6) > 0 && GetData(6, 0, "AUTH_SUB_YN").Equals("N"))
                    {
                %>
                <asp:LinkButton ID="btnDel" runat="server" onclick="btnDel_Click" CssClass="btn" OnClientClick="return checkConfirm('D');">삭제</asp:LinkButton>
                <asp:LinkButton ID="btnSave" runat="server" onclick="btnSave_Click" CssClass="btn btn-ok" OnClientClick="return checkConfirm('U');">저장</asp:LinkButton>
                 <% 
                    }
                %>
			</div>
		</div>
	<!--//  wrap_box -->
</div>
</div>
<!--//  CONTENT -->
<script type="text/javascript" >
    var checkConfirm = function (mode) {
        if (mode == "D") {
            if (confirm("삭제하시겠습니까?")) {
                return true;
            }
        } else if (mode == "U") {
            if (confirm("저장하시겠습니까?")) {
                return true;
            }
        } 

        return false;
    }
</script>
</asp:Content>