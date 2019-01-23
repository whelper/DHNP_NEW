<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="job_guide_join_sub.aspx.cs" Inherits="HomePage.recruit.job_guide_join_sub" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content" >
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
	<!--  기본 인적사항    -->
	<article>
		<h1 class="pageTitle_02 blue"> 기본 인적사항  </h1>
		<div class="top_ling2">
			<table  class="table_style_row"  border="1">
				<caption class="hidden">성명,연락처 ,주소,e-mail  기입</caption>
				<colgroup>
					<col style="width:112px;" />
					<col style="width:17%" />
					<col style="width:27%" />
					<col style="width:17%" />
					<col />
				</colgroup>
				<tbody>
					<tr> 
						<th rowspan="5"  class="photo_th">
							<!-- 사진 업로드  -->
							<div>
								<!-- div id="preview" class="add_thumb off"></div-->
                                <img src="/common/images/sub/photo_user.jpg" id="profile_file" style="width:100%; height:100%" alt="" />
                                <label for="profile_file_seq" class="blind acc-hidden">파일경로</label>
								<div class="upload mTL5">
									<button type="button" class="btn_upfile" id="profile_file_seq">업로드</button>
								</div>
								<button type="button" class="ibtn_x off ">삭제</button>
								<!-- // 업로드 버튼  -->
								<p class="img_file_txt">gif 또는 jpg 확장자 <br>
									로 된 파일,  <br>
									100kb 미만의 사진,<br>
									110*146사이즈에 <br>
									맞는 파일만 <br>
									등록 가능
								</p>
								</div>
                                <input type="hidden" runat="server" id="img"/>
								<!-- // 사진 업로드  -->
						</th>       
						<th > <label for="chi_nm">성명(한자)</label></th>       
						<td > <input type="text" id="chi_nm"  name="chi_nm" placeholder="홍길동 (弘吉童)" class="w90p mT_2" /></td>
						<th > <label for="birthday">생년월일</label></th>       
						<td > <input type="text" id="birthday"  name="birthday" placeholder="2000-01-01" class="w85p mT_2" /> </td>
					</tr>
					<tr>
						<th> <label for="tel">전화번호</label></th>
						<td colspan="3"><input type="text"id="tel" name="tel" placeholder="0212345678" class="w95p mT_2" /></td> 
					</tr>
					<tr>
						<th><label for="celltel">핸드폰</label> </th>
						<td colspan="3"><input type="text"id="celltel" name="celltel" placeholder="01012345678" class="w95p mT_2" /></td>
					</tr>
					<tr>
						<th> <label for="email">E-mail</label> </th>
						<td colspan="3"><input type="text" id="email" name="email" class="w95p mT_2" /></td>
					</tr>
					<tr>
						<th><label for="name_01_06">주소</label> </th>       
						<td colspan="3"> 
							<div>
								<!--<input type="text"  id="zipcode_str" name="zipcode_str" title="우편번호 앞자리 " maxlength="3" class="w20p " onfocus="javascript:jop_popupClick(2);" readonly/>
								<span class="inlineB pLR5"> - </span>
								<label for="zipcode_end" class="acc-hidden">우편번호 뒤자리</label> 
								<input type="text"  id="zipcode_end" name="zipcode_end" class="w20p " maxlength="3" style="margin-right:5px;" onfocus="javascript:jop_popupClick(2);" readonly/> 
								<a href="javascript:jop_popupClick(2);" class="button blue2 mL5" >우편번호 검색</a>-->
								<input type="text"  id="zipcode_str" name="zipcode_str" title="우편번호 앞자리 " maxlength="3" class="w20p " readonly/>
								<input type="hidden"  id="zipcode_end" name="zipcode_end" value="000" />
								<a href="javascript:postCode();" class="button blue2 mL5" >우편번호 검색</a>
								
							</div>
							<div>
								<label for="addr" class="acc-hidden ">기본주소</label> 
								<input type="text" id="addr" name="addr" class="w95p " />
							</div>
							<div>
								<label for="addr_dtl" class="acc-hidden ">상세주소</label> 
								<input type="text" id="addr_dtl" name="addr_dtl" class="w95p " />
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</article>
	<!-- //  기본 인적사항    -->

	<!--  지원구분   -->
	<article>
		<h1 class="pageTitle_02 blue">지원구분</h1>
		<div class="top_ling2">
			<table class="table_style_row left_lineNo " border="1">
				<caption class="hidden">지원구분, 지원직무, 지원동기, 희망직급, 희망 근무지, 입사가능일</caption>
				<colgroup>
					<col style="width:96px;"  />
					<col />
				</colgroup>
                <tr>
				    <th scope="row">지원구분</th>
					<td > 
						<span class="select_col3 first">
							<label for="rcm_type" class="acc-hidden">유형</label>
							<select id="rcm_type" name="rcm_type" class="select_basis top">
								<option value="">유형</option>
                                <% 
									for (int i = 0; i < GetRowCount(1); i++)
									{
                                %>
								<option value="<%=GetData(1, i, "COMM_CD") %>"><%=GetData(1, i, "COMM_CD_NM") %></option>
                                <% 
									}
                                %>
							</select>
						</span>
						<span class="select_col3" >
							<label for="rcm_jobgroup" class="acc-hidden">직군</label>
							<select id="rcm_jobgroup" name="rcm_jobgroup" class="select_basis top" >
								<option  value="">직군   </option>
								<% 
									for (int i = 0; i < GetRowCount(2); i++)
									{
                                %>
								<option value="<%=GetData(2, i, "COMM_CD") %>"><%=GetData(2, i, "COMM_CD_NM") %></option>
                                <% 
									}
                                %>
							</select>
						</span>
						<span class="select_col3" >
							<label for="rcm_career" class="acc-hidden">경력구분</label>
							<select id="rcm_career" name="rcm_career" class="select_basis top">
								<option   value="">경력구분</option>
								<% 
									for (int i = 0; i < GetRowCount(3); i++)
									{
                                %>
								<option value="<%=GetData(3, i, "COMM_CD") %>"><%=GetData(3, i, "COMM_CD_NM") %></option>
                                <% 
									}
                                %>
							</select>
						</span>
					</td>
				</tr>
				<tr>
					<th scope="row" class="left_borNo"> 지원직무</th>
					<td> 
						<span class="select_col4 first">
							<label for="duty_no" class="acc-hidden"><%=GetData(4, 0, "UPR_DUTY_NM")%></label>
                            <% 
								if (DutyDs != null && DutyDs.Tables.Count > 0 && DutyDs.Tables[0].Rows.Count > 0)
								{
									for (int i = 0; i < DutyDs.Tables[0].Rows.Count; i++)
									{
										if ((RcmDutyNo).Equals(DutyDs.Tables[0].Rows[i]["DUTY_NO"].ToString())) {%>
                                        <%=DutyDs.Tables[0].Rows[i]["DUTY_NM"] %>
                                    <%}%>
                                <%}%>
                            <%}%>    
						</span>
						</td>
				</tr>
				<tr>
					<th> 희망직급</th>       
					<td class="alignleft " style="padding:0;">
						<p class="row2_p lineB clear">
							<span class="col5 ">
								<input type="radio" name="hope_position_cd" id="rcm_p_director" class="mR5" value="RCM_P_DIRECTOR" />
								<label for="rcm_p_director" class="inlineB">임원</label> 
							</span>	
							<span class="col5  ">
								<input type="radio" name="hope_position_cd" id="rcm_p_dm" class="mR5" value="RCM_P_DM" />
								<label for="rcm_p_dm" class="inlineB">부장</label> 
							</span>
							<span class="col5  ">
								<input type="radio" name="hope_position_cd" id="rcm_p_deputy_gm" class="mR5" value="RCM_P_DEPUTY_GM" />
								<label for="rcm_p_deputy_gm" class="inlineB">차장</label> 
							</span>
							<span class="col5 ">
								<input type="radio" name="hope_position_cd" id="rcm_p_m" class="mR5" value="RCM_P_M" />
								<label for="rcm_p_m" class="inlineB">과장</label> 
							</span>	
							<span class="col5  ">
								<input type="radio" name="hope_position_cd" id="rcm_p_am" class="mR5" value="RCM_P_AM" />
								<label for="rcm_p_am" class="inlineB">대리</label> 
							</span>	
						</p>
						<p class="row2_p  clear ">
							<span class="col5">
								<input type="radio" name="hope_position_cd" id="rcm_p_sc" value="RCM_P_SC" />
								<label for="rcm_p_sc" class="inlineB">주임</label> 
							</span>
							<span class="col5">
								<input type="radio" name="hope_position_cd" id="rcm_p_staff" class="mR5" value="RCM_P_STAFF" />
								<label for="rcm_p_staff" class="inlineB">사원</label> 
							</span>
							<span class="col5">
								<input type="radio" name="hope_position_cd" id="rcm_p_etc" class="mR5" value="RCM_P_ETC" />
								<label for="rcm_p_etc" class="inlineB">기타</label> 
			
							</span>
						</p>
						</td>
				</tr>
				<tr>
					<th  scope="row" class="left_borNo">지원동기</th>
					<td style="padding:0;"> 
						<p  class="row2_p lineB clear">
							<span class="col5 ">
								<input type="radio" name="support_motive" id="rcm_m_recommend" class="mR5" value="RCM_M_RECOMMEND" />
								<label for="rcm_m_recommend" class="inlineB" >추천</label> 
							</span>	
							<span class="col5  " >
								<input type="radio" name="support_motive" id="rcm_m_job_site" class="mR5" value="RCM_M_JOB_SITE" />
								<label for="rcm_m_job_site" class="inlineB" >취업포털</label> 
							</span>
							<span class="col5  " >
								<input type="radio" name="support_motive" id="rcm_m_job_report" class="mR5" value="RCM_M_JOB_REPORT" />
								<label for="rcm_m_job_report" class="inlineB" >취업보도실</label> 
							</span>
							<span class="col5 radio " >
								<input type="radio" name="support_motive" id="rcm_m_search_firm" class="mR5" value="RCM_M_SEARCH_FIRM" />
								<label for="rcm_m_search_firm" class="inlineB" >서칭펌</label> 
							</span>	
							<span class="col5  " >
								<input type="radio" name="support_motive" id="rcm_m_homepage" class="mR5" value="RCM_M_HOMEPAGE" />
								<label for="rcm_m_homepage" class="inlineB" >당사홈페이지</label> 
							</span>	
						</p>
						<p  class="row2_p bor_no clear">
							<span class="inlineB mR5 " >
								<input type="radio" name="support_motive" id="rcm_m_etc" value="RCM_M_ETC" />
								<label for="rcm_m_etc" class="inlineB" >기타</label> 
							</span>	
							<span class="inlineB "  >
								<label for="support_motive_r" class="acc-hidden">기타 내용 입력하기</label> 
								<input type="text" name="support_motive_r" id="support_motive_r" class="w80p" />
							</span>
						</p>
					</td>
				</tr>
				<tr>
					<th scope="row" class="left_borNo">희망근무지</th>
					<td style="padding:0;"> 
						<p  class="row2_p lineB clear">
							<span class="col5">
								<input type="radio" name="hope_work_place" id="rcm_hwp_seoul" class="mR5" value="RCM_HWP_SEOUL" />
								<label for="rcm_hwp_seoul" class="inlineB" >서울</label> 
							</span>	
							<span class="col5">
								<input type="radio" name="hope_work_place" id="rcm_hwp_gyeonggi" class="mR5" value="RCM_HWP_GYEONGGI" />
								<label for="rcm_hwp_gyeonggi" class="inlineB" >경기</label> 
							</span>
							<span class="col5">
								<input type="radio" name="hope_work_place" id="rcm_hwp_gangwon" class="mR5" value="RCM_HWP_GANGWON" />
								<label for="rcm_hwp_gangwon" class="inlineB" >강원도</label> 
							</span>
							<span class="col5">
								<input type="radio" name="hope_work_place" id="rcm_hwp_hwaseong" class="mR5" value="RCM_HWP_HWASEONG" />
								<label for="rcm_hwp_hwaseong" class="inlineB" >공장(화성)</label> 
							</span>	
							<span class="col5">
								<input type="radio" name="hope_work_place" id="rcm_hwp_busan" class="mR5" value="RCM_HWP_BUSAN" />
								<label for="rcm_hwp_busan" class="inlineB" >부산/경남</label> 
							</span>	
						</p>
						<p  class="row2_p bor_no clear">
							<span class="col5 ">
								<input type="radio" name="hope_work_place" id="rcm_hwp_daegu" class="mR5" value="RCM_HWP_DAEGU" />
								<label for="rcm_hwp_daegu" class="inlineB" >대구/경북</label> 
							</span>	
							<span class="col5  " >
								<input type="radio" name="hope_work_place" id="rcm_hwp_gwangju" class="mR5" value="RCM_HWP_GWANGJU" />
								<label for="rcm_hwp_gwangju" class="inlineB" >광주/전남북</label> 
							</span>
							<span class="col5  " >
								<input type="radio" name="hope_work_place" id="rcm_hwp_daejeon" class="mR5" value="RCM_HWP_DAEJEON" />
								<label for="rcm_hwp_daejeon" class="inlineB" >대전/충청</label> 
							</span>
							<span class="col5 " >
								<input type="radio" name="hope_work_place" id="rcm_hwp_etc" class="mR5" value="RCM_HWP_ETC" />
								<label for="rcm_hwp_etc" class="inlineB" >기타</label> 
							</span>	
						</p>
						</td>
				</tr>
				<tr>
					<th scope="row" class="left_borNo">입사가능일</th>
					<td> 
						<input type="text" name="start_hwp_date" title="특정 기간 시작 날짜" class="date_in" id="datepicker" onchange="setDatepicker()" readonly/>
                        <input type="hidden" id="joincomp_pb_date" name="joincomp_pb_date" />
					</td>
				</tr>
                <tr>
                    <th scope="row" class="left_borNo">희망연봉</th>
					<td>
                        <input type="text" id="salary_req" name="salary_req" class="w60p" />
					</td>
				</tr>
			</table>
		</div>
	</article>
	<!--  // 지원구분   -->

	<!--  학교   -->
	<article>
		<h1 class="pageTitle_02 blue">학력사항 - 고등학교</h1>
		<!--  고등학교   -->
		<div class="line_top2_bott1">
			<table class="table_style_row01"  border="1">
				<caption class="hidden">대학교 입학졸업 정보 입력하기</caption>
				<colgroup>
					<col style="width:16%" />
					<col style="width:17%" />
					<col style="width:17%" />
					<col style="width:25%" />
					<col style="width:25%" />				
				</colgroup>
				<tr>
					<th class="left_lineNo lineB">
						<label for="hs_nm">고등학교</label>
					</th>
					<td colspan="2" >
						<input type="text" id="hs_nm" name="hs_nm" style="width:93%" placeholder="대한고등학교" />
					</td>
                    <td>
						<select id="rcm_stead_catg" name="rcm_stead_catg" style="width:96%">
							<option value="">소재지</option>
                            <% 
								for (int i = 0; i < GetRowCount(5); i++)
								{
                            %>
							<option value="<%=GetData(5, i, "COMM_CD") %>"><%=GetData(5, i, "COMM_CD_NM") %></option>
                            <%      
								}
                            %>
						</select>
					</td>
					<td >
						<input type="checkbox" id="qual_exam_yn" name="qual_exam_yn" value="Y" style="float:left;width:15px; margin:12px 5px 0 0;" />
						<label for="qual_exam_yn"  style="width:100px; float:left;">대입 검정고시</label>
					</td>
				</tr>
				<tr>
					<th class="left_lineNo lineB">
						<label for="sch_04">졸업연도</label>
					</th>
					<td >
						<select id="hs_grad_date" name="hs_grad_date" style="width:100px !important; float:left;">
                        <% 
							for (int i = NowYear + 1; i > NowYear - 60; i--)
							{
                        %>
							<option value="<%=i %>"><%=i %></option>
                        <% 
							}
                        %>
						</select>
					</td>
					<td>
						<label for="hs_grad_select_catg" class="acc-hidden">졸업선택</label>
                        <select id="hs_grad_select_catg" name="hs_grad_select_catg" style="width:96%">
							<option value="">졸업선택</option>
                        <% 
							for (int i = 0; i < GetRowCount(6); i++)
							{
                        %>
						<option value="<%=GetData(6, i, "COMM_CD") %>"><%=GetData(6, i, "COMM_CD_NM") %></option>
                        <%      
							}
                        %>
                        </select>
					</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th class="left_lineNo">
						<label for="rcm_major_catg" >전공</label> 
					</th>
					<td>
                        <select id="rcm_major_catg" name="rcm_major_catg" style="width:96%">
							<option value="">전공선택</option>
                        <% 
							for (int i = 0; i < GetRowCount(7); i++)
							{
                        %>
						<option value="<%=GetData(7, i, "COMM_CD") %>"><%=GetData(7, i, "COMM_CD_NM") %></option>
                        <%      
							}
                        %>
                        </select>
					</td>
					<td colspan="3"></td>
				</tr>
			</table>
		</div>
		<!-- // 고등학교      -->

		<!--  대학교    -->
		<h1 class="pageTitle_02 blue">학력사항 - 대학/대학교 /대학원</h1>
		<div class="btn_plus">
			<button type="button" id="college_add_btn" class="button next">추가</button>
		</div>
		<div class="top_ling2">
			<table class="table_style_row left_lineNo " border="1">
				<caption class="hidden">대학교  입학졸업 정보 입력하기</caption>
				<colgroup>
					<col style="width:15%" />
					<col style="width:70%" />
					<col style="width:5%" />					
				</colgroup>
                <tbody id="college_add">
				    <tr class = "line1">
					    <th scope="col" class="left_lineNo ">분류</th>
					    <td>
						    <p class="row2_p  clear">
							    <span class="col5">
								    <input type="radio" name="type_cd1" id="sch_11" checked="checked" class="mR5" value="RCM_AC_COLLEGE_2_3" />
								    <label for="sch_11" class="inlineB">대학(2,3년)</label> 
							    </span>	
							    <span class="col5">
								    <input type="radio" name="type_cd1" id="sch_12" class="mR5" value="RCM_AC_COLLEGE_4" />
								    <label for="sch_12" class="inlineB">대학교(4년)</label> 
							    </span>
							    <span class="col5">
								    <input type="radio" name="type_cd1" id="sch_13" class="mR5" value="RCM_AC_GRADUATE_SCH" />
								    <label for="sch_13" class="inlineB">대학원</label> 
							    </span>	
						    </p>
                            <input type="hidden" name="col_catg_num" id="col_catg_num" class="mR5" value="1" />
					    </td>
					    <td rowspan="6"> 
						    <button type="button" class="btn_basket" id="college_del" onclick="javascript:alert('첫번째 내용은 삭제할 수 없습니다.\n해당사항이 없는 경우 공란으로 두시면 됩니다.');">삭제하기</button>
					    </td>
				    </tr>
				    <tr class = "line1">
					    <th scope="col" class="left_lineNo "> 
						    <label for="sch_nm1">학교명</label>
					    </th>
					    <td>
						    <input type="text" id="sch_nm1" name="sch_nm" placeholder="서울대학 " />
						    <select id="mater_cd1" name="mater_cd" >
						        <option value="">소재지</option>
						        <% 
									for (int i = 0; i < GetRowCount(5); i++)
									{
                                %>
							    <option value="<%=GetData(5, i, "COMM_CD") %>"><%=GetData(5, i, "COMM_CD_NM") %></option>
                                <%      
									}
                                %>
					        </select>
					        <select id="bsl_tsl_cd1" name="bsl_tsl_cd">
						        <option value="RCM_AT_MY_SCH">본교</option>
						        <option value="RCM_AT_BRANCH">분교</option>
					        </select>
					    </td>
				    </tr>
				    <tr class = "line1">
					    <th scope="col" class="left_lineNo ">
						    <label for="admis_year">재학기간</label> 
					    </th>
					    <td>
						    <select id="admis_year1" name="admis_year" >
							    <% 
									for (int i = NowYear; i > NowYear - 60; i--)
									{
                                %>
							        <option value="<%=i %>"><%=i %></option>
                                <% 
									}
                                %>
						    </select>
                            <select id="admis_cd1" name="admis_cd">
							    <option value="RCM_TC_ADMISSION">입학</option>
							    <option value="RCM_TC_TRANSFER">편입</option>
						    </select>
						    ~
						    <label for="gradut_year1" class="acc-hidden">졸업</label> 
						    <select id="gradut_year1" name="gradut_year" >
							    <% 
									for (int i = NowYear; i > NowYear - 60; i--)
									{
                                %>
							        <option value="<%=i %>"><%=i %></option>
                                <% 
									}
                                %>
						    </select>
                            <select id="gradut_cd1" name="gradut_cd">
						        <option value="RCM_GS_GRADUATION">졸업</option>
						        <option value="RCM_GS_GRADUAND">졸업예정</option>
						        <option value="RCM_GS_COMPLETE">수료</option>
						        <option value="RCM_GS_LOA">휴학</option>
						        <option value="RCM_GS_DROPOUT">중퇴</option>
					        </select>
					    </td>
				    </tr>	
				    <tr class = "line1">
					    <th scope="col" class="left_lineNo ">계열선택</th>
					    <td >
						    <select id="ability_cd1" name="ability_cd" style="width:137px;">
							    <option value="RCM_AL_LANG">어문학</option>
							    <option value="RCM_AL_HUMANITIES">인문학과</option>
							    <option value="RCM_AL_SOCIOLOGY">사회학과</option>
							    <option value="RCM_AL_NATURAL_SC">자연과학</option>
							    <option value="RCM_AL_ENGINEERING">공학</option>
							    <option value="RCM_AL_LAW">법학</option>
							    <option value="RCM_AL_JURISDICTION">사법학</option>
							    <option value="RCM_AL_BUSIN">상경</option>
							    <option value="RCM_AL_LIFE_SC">생활 과학</option>
							    <option value="RCM_AL_ART">예/체능학</option>
							    <option value="RCM_AL_RELIGION">종교학</option>
							    <option value="RCM_AL_MEDICINE">의/약학</option>
							    <option value="RCM_AL_AC_FISH">농/수산</option>
							    <option value="RCM_AL_OCEANO">해양학</option>
							    <option value="RCM_AL_ETC">기타</option>
						    </select>
						    <label for="ability_dept_nm1" class="acc-hidden">계열선택</label>
						    <input type="text" id="ability_dept_nm1" name="ability_dept_nm" style="width:200px;" />
					    </td>
				    </tr>
				    <tr class = "line1">
					    <th scope="col" class="left_lineNo "> 
						    <label for="score1">학점</label> 
						    </th>
					    <td >
						    <input type="text" id="score1" name="score" />
					    </td>
				    </tr>
				    <tr class = "line1">
					    <th scope="col" class="left_lineNo ">
						    <label for="gradut_dissert_nm1">졸업논문</label> 
					    </th>
					    <td >
						    <input type="text" id="gradut_dissert_nm1" name="gradut_dissert_nm" style="width:97.5%" />
					    </td>
				    </tr>	
                </tbody>						
			</table>
		</div>
		<!-- // 대학교  -->
	</article>
	<!--  // 학교   -->		

	<!--  경력사항    -->		
	<article>
		<h1 class="pageTitle_02 blue">경력사항</h1>
		<div class="btn_plus">
			<button type="button" id="career_add_btn" class="button next" >추가</button>
		</div>
		<div class="top_ling2">
			<table class="table_style_row left_lineNo " border="1">
				<caption class="hidden">경력사항 정보 입력하기</caption>
				<colgroup>
					<col style="width:15%" />
					<col style="width:70%" />
					<col style="width:5%" />					
				</colgroup>
                <tbody id="career_add">
				    <tr class="careerLine1">
					    <th scope="col" class="left_lineNo ">
						    <label for="company_nm1" >회사명</label>    
					    </th>
					    <td>
						    <input type="text" id="company_nm1" name="company_nm" style="width:97.5%" />
					    </td>
					    <td rowspan="9"> 
						    <button type="button" class="btn_basket" onclick="alert('첫번째 항목은 삭제할 수 없습니다. 해당사항이 없는 경우 비워두시기 바랍니다.');">삭제하기</button>
					    </td>
				    </tr>
				    <tr class="careerLine1">
					    <th scope="col" class="left_lineNo "> 
						    <label for="datepicker2">근무기간</label> 
					    </th>
					    <td>
						    <input type="text" id="start_date1" name="start_date" title="입사 날짜" class="date_in datepicker" />  ~
						    <label for="datepicker3" class="acc-hidden">회사명</label>    
						    <input type="text" id="end_date1" name="end_date" title="퇴사  날짜" class="date_in datepicker" />  
						    <select id="career_term_cd1" name="career_term_cd" style="width:150px;">
							    <option value="RCM_CC_RESIGN">퇴사</option>
							    <option value="RCM_CC_IN_OFFICE">재직중</option>
						    </select>
					    </td>
				    </tr>
				    <tr class="careerLine1">
					    <th scope="col" class="left_lineNo "> 
						    <label for="dept_nm1">부서/직급/직책</label> 
					    </th>
					    <td>
						    <input type="text" id="dept_nm1" name="dept_nm" placeholder="대한기획팀 " style="width:200px;" /> 
						    <select id="posit_cd1" name="posit_cd">
						        <option>직급선택</option>
						        <option value="RCM_RP_STAFF">사원(연구원)</option>
						        <option value="RCM_RP_SC">주임/계장 (연구원)</option>
						        <option value="RCM_RP_AM">대리(주임연구원)</option>
						        <option value="RCM_RP_M">과장(선임연구원)</option>
						        <option value="RCM_RP_GM">차장 (수석연구원)</option>
						        <option value="RCM_RP_DM">부장 (연구소장)</option>
						        <option value="RCM_RP_DIRECTOR">임원</option>
					        </select>
						    <select id="duty_cd1" name="duty_cd">
							    <option>직책선택</option>
							    <option value="RCM_DC_MEMBER">팀원</option>
							    <option value="RCM_DC_LEADER">팀장</option>
							    <option value="RCM_DC_MANAGER">매니저</option>
							    <option value="RCM_DC_PART">파트장</option>
							    <option value="RCM_DC_DEPT">실장</option>
							    <option value="RCM_DC_BRANCH">지점장</option>
							    <option value="RCM_DC_RB">지사장</option>
							    <option value="RCM_DC_DIRECTOR">원장</option>
							    <option value="RCM_DC_DG">국장</option>
							    <option value="RCM_DC_DH">본부장</option>
							    <option value="RCM_DC_CD">센터장</option>
							    <option value="RCM_DC_PLANT">공장장</option>
							    <option value="RCM_DC_GROUP">그룹장</option>
						    </select>
					    </td>
				    </tr>	
				    <tr class="careerLine1">
					    <th scope="col" class="left_lineNo "> 
						    <label for="sal1">급여 (연봉)</label> 
					    </th>
					    <td>
						    <input type="text" id="sal1" name="sal" placeholder="3,000~4,000" style="width:97.5%" />
					    </td>
				    </tr>
				    <tr class="careerLine1">
					    <th scope="col" class="left_lineNo "> 
						    <label for="job_cont1">직무내용</label> 
					    </th>
					    <td>
						    <input type="text" id="job_cont1" name="job_cont"  placeholder="기획 및 제안서 작성 " style="width:97.5%;" />
					    </td>
				    </tr>
				    <tr class="careerLine1">
					    <th scope="col" class="left_lineNo "> 
						    수행프로젝트 
					    </th>
					    <td style="line-height:0;">
						    <textarea id="project1" name="project" rows="7"  style="width:97%;"></textarea>
					    </td>
				    </tr>
				    <tr class="careerLine1">
					    <th scope="col" class="left_lineNo "> 
						    상세업무 
					    </th>
					    <td style="line-height:0;">
						    <textarea id="dtl_busin1" name="dtl_busin" rows="7" style="width:97%;"></textarea>
					    </td>
				    </tr>	
				    <tr class="careerLine1">
					    <th scope="col" class="left_lineNo "> 
						    주요 업무성과
					    </th>
					    <td style="line-height:0;">
						    <textarea id="major_job_outc1" name="major_job_outc" rows="7"  style="width:97%;"></textarea>
					    </td>
				    </tr>
				    <tr class="careerLine1">
					    <th scope="col" class="left_lineNo "> 
						    이직사유 
					    </th>
					    <td style="line-height:0;" >
						    <textarea id="change_job_reason1" name="change_job_reason" rows="7"  style="width:97%;"></textarea>
					    </td>
				    </tr>	
                </tbody>				
			</table>

            <input type="hidden" name="career_num" id="career_num" class="mR5" value="1" />
		</div>
	</article>
	<!-- // 경력사항   -->

	<!-- 자격사항 -->
	<article>
		<h1 class="pageTitle_02 blue">자격사항</h1>
		<div class="btn_plus">
			<button type="button" id="qf_add_btn" class="button next" >추가</button>
		</div>
		<div class="line_top2_bott1">
			<table class="table_style_row01 " border="1">
				<caption class="hidden">자격사항 내용 입력</caption>
				<colgroup>
					<col style="width:31.5%" />
					<col style="width:31.5%" />
					<col style="width:31.5%" />	
					<col />
				</colgroup>
				<tr>
					<th scope="col" class="left_lineNo">자격종류</th>
					<th scope="col" >취득일자</th>
					<th scope="col" >발행처</th>
					<th scope="col" >&nbsp;</th>
				</tr>
                <tbody id="qf_add">
				    <tr class="qfLine1">
					    <td class="left_lineNo center"> 
						    <label for="cdt_kind1" class="acc-hidden">운전면허</label>
						    <input type="text" id="cdt_kind1" name="cdt_kind" />
					    </td>
					    <td>
						    <label for="acq_dt1" class="acc-hidden">취득일자</label>
						    <input type="text" id="acq_dt1" name="acq_dt" maxlength="10"/>
						    </td>
					    <td>
						    <label for="pub_place" class="acc-hidden">발행처</label>
						    <input type="text" id="pub_place" name="pub_place" />
					    </td>
					    <td class="icon" > 
						    <button type="button" class="btn_basket" onclick="alert('첫번째 항목은 삭제할 수 없습니다. 해당사항이 없는 경우 비워두시기 바랍니다.');">삭제하기</button>
					    </td>
				    </tr>
                </tbody>
			</table>

            <input type="hidden" name="cdt_num" id="cdt_num" class="mR5" value="1" />
		</div>
	</article>
	<!-- // 자격사항 -->
	<!--  자기소개서    -->
	<article>
		<h1 class="pageTitle_02 blue">자기소개서</h1>
		<div class="line_top2_bott1">
			<table class="table_style_row01 lineheight_no" border="1">
				<caption class="hidden">가족사항  내용 입력</caption>
				<colgroup>
					<col style="width:20%" />
					<col />
				</colgroup>
				<tr>
					<th scope="row" class="left_lineNo lineB">
							<label for="intro_grow_process">성장과정<br /></label> 
					</th>
					<td >
						<textarea id="intro_grow_process" name="intro_grow_process" rows="6" cols="90" style="width:97%;"></textarea>
					</td>
				</tr>
				<tr>
					<th scope="row" class="left_lineNo lineB"> 
						<label for="intro_char__adv_fault">성격상의 장단점<br /></label>     
					</th>
					<td >
						<textarea id="intro_char__adv_fault" name="intro_char__adv_fault" rows="6" cols="90" style="width:97%;"></textarea>
					</td>
				</tr>
				<tr>
					<th scope="row" class="left_lineNo lineB"> 
						<label for="intro_support_motive">지원동기<br /></label>     
					</th>
					<td >
						<textarea id="intro_support_motive" name="intro_support_motive" rows="6" cols="90" style="width:97%;"></textarea>
					</td>
				</tr>
				<tr>
					<th scope="row" class="left_lineNo"> 
						<label for="intro_joincomp_aspira">입사 후 포부<br /></label>     
					</th>
					<td >
						<textarea id="intro_joincomp_aspira" name="intro_joincomp_aspira" rows="6" cols="90" style="width:97%;"></textarea>
					</td>
				</tr>
			</table>
		</div>
	</article>
	<!-- // 자기소개서        -->
			
	<!--  가족 사항    -->	
	<article>
		<h1 class="pageTitle_02 blue">가족사항</h1>
		<div class="btn_plus">
			<button type="button" id="family_add_btn" class="button next">추가</button>
		</div>
		<div class="line_top2_bott1">
			<table class="table_style_row01 " border="1">
				<caption class="hidden">가족사항  내용 입력</caption>
				<colgroup>
					<col style="width:13%" />
					<col style="width:14%" />
					<col style="width:10%" />
					<col style="width:14%" />
					<col style="width:13%" />
					<col style="width:18%" />
					<col style="width:13%" />					
					<col />
				</colgroup>
				<tr>
					<th scope="col" class="left_lineNo">관계</th>
					<th scope="col" >성명</th>
					<th scope="col" >연령</th>
					<th scope="col" >학력</th>
					<th scope="col" >직업</th>
					<th scope="col" >직장명</th>
					<th scope="col" >직위</th>
					<th scope="col" >&nbsp;</th>
				</tr>
                <tbody id="family_add">
				    <tr class="familyLine1">
					    <td class="left_lineNo center"> 
						    <label for="rel1" class="acc-hidden">관계 선택</label>
						    <select id="rel1" name="rel" >
							    <option value="">선택</option>
							    <option value="RCM_FC_FATHER">부</option>
							    <option value="RCM_FC_MOTHER">모</option>
							    <option value="RCM_FC_WIFE">아내</option>
							    <option value="RCM_FC_HUSBAND">남편</option>
							    <option value="RCM_FC_OLD_SISTER">누나(언니)</option>
							    <option value="RCM_FC_OLD_BROTHER">형(오빠)</option>
							    <option value="RCM_FC_BROTHER">남동생</option>
							    <option value="RCM_FC_SISTER">여동생</option>
							    <option value="RCM_FC_GRANDFATHER">조부</option>
							    <option value="RCM_FC_GRANDMOTHER">조모</option>
							    <option value="RCM_FC_CHILDREN">자녀</option>
							    <option value="RCM_FC_ETC">기타</option>
						    </select>
					    </td>
					    <td>
						    <label for="nm1" class="acc-hidden">성명</label>
						    <input type="text" id="nm1" name="nm" class="w84p" placeholder="이름입력">
					    </td>
					    <td>
						    <label for="age1" class="acc-hidden">연령</label>
						    <input type="text" id="age1" name="age" class="w80p" placeholder="연령입력">
						    </td>
					    <td>
						    <label for="ability1" class="acc-hidden">학력</label>
						    <input type="text" id="ability1" name="ability" class="w84p" placeholder="학력입력">
					    </td>
					    <td>
						    <label for="job1" class="acc-hidden">직업</label>
						    <input type="text" id="job1" name="job" class="w80p" placeholder="직업입력">
						    </td>
					    <td> 
						    <label for="job_nm1" class="acc-hidden">직장명</label>
						    <input type="text" id="job_nm1" name="job_nm" placeholder="직장명입력">
					    </td>
					    <td> 
						    <label for="posit1" class="acc-hidden">직위</label>
						    <input type="text" id="posit1" name="posit" class="w84p" placeholder="직위입력">
					    </td>
					    <td class="icon" > 
						    <button type="button" class="btn_basket" onclick="alert('첫번째 항목은 삭제할 수 없습니다. 해당사항이 없는 경우 비워두시기 바랍니다.');">삭제하기</button>
					    </td>
				    </tr>
                <tbody>
			</table>

            <input type="hidden" name="family_num" id="family_num" class="mR5" value="1" />
		</div>
	</article>	
	<!-- // 가족 사항        -->


    <!-- 첨부파일 -->
	<article>
		<h1 class="pageTitle_02 blue"> 첨부파일 </h1>
				
		<div class="line_top2_bott1">
			<table class="table_style_row01 " border="1">
				<caption class="hidden"> 첨부파일 내용 입력   </caption>
				<colgroup>
					<col>
				</colgroup>
				<tr>
					<th scope="col" class="left_lineNo"> 추가적으로 첨부하실 파일을 올려주세요. (파일명은 영문 또는 숫자만 가능합니다.) </th>
				</tr>
				<tr>
					<td class="file"> 

						<div class="input-group">
							<span class="input-group-btn">
								<span class="btn btn-primary btn-file">
									파일첨부 <asp:FileUpload ID="attach_file_1" runat="server" />
								</span>
							</span>
							<input type="text" class="form-control" readonly="">
						</div>
						<div class="input-group">
							<span class="input-group-btn">
								<span class="btn btn-primary btn-file">
									파일첨부 <asp:FileUpload ID="attach_file_2" runat="server" />
								</span>
							</span>
							<input type="text" class="form-control" readonly="">
						</div>
						<div class="input-group">
							<span class="input-group-btn">
								<span class="btn btn-primary btn-file">
									파일첨부 <asp:FileUpload ID="attach_file_3" runat="server" />
								</span>
							</span>
							<input type="text" class="form-control" readonly="">
						</div>
					</td>
				</tr>
			</table>
		</div>
	</article>

	<!-- 채용공고 -->
	<article>
		<h1 class="pageTitle_02 blue"> 채용공고 </h1>
				
		<div class="line_top2_bott1">
			<table class="table_style_row" border="1">
				<caption class="hidden"> 채용공고 정보 입력   </caption>
				<colgroup>
					<col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="left_lineNo" style="padding:7px 0;"> 본 채용을 어떻게 알고 지원하셨나요?  </th>
					</tr>
				</thead>
				<tbody>
					
					<tr>
						<td>
							<p class="row2_p  clear">
								<span class="col5" style="width:15%">
									<input type="radio" name="support_know_cd" id="support_know_cd1" checked="checked" class="mR5" value="support_know_cd1">
									<label for="support_know_cd1" class="inlineB">웹사이트</label> 
								</span>
								<select id="selct_support_know_cd" name="selct_support_know_cd" style="width:137px;">
								<option value="">선택하세요</option>
								<option value="대한뉴팜">대한뉴팜</option>
								<option value="사람인">사람인</option>
								<option value="잡코리아">잡코리아</option>
								<option value="Bric">Bric</option>
								<option value="사람인">직접입력</option>
							</select>
							<input type="text" name="support_direcrt" id="support_direcrt" class="mL5" value="">
							</p>
						</td>
					
					</tr>
					<tr>
						<td>
							<p class="row2_p  clear">
								<input type="radio" name="support_know_cd" id="support_know_cd2" checked="checked" class="mR5" value="support_know_cd2">
								<label for="support_know_cd2" class="inlineB">지인추천</label> 
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<p class="row2_p  clear">
								<input type="radio" name="support_know_cd" id="support_know_cd3" checked="checked" class="mR5" value="support_know_cd3">
								<label for="support_know_cd3" class="inlineB">지면광고</label> 
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<p class="row2_p  clear">
								<span class="col5" style="width:15%">
									<input type="radio" name="support_know_cd" id="support_know_cd4" checked="checked" class="mR5" value="support_know_cd4">
									<label for="support_know_cd4" class="inlineB">기타</label>
								</span>
								<input type="text" name="support_etc" id="support_etc" class="mR5" value="">
							</p>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</article>

   
	<script>
	    $(document).on('change', '.btn-file :file', function () {
	        var input = $(this),
				numFiles = input.get(0).files ? input.get(0).files.length : 1,
				label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
	        input.trigger('fileselect', [numFiles, label]);
	    });

	    $(document).ready(function () {
	        $('.btn-file :file').on('fileselect', function (event, numFiles, label) {
	            var input = $(this).parents('.input-group').find(':text'),
					log = numFiles > 1 ? numFiles + ' files selected' : label;
	            if (input.length) {
	                input.val(log);
	            } else {
	                if (log) alert(log);
	            }
	        });
	    });
	</script>
	<!-- // 첨부파일 -->



	<div class="right">
        <!--
		<button type="button" onclick="javascript:send();" class="button next">저장하기</button>
        
		<button type="button" OnClientClick="javascript:send();"  class="button next">제출하기</button>
        -->
        <asp:LinkButton ID="btnSave" runat="server" onclick="btnSave_Click" CssClass="button next" OnClientClick="return CheckValid();">제출하기</asp:LinkButton>
	</div>

	<!-- // 내용 ***************** -->
</section>  <!--// sub_content -->

<div class="pop_wrap" id="pop_wrap_01" style="display:none">
	<div class="pop_wrap_alpha"></div>
	<div  id="popupContainer_01" >
		<section class="popupContent" >
			<h1 class="no"  >입사지원 완료</h1>
			<div class="lineBox_1">
					<p class="job_ok_neme">
						<strong class="i_my">입사지원이 완료되었습니다.</strong>
					</p>
			</div>
			<button type="button" onclick="jop_popupClose(1);location.href='job_guide_list.aspx';" class="button green w310">확인</button>
		</section> 		                                 
    </div>											
</div>

<!-- popup  우편 번호   **-->
<div class="pop_wrap" id="pop_wrap_02"  style="display:none; ">
	<div class="pop_wrap_alpha"></div>
	<div  id="popupContainer_02" >
		<section class="popupContent " >
			<h1 class="popup_title_01">우편번호 검색</h1>
			<div class="lineBox clear">
				<div class="zone_search">
					<label for="nameZ_01" >지역명</label>
					<input type="text" id="nameZ_01" placeholder="지역명">
					<button type="button" class="button blue w100" onclick="javascript:search_zipcode();">검색</button>
				</div>
			</div>  
			<div class="mB20"  >
				<table class="table_scroll_box  scrollTable" >
					<thead>
						<tr>
							<th style="width:30%;">우편번호 검색</th>
							<th> 주소 </th>
						</tr>
					</thead>
					<tbody id="tbody_ziplist"></tbody>
				</table>
			</div>

            <input type="hidden" id="reg_seq_no" name="reg_seq_no" value="<%=RegSeqNo%>" />

            <button type="button" onclick="jop_popupClose(2); return false;" class="button green w310">닫기</button>
		</section> 
    </div>											
</div>
<!-- // popup  우편 번호   **-->

<script type="text/javascript" src="/common/js/upclick-min.js"></script>
<script type="text/javascript" src="/common/js/jquery.scrolltable.js"></script>
<script type="text/javascript">
    $(function () {
        $("table.scrollTable").scrolltable({
            stripe: true,
            oddClass: 'odd',
            maxHeight: 300
        });
    });
</script>

<script type="text/javascript">
    $( document ).ready(function() {
        <%
	if (LoadType.Equals("") == false)
	{
        %>
        $("#pop_wrap_01").attr("style","display:block");
        <% 
	}
        %>
    });

    var search_zipcode = function() {
        var text = $("#nameZ_01").val();
        if (text == "") {
            alert("지역명을 입력해 주세요.");
        } else {        
            $.ajax({
                type: "POST"
                , cache: false
                , url: "/ws/common.asmx/GetZipcode"
                , data: {
        	        "text" : text
                }
                , async: false
                , dataType: "text" // Debugging을 위해 일단 TEXT로 받는다.
                , success: function(xml, status) {
        	        if (xml == null) {
        		        alert("데이터를 가져오지 못했습니다.");
        	        } else {
        		        var xmlDoc = $.parseXML(xml);
        		
        		        var html = "";

                        $(xmlDoc).find("Zipcode").each(function() {
                            html+='<tr>';
		                    html+='<td><a href="javascript:send_zipcode(\''+ $(this).find("ZIP_1").text() +'\',\''+ $(this).find("ZIP_2").text() +'\',\''+ $(this).find("FULL_ADDR").text() +'\');">'+ $(this).find("ZIPCODE").text() +'</a></td>';
		                    html+='<td><a href="javascript:send_zipcode(\''+ $(this).find("ZIP_1").text() +'\',\''+ $(this).find("ZIP_2").text() +'\',\''+ $(this).find("FULL_ADDR").text() +'\');">'+ $(this).find("FULL_ADDR").text() +'</a></td>';
	                        html+='</tr>';
                        });
        		
                        $("#tbody_ziplist").empty();
        		        $("#tbody_ziplist").append(html);
        	        }
	            }
	            , error : function(xhr, textStatus) {
                    alert("네트워크 오류 또는 요청을 처리할 수 없습니다.");
                }
	            ,complete : function(xhr, textStatus) {
		        }
            });
        }
    }

    var send_zipcode = function(zipcode_str, zipcode_end, addr) {
        $("#zipcode_str").val(zipcode_str);
        $("#zipcode_end").val(zipcode_end);
        $("#addr").val(addr);

        jop_popupClose(2);
    }

    function setDatepicker() {
        $("#joincomp_pb_date").val($("#datepicker").val());
    }

    function CheckValid() {
        var result = false;
        var support_know_cd = $(':radio[name="support_know_cd"]:checked').val();

        if ($("#chi_nm").val() == "") {
            alert("이름을 입력해 주세요.");
            $("#chi_nm").focus();
        } else if ($("#birthday").val() == "") {
            alert("생년월일을 입력해 주세요.");
            $("#birthday").focus();
        } else if ($("#tel").val() == "") {
            alert("전화번호를 입력해 주세요.");
            $("#tel").focus();
        } else if ($("#celltel").val() == "") {
            alert("핸드폰 번호를 입력해 주세요.");
            $("#celltel").focus();
        } else if ($("#email").val() == "") {
            alert("E-mail을 입력해 주세요.");
            $("#email").focus();
        } else if ($("#zipcode_str").val() == "") {
            alert("우편번호를 입력해 주세요.");
            $("#zipcode_str").focus();
        } else if ($("#zipcode_end").val() == "") {
            alert("우편번호를 입력해 주세요.");
            $("#zipcode_end").focus();
        } else if ($("#addr").val() == "") {
            alert("주소를 입력해 주세요.");
            $("#addr").focus();
        } else if ($("#addr_dtl").val() == "") {
            alert("주소를 입력해 주세요.");
            $("#addr_dtl").focus();

        } else if ($('#rcm_type > option:selected').val() == "") {
            alert("지원구분유형을 선택해 주세요.");
        } else if ($('#rcm_jobgroup > option:selected').val() == "") {
            alert("지원구분직군을 선택해 주세요.");
        } else if ($('#rcm_career > option:selected').val() == "") {
            alert("지원구분경력을 선택해 주세요.");

        } else if ($(':radio[name="hope_position_cd"]:checked').length < 1) {
            alert("희망직급을 선택해 주세요.");
        } else if ($(':radio[name="support_motive"]:checked').length < 1) {
            alert("지원동기를 선택해 주세요.");
        } else if ($(':radio[name="hope_work_place"]:checked').length < 1) {
            alert("희망근무지를 선택해 주세요.");
        } else if ($("#datepicker").val() == "") {
            alert("입사가능일을 입력해 주세요.");

        } else if ($("#intro_grow_process").val() == "") {
            alert("자기소개서 성장과정을 입력해 주세요.");
            $("#intro_grow_process").focus();
        } else if ($("#intro_char__adv_fault").val() == "") {
            alert("자기소개서 성격상의 장단점을 입력해 주세요.");
            $("#intro_char__adv_fault").focus();
        } else if ($("#intro_support_motive").val() == "") {
            alert("자기소개서 지원동기를 입력해 주세요.");
            $("#intro_support_motive").focus();
        } else if ($("#intro_joincomp_aspira").val() == "") {
            alert("입사 후 포부를 입력해 주세요.");
            $("#intro_joincomp_aspira").focus(); 
  
        } else if (support_know_cd == "support_know_cd1" && $('#support_direcrt').val() == "" ) {
            alert("채용공고를 입력해주세요.");
            $("#selct_support_know_cd").focus();
        } else if (support_know_cd == "support_know_cd4" && $('#support_etc').val() == "" ) {
            alert("채용공고를 입력해주세요.");
            $("#support_etc").focus(); 
        } else {

            if (confirm("지원하시겠습니까?")) {
                result = true;
            }
        }

        return result;
    }

     $('#selct_support_know_cd').change(function(){
       $('#support_direcrt').val($(this).val());
    });

    var college = 1;
    $("#college_add_btn").click(function () {
        college++;

        $("#col_catg_num").val(college);

        $("#college_add").append(
        '<tr class= line' + college + '>' +
			'<th scope="col" class="left_lineNo">분류</th>' +
			'<td>' +
				'<p class="row2_p  clear">' +
					'<span class="col5 ">' +
						'<input type="radio" name="type_cd' + college + '" id="sch_11_' + college + '" checked="checked" class="mR5" value="RCM_AC_COLLEGE_2_3" />' +
						'<label for="sch_11" class="inlineB">대학(2,3년)</label>' +
					'</span>' +
					'<span class="col5">' +
						'<input type="radio" name="type_cd' + college + '" id="sch_12_' + college + '" class="mR5" value="RCM_AC_COLLEGE_4" />' +
						'<label for="sch_12" class="inlineB">대학교(4년)</label>' +
					'</span>' +
					'<span class="col5">' +
						'<input type="radio" name="type_cd' + college + '" id="sch_13_' + college + '" class="mR5" value="RCM_AC_GRADUATE_SCH" />' +
						'<label for="sch_13" class="inlineB">대학원</label>' +
					'</span>' +
				'</p>' +
                //'<input type="hidden" name="col_catg_num' + college + '" id="col_catg_num' + college + '" class="mR5" value="' + college + '" />' +
			'</td>' +
			'<td rowspan="6">' +
				'<button type="button" id="college_del' + college + '" class="btn_basket" onclick=deleteCollage(\'line' + college + '\',\'col_catg_num\'); >삭제하기</button>' +
			'</td>' +
		'</tr>' +
       '<tr class= line' + college + '>' +
			'<th scope="col" class="left_lineNo ">' +
				'<label for="sch_nm">학교명</label>' +
			'</th>' +
			'<td>' +
				'<input type="text" id="sch_nm' + college + '" name="sch_nm" placeholder="서울대학 " />' +
				'<select id="mater_cd' + college + '" name="mater_cd">' +
					'<option value="">소재지</option>' +
					'<option value="RCM_SC_SEOUL">서울</option>' +
					'<option value="RCM_SC_GWANGJU">광주</option>' +
					'<option value="RCM_SC_DAEGU">대구</option>' +
					'<option value="RCM_SC_DAEJEON">대전</option>' +
					'<option value="RCM_SC_BUSAN">부산</option>' +
					'<option value="RCM_SC_ULSAN">울산</option>' +
					'<option value="RCM_SC_INCHEON">인천</option>' +
					'<option value="RCM_SC_SEJONG">세종</option>' +
					'<option value="RCM_SC_GANGWON">강원</option>' +
					'<option value="RCM_SC_GYEONGGI">경기</option>' +
					'<option value="RCM_SC_GYEONGNAM">경남</option>' +
					'<option value="RCM_SC_GYEONGBUK">경북</option>' +
					'<option value="RCM_SC_JEONNAM">전남</option>' +
					'<option value="RCM_SC_CHUNBUK">전북</option>' +
					'<option value="RCM_SC_CHUNGNAM">충남</option>' +
					'<option value="RCM_SC_CHUNGBUK">충북</option>' +
					'<option value="RCM_SC_JEJU">제주</option>' +
					'<option value="RCM_SC_ASIA">아시아</option>' +
					'<option value="RCM_SC_NORTH_AMERICA">북미</option>' +
					'<option value="RCM_SC_SOUTH_AMERICA">중남미</option>' +
					'<option value="RCM_SC_EUROPE">유럽</option>' +
					'<option value="RCM_SC_OCEANIA">오세아니아</option>' +
					'<option value="RCM_SC_AFRICA">아프리카</option>' +
				'</select>' +
				'<select id="bsl_tsl_cd' + college + '" name="bsl_tsl_cd">' +
					'<option value="RCM_AT_MY_SCH">본교</option>' +
					'<option value="RCM_AT_BRANCH">분교</option>' +
				'</select>' +
			'</td>' +
		'</tr>' +
		'<tr class= line' + college + '>' +
			'<th scope="col" class="left_lineNo ">' +
				'<label for="sch_15"> 재학기간</label>' +
			'</th>' +
			'<td>' +
				'<select id="admis_year' + college + '" name="admis_year" >' +
                    <% 
	for (int i = NowYear + 1; i > NowYear - 20; i--)
	{
                    %>
						'<option value="<%=i %>"><%=i %></option>' +
                    <% 
	}
                    %>
				'</select>' +
                '<select id="admis_cd' + college + '" name="admis_cd">' +
					'<option value="RCM_TC_ADMISSION">입학</option>' +
					'<option value="RCM_TC_TRANSFER">편입</option>' +
				'</select>' +
				'~' +
				'<label for="gradut_year' + college + '" class="acc-hidden">졸업</label>' +
				'<select id="gradut_year' + college + '" name="gradut_year" >' +
					<% 
	for (int i = NowYear + 1; i > NowYear - 20; i--)
	{
                    %>
						'<option value="<%=i %>"><%=i %></option>' +
                    <% 
	}
                    %>
				'</select>' +
                '<select id="gradut_cd' + college + '" name="gradut_cd">' +
					'<option value="RCM_GS_GRADUATION">졸업</option>' +
					'<option value="RCM_GS_GRADUAND">졸업예정</option>' +
					'<option value="RCM_GS_COMPLETE">수료</option>' +
					'<option value="RCM_GS_LOA">휴학</option>' +
					'<option value="RCM_GS_DROPOUT">중퇴</option>' +
				'</select>' +
			'</td>' +
		'</tr>' +
		'<tr class= line' + college + '>' +
			'<th scope="col" class="left_lineNo ">계열선택</th>' +
			'<td >' +
				'<select id="ability_cd' + college + '" name="ability_cd" style="width:137px;">' +
					'<option value="RCM_AL_LANG">어문학</option>' +
					'<option value="RCM_AL_HUMANITIES">인문학과</option>' +
					'<option value="RCM_AL_SOCIOLOGY">사회학과</option>' +
					'<option value="RCM_AL_NATURAL_SC">자연과학</option>' +
					'<option value="RCM_AL_ENGINEERING">공학</option>' +
					'<option value="RCM_AL_LAW">법학</option>' +
					'<option value="RCM_AL_JURISDICTION">사법학</option>' +
					'<option value="RCM_AL_BUSIN">상경</option>' +
					'<option value="RCM_AL_LIFE_SC">생활 과학</option>' +
					'<option value="RCM_AL_ART">예/체능학</option>' +
					'<option value="RCM_AL_RELIGION">종교학</option>' +
					'<option value="RCM_AL_MEDICINE">의/약학</option>' +
					'<option value="RCM_AL_AC_FISH">농/수산</option>' +
					'<option value="RCM_AL_OCEANO">해양학</option>' +
					'<option value="RCM_AL_ETC">기타</option>' +
				'</select>' +
				'<label for="sch_17" class="acc-hidden">계열선택</label>' +
				'<input type="text" id="ability_dept_nm' + college + '" name="ability_dept_nm"  style="width:200px;" />' +
			'</td>' +
		'</tr>' +
		'<tr class= line' + college + '>' +
			'<th scope="col" class="left_lineNo ">' +
				'<label for="sch_18" >학점</label>' + 
				'</th>' +
			'<td>' +
				'<input type="text" id="score' + college + '" name="score" />' +
			'</td>' +
		'</tr>' +
		'<tr class= line' + college + '>' +
			'<th scope="col" class="left_lineNo ">' +
				'<label for="gradut_dissert_nm" >졸업논문</label>' +
			'</th>' +
			'<td >' +
				'<input type="text" id="gradut_dissert_nm' + college + '" name="gradut_dissert_nm" style="width:97.5%" />' +
			'</td>' +
		'</tr>'
        );
    });

    var career = 1;
    $("#career_add_btn").click(function () {
        career++;
        $("#career_num").val(career);

        $("#career_add").append(
            '<tr class=careerLine' + career + '>' +
	            '<th scope="col" class="left_lineNo ">' +
		            '<label for="history_01" >회사명</label>' +
	            '</th>' +
	            '<td>' +
		            '<input type="text" id="company_nm' + career + '" name="company_nm" style="width:97.5%" />' +
	            '</td>' +
	            '<td rowspan="9">' +
		            '<button type="button" class="btn_basket" onclick=deleteCollage(\'careerLine' + career + '\',\'career_num\');>삭제하기</button>' +
	            '</td>' +
            '</tr>' +
            '<tr class=careerLine' + career + '>' +
	            '<th scope="col" class="left_lineNo ">' +
		            '<label for="datepicker2">근무기간</label>' +
	            '</th>' +
	            '<td>' +
		            '<input type="text" id="start_date' + career + '" name="start_date" title="입사 날짜" class="date_in datepicker" />  ~ ' +
		            '<label for="datepicker3" class="acc-hidden">회사명</label>' +
		            '<input type="text" id="end_date' + career + '" name="end_date" title="퇴사  날짜" class="date_in datepicker" />' +
		            '<select id="career_term_cd' + career + '" name="career_term_cd" style="width:150px;">' +
			            '<option value="RCM_CC_RESIGN">퇴사</option>' +
			            '<option value="RCM_CC_IN_OFFICE">재직중</option>' +
		            '</select>' +
	            '</td>' +
            '</tr>' +
            '<tr class=careerLine' + career + '>' +
	            '<th scope="col" class="left_lineNo ">' +
		            '<label for="history_02">부서/직급/직책</label>' +
	            '</th>' +
	            '<td>' +
		            '<input type="text" id="dept_nm' + career + '" name="dept_nm" placeholder="대한기획팀 " style="width:200px;" />' +
		            '<select id="posit_cd' + career + '" name="posit_cd">' +
			            '<option>직급선택</option>' +
			            '<option value="RCM_RP_STAFF">사원(연구원)</option>' +
			            '<option value="RCM_RP_SC">주임/계장 (연구원)</option>' +
			            '<option value="RCM_RP_AM">대리(주임연구원)</option>' +
			            '<option value="RCM_RP_M">과장(선임연구원)</option>' +
			            '<option value="RCM_RP_GM">차장 (수석연구원)</option>' +
			            '<option value="RCM_RP_DM">부장 (연구소장)</option>' +
			            '<option value="RCM_RP_DIRECTOR">임원</option>' +
		            '</select>' +
		            '<select id="duty_cd' + career + '" name="duty_cd">' +
			            '<option>직책선택</option>' +
			            '<option value="RCM_DC_MEMBER">팀원</option>' +
			            '<option value="RCM_DC_LEADER">팀장</option>' +
			            '<option value="RCM_DC_MANAGER">매니저</option>' +
			            '<option value="RCM_DC_PART">파트장</option>' +
			            '<option value="RCM_DC_DEPT">실장</option>' +
			            '<option value="RCM_DC_BRANCH">지점장</option>' +
			            '<option value="RCM_DC_RB">지사장</option>' +
			            '<option value="RCM_DC_DIRECTOR">원장</option>' +
			            '<option value="RCM_DC_DG">국장</option>' +
			            '<option value="RCM_DC_DH">본부장</option>' +
			            '<option value="RCM_DC_CD">센터장</option>' +
			            '<option value="RCM_DC_PLANT">공장장</option>' +
			            '<option value="RCM_DC_GROUP">그룹장</option>' +
		            '</select>' +
	            '</td>' +
            '</tr>' +
            '<tr class=careerLine' + career + '>' +
	            '<th scope="col" class="left_lineNo ">' +
		            '<label for="history_03">급여 (연봉)</label>' +
	            '</th>' +
	            '<td>' +
		            '<input type="text" id="sal' + career + '" name="sal" placeholder="3,000~4,000" style="width:97.5%" />' +
	            '</td>' +
            '</tr>' +
            '<tr class=careerLine' + career + '>' +
	            '<th scope="col" class="left_lineNo ">' +
		            '<label for="history_04">직무내용</label>' +
	            '</th>' +
	            '<td>' +
		            '<input type="text" id="job_cont' + career + '" name="job_cont" placeholder="기획 및 제안서 작성 " style="width:97.5%;" />' +
	            '</td>' +
            '</tr>' +
            '<tr class=careerLine' + career + '>' +
	            '<th scope="col" class="left_lineNo ">' +
		            '수행프로젝트' +
	            '</th>' +
	            '<td style="line-height:0;">' +
		            '<textarea id="project' + career + '" name="project" rows="7"  style="width:97%;"></textarea>' +
	            '</td>' +
            '</tr>' +
            '<tr class=careerLine' + career + '>' +
	            '<th scope="col" class="left_lineNo ">' +
		            '상세업무' +
	            '</th>' +
	            '<td style="line-height:0;">' +
		            '<textarea id="dtl_busin' + career + '" name="dtl_busin" rows="7" style="width:97%;"></textarea>' +
	            '</td>' +
            '</tr>' +
            '<tr class=careerLine' + career + '>' +
	            '<th scope="col" class="left_lineNo ">' +
		            '주요 업무성과' +
	            '</th>' +
	            '<td style="line-height:0;">' +
		            '<textarea id="major_job_outc' + career + '" name="major_job_outc" rows="7"  style="width:97%;"></textarea>' +
	            '</td>' +
            '</tr>' +
            '<tr class=careerLine' + career + '>' +
	            '<th scope="col" class="left_lineNo ">' +
		            '이직사유' +
	            '</th>' +
	            '<td style="line-height:0;" >' +
		            '<textarea id="change_job_reason' + career + '" name="change_job_reason" rows="7"  style="width:97%;"></textarea>' +
	            '</td>' +
            '</tr>'
        );

        //$(document).find("input[name=start_date]").removeClass('hasDatepicker').datepicker();
        //$(document).find("input[name=end_date]").removeClass('hasDatepicker').datepicker();
        $('#start_date' + career).datepicker({
            //showOn: "both", // 버튼 텍스트 모두 적용
            //buttonImage: "./images/ico-calendar.jpg", // 버튼 이미지
            //buttonImageOnly: true, // 버튼에 있는 이미지만 표시
            changeMonth: true,
            changeYear: true,
            minDate: '-60y',
            nextText: '다음 달',
            prevText: '이전 달',
            numberOfMonths: [1, 1],
            yearRange: 'c-60:c+10', // 년도 표시 범위
            //showButtonPanel: true,  
            //currentText: '오늘 날짜' , 
            //closeText: '닫기', 
            dateFormat: "yy-mm-dd",
            showAnim: "fade",
            showMonthAfterYear: true,
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
        });

        $('#end_date' + career).datepicker({
            //showOn: "both", // 버튼 텍스트 모두 적용
            //buttonImage: "./images/ico-calendar.jpg", // 버튼 이미지
            //buttonImageOnly: true, // 버튼에 있는 이미지만 표시
            changeMonth: true,
            changeYear: true,
            minDate: '-60y',
            nextText: '다음 달',
            prevText: '이전 달',
            numberOfMonths: [1, 1],
            yearRange: 'c-60:c+10', // 년도 표시 범위
            //showButtonPanel: true,  
            //currentText: '오늘 날짜' , 
            //closeText: '닫기', 
            dateFormat: "yy-mm-dd",
            showAnim: "fade",
            showMonthAfterYear: true,
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
        });
    });

    var qf = 1;
    $("#qf_add_btn").click(function () {
        qf++;
        $("#cdt_num").val(qf);

        $("#qf_add").append(
            '<tr class=qfLine' + qf + '>' +
				'<td class="left_lineNo center">' +
					'<label for="name111" class="acc-hidden">운전면허</label>' +
					'<input type="text" id="cdt_kind' + career + '" name="cdt_kind" />' +
				'</td>' +
				'<td>' +
					'<label for="name112" class="acc-hidden">취득일자</label>' +
					'<input type="text" id="acq_dt' + career + '" name="acq_dt" />' +
					'</td>' +
				'<td>' +
					'<label for="name113" class="acc-hidden">발행처</label>' +
					'<input type="text" id="pub_place' + career + '" name="pub_place" />' +
				'</td>' +
				'<td class="icon" >' +
					'<button type="button" class="btn_basket" onclick=deleteCollage(\'qfLine' + qf + '\',\'cdt_num\');>삭제하기</button>' +
				'</td>' +
			'</tr>'
        );
    });

    var family = 1;
    $("#family_add_btn").click(function () {
        family++;
        $("#family_num").val(family);

        $("#family_add").append(
            '<tr class=familyLine' + family + '>' +
				'<td class="left_lineNo center">' +
					'<label for="rel1" class="acc-hidden">관계 선택</label>' +
					'<select id="rel1" name="rel">' +
						'<option value="">선택</option>' +
						'<option value="RCM_FC_FATHER">부</option>' +
						'<option value="RCM_FC_MOTHER">모</option>' +
						'<option value="RCM_FC_WIFE">아내</option>' +
						'<option value="RCM_FC_HUSBAND">남편</option>' +
						'<option value="RCM_FC_OLD_SISTER">누나(언니)</option>' +
						'<option value="RCM_FC_OLD_BROTHER">형(오빠)</option>' +
						'<option value="RCM_FC_BROTHER">남동생</option>' +
						'<option value="RCM_FC_SISTER">여동생</option>' +
						'<option value="RCM_FC_GRANDFATHER">조부</option>' +
						'<option value="RCM_FC_GRANDMOTHER">조모</option>' +
						'<option value="RCM_FC_CHILDREN">자녀</option>' +
						'<option value="RCM_FC_ETC">기타</option>' +
					'</select>' +
				'</td>' +
				'<td>' +
					'<label for="name99" class="acc-hidden">성명</label>' +
					'<input type="text" id="name99" name="nm" class="w84p" placeholder="이름입력">' +
				'</td>' +
				'<td>' +
					'<label for="name101" class="acc-hidden">연령</label>' +
					'<input type="text" id="name101" name="age" class="w80p" placeholder="연령입력">' +
					'</td>' +
				'<td>' +
					'<label for="name102" class="acc-hidden">학력</label>' +
					'<input type="text" id="name102" name="ability" class="w84p" placeholder="학력입력">' +
				'</td>' +
				'<td>' +
					'<label for="name103" class="acc-hidden">직업</label>' +
					'<input type="text" id="name103" name="job" class="w80p" placeholder="직업입력">' +
					'</td>' +
				'<td>' +
					'<label for="name104" class="acc-hidden">직장명</label>' +
					'<input type="text" id="name104" name="job_nm" placeholder="직장명입력">' +
				'</td>' +
				'<td>' +
					'<label for="name105" class="acc-hidden">직위</label>' +
					'<input type="text" id="name105" name="posit" class="w84p" placeholder="직위입력">' +
				'</td>' +
				'<td class="icon">' +
					'<button type="button" class="btn_basket" onclick=deleteCollage(\'familyLine' + family + '\',\'family_num\')>삭제하기</button>' +
				'</td>' +
			'</tr>'
        );
    });

    function deleteCollage(classname, del_count_obj_id) {
        $('.' + classname).remove();

        var num = parseInt($("#"+ del_count_obj_id).val()) - 1;
        $("#"+ del_count_obj_id).val(num);
    }

    $(function () {
        $(".datepicker").datepicker({
            //showOn: "both", // 버튼 텍스트 모두 적용
            //buttonImage: "./images/ico-calendar.jpg", // 버튼 이미지
            //buttonImageOnly: true, // 버튼에 있는 이미지만 표시
            changeMonth: true,
            changeYear: true,
            minDate: '-60y',
            nextText: '다음 달',
            prevText: '이전 달',
            numberOfMonths: [1, 1],
            yearRange: 'c-60:c+10', // 년도 표시 범위
            //showButtonPanel: true,  
            //currentText: '오늘 날짜' , 
            //closeText: '닫기', 
            dateFormat: "yy-mm-dd",
            showAnim: "fade",
            showMonthAfterYear: true,
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
        });

		var profile_file = document.getElementById('profile_file_seq');
		
		upclick({
			element:profile_file, 
			action: '/ws/user_file_upload.aspx',
			dataname: 'profile_file_seq', 
			onstart: 
				function(filename) {
			        //alert('Starting upload: '+filename);
				},
			oncomplete:
				function(file_path) {	            	
	            	if (file_path != null && file_path != "") {
	        			$("#profile_file").attr("src", file_path);
                        $("#<%=img.ClientID %>").val(file_path);
	    			}
				}
		});
    });
    
</script>
<%if (Request.ServerVariables["HTTPS"] == "on"){ %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<%}else{ %>
<script src="//dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%} %>
<script type="text/javascript">
	function postCode() {
		new daum.Postcode({
			oncomplete: function (data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode_str').value = data.zonecode;
				document.getElementById("addr").value = roadAddr;
				//document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

				// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
				if (roadAddr !== '') {
					//document.getElementById("sample4_extraAddress").value = extraRoadAddr;
				} else {
					//document.getElementById("sample4_extraAddress").value = '';
				}

				/*
				var guideTextBox = document.getElementById("guide");
				// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				if (data.autoRoadAddress) {
					var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
					guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
					guideTextBox.style.display = 'block';

				} else if (data.autoJibunAddress) {
					var expJibunAddr = data.autoJibunAddress;
					guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
					guideTextBox.style.display = 'block';
				} else {
					guideTextBox.innerHTML = '';
					guideTextBox.style.display = 'none';
				}*/
			}
		}).open();
	}
</script>
</asp:Content>
