<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="main_list_eng.aspx.cs" Inherits="AdminSite.main.main_list_eng" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
	
	<div id="page-heading">
		<h1> 메인관리   </h1>
	</div>

	<div class="wrap_box">
               <ul class="list_tab  clearfix target" >
			<li><a href="main_list.aspx"> 국문 </a></li>
			<li class="tab_on"><a href="main_list_eng.aspx"> 영문 </a></li>
		</ul>
		
			<!-- 비주얼  -->
			<h2 class="conspan2"> 비주얼 </h2> <span class="c_red"> 560*646 px 로 입력하세요 </span>
			<table cellpadding="0" cellspacing="0" border="0" class="table_new">
				<thead>
					<tr> 
						<th width="10%">순서</th>
						<th>파일명</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td class="alignleft">
							<div  class="row_1 mB10">
								<span class="side_span">파일경로</span>
								<div class="upload">
									<label for="visual_text_01" class="blind">파일경로</label>
									<div class="fakeupload inline">
										<input type="text" id="visual_value_01" runat="server"/><!-- browse button is here as background -->
									</div>
                                    <asp:FileUpload ID="visual_text_01" runat="server" CssClass="realupload" />
								</div>
                                <% 
                                    if (GetData(0, 0, "FILE_PATH").Equals("") == false)
                                    {
                                %>
                                <asp:HiddenField runat="server" ID="hImgPath1" />
                                <asp:LinkButton ID="btnDelVisualImg1" runat="server" onclick="btnDelVisualImg1_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
                                <span class="btn">이미지삭제</span>
                                </asp:LinkButton>
                                <% 
                                    }
                                    else
                                    {
                                %>
                                <span class="btn disabled">이미지삭제</span>
                                <% 
                                    }
                                %>
                                <span class="side_span">* 현재 파일 : 
                                <% 
                                        if (GetData(0, 0, "FILE_PATH").Equals("") == false)
                                        {
                                %>
								<a href="javascript:open_popup('<%=GetData(0, 0, "FILE_PATH") %>');">보기</a>
                                <% 
                                        }
                                %>
                                </span>
                                <span class="main_checkbox">
									<input type="checkbox" runat="server" id="visual_use_yn_1" name="visual_use_yn_1" /> 
									<label for="value_01">활성화</label>
								</span>
							</div>
							<div  class="row_1" >
								<label for="visual_url_01" class="side_span">링크URL</label>
								<div class="upload_main">
									<input type="text" id="visual_url_01" runat="server" />
								</div>
							</div>	
						</td>
					</tr>
					<tr>
						<td> 2  </td>
						<td class="alignleft">
							<div  class="row_1 mB10">
								<span class="side_span">파일경로</span>
								<div class="upload">
									<label for="visual_text_01" class="blind" > 파일경로 </label>
									<div class="fakeupload inline" >
										<input type="text" id="visual_value_02" runat="server" /> <!-- browse button is here as background -->
									</div>
                                    <asp:FileUpload ID="visual_text_02" runat="server" CssClass="realupload" />
								</div>
                                <% 
                                    if (GetData(0, 1, "FILE_PATH").Equals("") == false)
                                    {
                                %>
                                <asp:HiddenField runat="server" ID="hImgPath2" />
                                <asp:LinkButton ID="btnDelVisualImg2" runat="server" onclick="btnDelVisualImg2_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
                                <span class="btn">이미지삭제</span>
                                </asp:LinkButton>
                                <% 
                                    }
                                    else
                                    {
                                %>
                                <span class="btn disabled">이미지삭제</span>
                                <% 
                                    }
                                %>
								<span class="side_span">* 현재 파일 : 
                                <% 
                                    if (GetData(0, 1, "FILE_PATH").Equals("") == false)
                                    {
                                %>
								<a href="javascript:open_popup('<%=GetData(0, 1, "FILE_PATH") %>');">보기</a>
                                <% 
                                    }
                                %>
                                </span>
                                <span class="main_checkbox">
								    <input type="checkbox" runat="server" id="visual_use_yn_2" name="visual_use_yn_2" /> 
								    <label for="value_01">활성화</label>
								</span>
							</div>
							<div  class="row_1" >
								<label for="visual_url_02" class="side_span"> 링크URL  </label>
								<div class="upload_main">
									<input type="text" id="visual_url_02" runat="server" /> 
								</div>
							</div>		
						</td>
					</tr>
					<tr>
						<td> 3  </td>
						<td class="alignleft">
							<div  class="row_1 mB10" >
								<span class="side_span" > 파일경로  </span>
								<div class="upload">
									<label for="visual_text_03" class="blind" > 파일경로 </label>
									<div class="fakeupload inline" >
										<input type="text" id="visual_value_03" runat="server" /> <!-- browse button is here as background -->
									</div>
                                    <asp:FileUpload ID="visual_text_03" runat="server" CssClass="realupload" />
								</div>
                                <% 
                                    if (GetData(0, 2, "FILE_PATH").Equals("") == false)
                                    {
                                %>
                                <asp:HiddenField runat="server" ID="hImgPath3" />
                                <asp:LinkButton ID="btnDelVisualImg3" runat="server" onclick="btnDelVisualImg3_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
                                <span class="btn">이미지삭제</span>
                                </asp:LinkButton>
                                <% 
                                    }
                                    else
                                    {
                                %>
                                <span class="btn disabled">이미지삭제</span>
                                <% 
                                    }
                                %>
								<span class="side_span">* 현재 파일 : 
                                <% 
                                    if (GetData(0, 2, "FILE_PATH").Equals("") == false)
                                    {
                                %>
								<a href="javascript:open_popup('<%=GetData(0, 2, "FILE_PATH") %>');">보기</a>
                                <% 
                                    }
                                %>
                                </span>
                                <span class="main_checkbox">
									<input type="checkbox" runat="server" id="visual_use_yn_3" name="visual_use_yn_3" /> 
									<label for="value_01">활성화</label>
								</span>
							</div>
							<div  class="row_1" >
								<label for="visual_url_03" class="side_span"> 링크URL  </label>
								<div class="upload_main">
									<input type="text" id="visual_url_03" runat="server" /> 
								</div>
							</div>		
						</td>
					</tr>
                    <tr>
						<td> 4  </td>
						<td class="alignleft">
							<div  class="row_1 mB10" >
								<span class="side_span" > 파일경로  </span>
								<div class="upload">
									<label for="visual_text_04" class="blind" > 파일경로 </label>
									<div class="fakeupload inline" >
										<input type="text" id="visual_value_04" runat="server" /> <!-- browse button is here as background -->
									</div>
                                    <asp:FileUpload ID="visual_text_04" runat="server" CssClass="realupload" />
								</div>
                                <% 
                                    if (GetData(0, 3, "FILE_PATH").Equals("") == false)
                                    {
                                %>
                                <asp:HiddenField runat="server" ID="hImgPath4" />
                                <asp:LinkButton ID="btnDelVisualImg4" runat="server" onclick="btnDelVisualImg4_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
                                <span class="btn">이미지삭제</span>
                                </asp:LinkButton>
                                <% 
                                    }
                                    else
                                    {
                                %>
                                <span class="btn disabled">이미지삭제</span>
                                <% 
                                    }
                                %>
								<span class="side_span">* 현재 파일 : 
                                <% 
                                    if (GetData(0, 3, "FILE_PATH").Equals("") == false)
                                    {
                                %>
								<a href="javascript:open_popup('<%=GetData(0, 3, "FILE_PATH") %>');">보기</a>
                                <% 
                                    }
                                %>
                                </span>
                                <span class="main_checkbox">
									<input type="checkbox" runat="server" id="visual_use_yn_4" name="visual_use_yn_4" /> 
									<label for="value_01">활성화</label>
								</span>
							</div>
							<div  class="row_1" >
								<label for="visual_url_04" class="side_span"> 링크URL  </label>
								<div class="upload_main">
									<input type="text" id="visual_url_04" runat="server" /> 
								</div>
							</div>		
						</td>
					</tr>
                    <tr>
						<td> 5  </td>
						<td class="alignleft">
							<div  class="row_1 mB10" >
								<span class="side_span" > 파일경로  </span>
								<div class="upload">
									<label for="visual_text_05" class="blind" > 파일경로 </label>
									<div class="fakeupload inline" >
										<input type="text" id="visual_value_05" runat="server" /> <!-- browse button is here as background -->
									</div>
                                    <asp:FileUpload ID="visual_text_05" runat="server" CssClass="realupload" />
								</div>
                                <% 
                                    if (GetData(0, 4, "FILE_PATH").Equals("") == false)
                                    {
                                %>
                                <asp:HiddenField runat="server" ID="hImgPath5" />
                                <asp:LinkButton ID="btnDelVisualImg5" runat="server" onclick="btnDelVisualImg5_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
                                <span class="btn">이미지삭제</span>
                                </asp:LinkButton>
                                <% 
                                    }
                                    else
                                    {
                                %>
                                <span class="btn disabled">이미지삭제</span>
                                <% 
                                    }
                                %>
								<span class="side_span">* 현재 파일 : 
                                <% 
                                    if (GetData(0, 4, "FILE_PATH").Equals("") == false)
                                    {
                                %>
								<a href="javascript:open_popup('<%=GetData(0, 4, "FILE_PATH") %>');">보기</a>
                                <% 
                                    }
                                %>
                                </span>
                                <span class="main_checkbox">
									<input type="checkbox" runat="server" id="visual_use_yn_5" name="visual_use_yn_5" /> 
									<label for="value_01">활성화</label>
								</span>
							</div>
							<div  class="row_1" >
								<label for="visual_url_05" class="side_span"> 링크URL  </label>
								<div class="upload_main">
									<input type="text" id="visual_url_05" runat="server" /> 
								</div>
							</div>		
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btn_area clearfix">
				<div class="f_right">
                    <asp:LinkButton ID="btnVisualSave" runat="server" onClick="btnVisualSave_Click" OnClientClick="return CheckValid('VISUAL');">
					<span class="btn btn-ok">등록</span>
                    </asp:LinkButton>
				</div>
			</div>	
			<!-- // 비주얼  -->
			
			<!-- 퀵메뉴 배너    -->
			<h2 class="conspan2"> 퀵메뉴 배너  </h2> <span class="c_red"> 70*237 px 로 입력하세요 </span>
			<table cellpadding="0" cellspacing="0" border="0" class="table_new">
				<thead>
					<tr> 
						<th width="10%"> 순서  </th>
						<th> 파일명  </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> 1  </td>
						<td class="alignleft">
							<div  class="row_1 mB10" >
								<span class="side_span" > 파일경로  </span>
								<div class="upload">
									<label for="Quick_text_01" class="blind" > 파일경로 </label>
									<div class="fakeupload inline" >
										<input type="text" id="quick_value_01" runat="server" /> <!-- browse button is here as background -->
									</div>
                                    <asp:FileUpload ID="quick_text_01" runat="server" CssClass="realupload" />
								</div>
                                <% 
                                    if (GetData(1, 0, "FILE_PATH").Equals("") == false)
                                    {
                                %>
                                <asp:HiddenField runat="server" ID="h_qk_img_path" />
                                <asp:LinkButton ID="btnDelQkImg" runat="server" onclick="btnDelQkImg_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
                                <span class="btn">이미지삭제</span>
                                </asp:LinkButton>
                                <% 
                                    }
                                    else
                                    {
                                %>
                                <span class="btn disabled">이미지삭제</span>
                                <% 
                                    }
                                %>
                                <span class="side_span">* 현재 파일 : 
                                <% 
                                    if (GetData(1, 0, "FILE_PATH").Equals("") == false)
                                    {
                                %>
								<a href="javascript:open_popup('<%=GetData(1, 0, "FILE_PATH") %>');">보기</a>
                                <% 
                                    }
                                %>
                                </span>
                                <span class="main_checkbox">
									<input type="checkbox" runat="server" id="quick_banner_target_yn" name="quick_banner_target_yn"> 
									<label for="value_02">새창열기</label>
								</span>
							</div>
							<div  class="row_1" >
								<label for="Quick_url_01" class="side_span"> 링크URL  </label>
								<div class="upload_main">
									<input type="text" id="quick_url_01" runat="server" /> 
								</div>
							</div>	
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btn_area clearfix">
				<div class="f_right">
                    <asp:LinkButton ID="btnQK" runat="server" onClick="btnQKSave_Click" OnClientClick="return CheckValid('QK');">
					<span class="btn btn-ok">등록</span>
                    </asp:LinkButton>
				</div>
			</div>	
			<!-- // 퀵메뉴 배너  -->

			<!-- 하단배너   -->
			<h2 class="conspan2"> 하단배너  </h2> <span class="c_red"> 420*67 px 로 입력하세요 </span>
			<table cellpadding="0" cellspacing="0" border="0" class="table_new">
				<thead>
					<tr> 
						<th width="10%"> 순서  </th>
						<th> 파일명  </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> 1  </td>
						<td class="alignleft">
							<div  class="row_1 mB10" >
								<span class="side_span" > 파일경로  </span>
								<div class="upload">
									<label for="bottom_text_01" class="blind" > 파일경로 </label>
									<div class="fakeupload inline" >
										<input type="text" id="bottom_value_01" runat="server"/> <!-- browse button is here as background -->
									</div>
									<asp:FileUpload ID="bottom_text_01" runat="server" CssClass="realupload" />
								</div>
                                <% 
                                    if (GetData(2, 0, "FILE_PATH").Equals("") == false)
                                    {
                                %>
                                <asp:HiddenField runat="server" ID="h_btm_img_path" />
                                <asp:LinkButton ID="btnDelBtmImg" runat="server" onclick="btnDelBtmImg_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
                                <span class="btn">이미지삭제</span>
                                </asp:LinkButton>
                                <% 
                                    }
                                    else
                                    {
                                %>
                                <span class="btn disabled">이미지삭제</span>
                                <% 
                                    }
                                %>
                                <span class="side_span">* 현재 파일 : 
                                <% 
                                    if (GetData(2, 0, "FILE_PATH").Equals("") == false)
                                    {
                                %>
								<a href="javascript:open_popup('<%=GetData(2, 0, "FILE_PATH") %>');">보기</a>
                                <% 
                                    }
                                %>
                                </span>
                                <span class="main_checkbox">
									<input type="checkbox" runat="server" id="bottom_banner_target_yn" name="bottom_banner_target_yn"> 
									<label for="value_02">새창열기</label>
								</span>
							</div>
							<div  class="row_1" >
								<label for="bottom_url_01" class="side_span"> 링크URL  </label>
								<div class="upload_main">
									<input type="text" id="bottom_url_01" runat="server"/> 
								</div>
							</div>	
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btn_area clearfix">
                <div class="f_right">
				    <asp:LinkButton ID="btnBTM" runat="server" onClick="btnBTMSave_Click" OnClientClick="return CheckValid('BTM');">
					    <span class="btn btn-ok">등록</span>
                     </asp:LinkButton>
                </div>
			</div>	
			<!-- // 하단배너  -->

			<!-- 제품    -->
			<h2 class="conspan2"> 제품  </h2> <span class="c_red"> 370 * 148px 로 입력하세요 </span>
			<table cellpadding="0" cellspacing="0" border="0" class="table_new">
				<thead>
					<tr> 
						<th width="10%"> 순서  </th>
						<th> 파일명  </th>
					</tr>
				</thead>
				<tbody>
                    <tr>
						<td>선택</td>
						<td class="new_hot">
							<label for="prod_icon_gen">	
								<input type="radio" runat="server" id="prod_icon_gen" name="prod_icon">일반
						 	</label>
							<label for="prod_icon_new">	
								<input type="radio" runat="server" id="prod_icon_new" name="prod_icon">NEW
						 	</label>
							<label for="prod_icon_hot">	
								<input type="radio" runat="server" id="prod_icon_hot" name="prod_icon">HOT
						 	</label>
						</td>
					</tr>
					<tr>
						<td> 1  </td>
						<td class="alignleft">
							<div  class="row_1 mB10" >
								<span class="side_span" > 파일경로  </span>
								<div class="upload">
									<label for="pdt_text_01" class="blind" > 파일경로 </label>
									<div class="fakeupload inline" >
										<input type="text" id="pdt_value_01" runat="server"/> <!-- browse button is here as background -->
									</div>
                                    <asp:FileUpload ID="pdt_text_01" runat="server" CssClass="realupload" />
								</div>
                                <% 
                                    if (GetData(3, 0, "FILE_PATH").Equals("") == false)
                                    {
                                %>
                                <asp:HiddenField runat="server" ID="h_prod_img1_path" />
                                <asp:LinkButton ID="btnDelProd1Img" runat="server" onclick="btnDelProd1Img_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
                                <span class="btn">이미지삭제</span>
                                </asp:LinkButton>
                                <% 
                                    }
                                    else
                                    {
                                %>
                                <span class="btn disabled">이미지삭제</span>
                                <% 
                                    }
                                %>
                                <span class="side_span">* 현재 파일 : 
                                <% 
                                    if (GetData(3, 0, "FILE_PATH").Equals("") == false)
                                    {
                                %>
								<a href="javascript:open_popup('<%=GetData(3, 0, "FILE_PATH") %>');">보기</a>
                                <% 
                                    }
                                %>
                                </span>
							</div>
							<div  class="row_1" >
								<label for="pdt_url_01" class="side_span"> 링크URL  </label>
								<div class="upload_main">
									<input type="text" id="pdt_url_01" runat="server"/> 
								</div>
							</div>	
						</td>
					</tr>
					<tr>
						<td> 2  </td>
						<td class="alignleft">
							<div  class="row_1 mB10" >
								<span class="side_span" > 파일경로  </span>
								<div class="upload">
									<label for="pdt_text_02" class="blind" > 파일경로 </label>
									<div class="fakeupload inline" >
										<input type="text" id="pdt_value_02" runat="server"/> <!-- browse button is here as background -->
									</div>
									 <asp:FileUpload ID="pdt_text_02" runat="server" CssClass="realupload" />
								</div>
                                <% 
                                    if (GetData(3, 1, "FILE_PATH").Equals("") == false)
                                    {
                                %>
                                <asp:HiddenField runat="server" ID="h_prod_img2_path" />
                                <asp:LinkButton ID="btnDelProd2Img" runat="server" onclick="btnDelProd2Img_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
                                <span class="btn">이미지삭제</span>
                                </asp:LinkButton>
                                <% 
                                    }
                                    else
                                    {
                                %>
                                <span class="btn disabled">이미지삭제</span>
                                <% 
                                    }
                                %>
								<span class="side_span">* 현재 파일 : 
                                <% 
                                    if (GetData(3, 1, "FILE_PATH").Equals("") == false)
                                    {
                                %>
								<a href="javascript:open_popup('<%=GetData(3, 1, "FILE_PATH") %>');">보기</a>
                                <% 
                                    }
                                %>
                                </span>
							</div>
							<div  class="row_1" >
								<label for="pdt_url_02" class="side_span"> 링크URL  </label>
								<div class="upload_main">
									<input type="text" id="pdt_url_02"  runat="server"/> 
								</div>
							</div>	
						</td>
					</tr>
					<tr>
						<td> 3  </td>
						<td class="alignleft">
							<div  class="row_1 mB10" >
								<span class="side_span" > 파일경로  </span>
								<div class="upload">
									<label for="pdt_text_03" class="blind" > 파일경로 </label>
									<div class="fakeupload inline" >
										<input type="text" id="pdt_value_03" runat="server"/> <!-- browse button is here as background -->
									</div>
									<asp:FileUpload ID="pdt_text_03" runat="server" CssClass="realupload" />
								</div>
                                <% 
                                    if (GetData(3, 2, "FILE_PATH").Equals("") == false)
                                    {
                                %>
                                <asp:HiddenField runat="server" ID="h_prod_img3_path" />
                                <asp:LinkButton ID="btnDelProd3Img" runat="server" onclick="btnDelProd3Img_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
                                <span class="btn">이미지삭제</span>
                                </asp:LinkButton>
                                <% 
                                    }
                                    else
                                    {
                                %>
                                <span class="btn disabled">이미지삭제</span>
                                <% 
                                    }
                                %>
								<span class="side_span">* 현재 파일 : 
                                <% 
                                    if (GetData(3, 2, "FILE_PATH").Equals("") == false)
                                    {
                                %>
								<a href="javascript:open_popup('<%=GetData(3, 2, "FILE_PATH") %>');">보기</a>
                                <% 
                                    }
                                %>
                                </span>
							</div>
							<div  class="row_1" >
								<label for="pdt_url_03" class="side_span"> 링크URL  </label>
								<div class="upload_main">
									<input type="text" id="pdt_url_03" runat="server"/> 
								</div>
							</div>	
						</td>

					</tr>
                    <tr>
						<td> 4  </td>
						<td class="alignleft">
							<div  class="row_1 mB10" >
								<span class="side_span" > 파일경로  </span>
								<div class="upload">
									<label for="pdt_text_04" class="blind" > 파일경로 </label>
									<div class="fakeupload inline" >
										<input type="text" id="pdt_value_04" runat="server"/> <!-- browse button is here as background -->
									</div>
									<asp:FileUpload ID="pdt_text_04" runat="server" CssClass="realupload" />
								</div>
                                <% 
                                    if (GetData(3, 3, "FILE_PATH").Equals("") == false)
                                    {
                                %>
                                <asp:HiddenField runat="server" ID="h_prod_img4_path" />
                                <asp:LinkButton ID="btnDelProd4Img" runat="server" onclick="btnDelProd4Img_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
                                <span class="btn">이미지삭제</span>
                                </asp:LinkButton>
                                <% 
                                    }
                                    else
                                    {
                                %>
                                <span class="btn disabled">이미지삭제</span>
                                <% 
                                    }
                                %>
								<span class="side_span">* 현재 파일 : 
                                <% 
                                    if (GetData(3, 3, "FILE_PATH").Equals("") == false)
                                    {
                                %>
								<a href="javascript:open_popup('<%=GetData(3, 3, "FILE_PATH") %>');">보기</a>
                                <% 
                                    }
                                %>
                                </span>
							</div>
							<div  class="row_1" >
								<label for="pdt_url_04" class="side_span"> 링크URL  </label>
								<div class="upload_main">
									<input type="text" id="pdt_url_04" runat="server"/> 
								</div>
							</div>	
						</td>

					</tr>
                    <tr>
						<td> 5  </td>
						<td class="alignleft">
							<div  class="row_1 mB10" >
								<span class="side_span" > 파일경로  </span>
								<div class="upload">
									<label for="pdt_text_05" class="blind" > 파일경로 </label>
									<div class="fakeupload inline" >
										<input type="text" id="pdt_value_05" runat="server"/> <!-- browse button is here as background -->
									</div>
									<asp:FileUpload ID="pdt_text_05" runat="server" CssClass="realupload" />
								</div>
                                <% 
                                    if (GetData(3, 4, "FILE_PATH").Equals("") == false)
                                    {
                                %>
                                <asp:HiddenField runat="server" ID="h_prod_img5_path" />
                                <asp:LinkButton ID="btnDelProd5Img" runat="server" onclick="btnDelProd5Img_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
                                <span class="btn">이미지삭제</span>
                                </asp:LinkButton>
                                <% 
                                    }
                                    else
                                    {
                                %>
                                <span class="btn disabled">이미지삭제</span>
                                <% 
                                    }
                                %>
								<span class="side_span">* 현재 파일 : 
                                <% 
                                    if (GetData(3, 4, "FILE_PATH").Equals("") == false)
                                    {
                                %>
								<a href="javascript:open_popup('<%=GetData(0, 0, "FILE_PATH") %>');">보기</a>
                                <% 
                                    }
                                %>
                                </span>
							</div>
							<div  class="row_1" >
								<label for="pdt_url_05" class="side_span"> 링크URL  </label>
								<div class="upload_main">
									<input type="text" id="pdt_url_05" runat="server"/> 
								</div>
							</div>	
						</td>

					</tr>
				</tbody>
			</table>
			<div class="btn_area clearfix">
				<div class="f_right">
                    <asp:LinkButton ID="btnPDT" runat="server" onClick="btnProdSave_Click" OnClientClick="return CheckValid('PROD');">
					<span class="btn btn-ok">등록</span>
                    </asp:LinkButton>
				</div>
			</div>	
			<!-- // 제품  -->

			<!-- 검색창 텍스트    -->
			<h2 class="conspan2"> 검색창 텍스트   </h2>
			<table cellpadding="0" cellspacing="0" border="0" class="table_new">
				<thead>
					<tr> 
						<th width="10%"> 위치   </th>
						<th> 내용  </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><label for="search_txt_01"> 통합 검색창  </label>  </td>
						<td class="alignleft">
							<div  class="row_1" >
								<div class="upload_main">
									<input type="text" id="search_txt_01" runat="server" /> 
								</div>
							</div>	
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btn_area clearfix">
				<div class="f_right">
                    <asp:LinkButton ID="btnSRCH" runat="server" onClick="btnSrctSave_Click" OnClientClick="return CheckValid('SRCH');">
					<span class="btn btn-ok">등록</span>
                    </asp:LinkButton>
				</div>
			</div>	
			<!-- // 하단배너  -->

			<!-- 메인 팝업 배너 등록      -->
			<h2 class="conspan3"> 메인 팝업 배너 등록  </h2> <span class="c_red"> 720*460px 로 입력하세요 </span>
			<table cellpadding="0" cellspacing="0" border="0" class="table_new">
				<thead>
					<tr> 
						<th width="10%"> 순서  </th>
						<th> 파일명  </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> 1  </td>
						<td class="alignleft">
							<div  class="row_1 mB10" >
								<span class="side_span" >대표배너</span>
								<div class="upload">
									<label for="pop_text_21" class="blind">파일경로</label>
									<div class="fakeupload inline" >
										<input type="text" id="pop_value_21" runat="server" /> <!-- browse button is here as background -->
									</div>
                                    <asp:FileUpload ID="pop_text_21" runat="server" CssClass="realupload" />
								</div>
                                <% 
                                    if (GetData(0, 0, "FILE_PATH").Equals("") == false)
                                    {
                                %>
                                <asp:HiddenField runat="server" ID="h_pop_img_path" />
                                <asp:LinkButton ID="btnDelPopImg" runat="server" onclick="btnDelPopImg_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
                                <span class="btn">이미지삭제</span>
                                </asp:LinkButton>
                                <% 
                                    }
                                    else
                                    {
                                %>
                                <span class="btn disabled">이미지삭제</span>
                                <% 
                                    }
                                %>
								<span class="side_span">* 현재 파일 : 
                                <% 
                                    if (GetData(6, 0, "FILE_PATH").Equals("") == false)
                                    {
                                %>
								<a href="javascript:open_popup('<%=GetData(6, 0, "FILE_PATH") %>');">보기</a>
                                <% 
                                    }
                                %>
                                </span>
                                <span class="main_checkbox">
									<input type="checkbox" runat="server" id="main_pop_use_yn" name="main_pop_use_yn" /> 
									<label for="value_06">활성화</label>
								</span>
							</div>
                             <div  class="row_1 mB10" >
								<label for="main_pop_width" class="side_span"> 너비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<div class="link_main">
									<input type="text" runat="server" id="main_pop_width" name="main_pop_width" /> 
								</div>

							</div>	

                            <div  class="row_1 mB10" >
                                
								<label for="main_pop_height" class="side_span"> 높이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<div class="link_main">
									<input type="text" runat="server" id="main_pop_height" name="main_pop_height" /> 
								</div>
                            </div>

                            <div  class="row_1" >
								<label for="pdt_url_04" class="side_span"> 링크URL  </label>
								<div class="link_main">
									<input type="text" runat="server" id="main_pop_link_url" name="main_pop_link_url" /> 
								</div>
								<span class="main_checkbox">
									<input type="checkbox" runat="server" id="main_pop_target_yn" name="main_pop_target_yn" /> 
									<label for="value_07">새창열기</label>
								</span>
							</div>	
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btn_area clearfix">
				<div class="f_right">
					<asp:LinkButton ID="LinkButton2" runat="server" onClick="btnPopSave_Click" OnClientClick="return CheckValid('POP');">
					    <span class="btn btn-ok">등록</span>
                    </asp:LinkButton>
				</div>
			</div>	
			<!-- // 메인 팝업 배너 등록    -->

	</div><!--//  wrap_box -->
	
		
</div>
</div>
<!--//  CONTENT -->

<script language="javascript" type="text/javascript">
    var textfd = {
        isExist: true,
        chk: function (fieldName, message) {
            if (this.isExist) {
                //필드 
                var fd = document.getElementById(fieldName);


                if (fd == null) //필드가 존재하지 않는다. 
                {
                    this.isExist = false;
                    alert("컨트롤 " + fieldName + "이 없습니다.");
                }
                else {

                    //필드 값이 null이거나 빈문자열이다. 
                    if (fd.value == null || fd.value == "") {
                        this.isExist = false;
                        alert(message); //메시지를 보인다.
                        fd.focus(); //포커스를 준다 
                    }
                }

            }
        },

        result: function () {
            var isResult = this.isExist;

            this.isExist = true; //다시 실행을 위해 초기화한다.

            return isResult;
        }
    };

    function changeFile(oFile, pathId) {
        alert(pathId + "...." + oFile.value);
        //$("#"+pathId).val(oFile.value);
        document.getElementById("visual_value_01").value = oFile.value;
    }

    function CheckValid(inputType) {
        if (inputType == "VISUAL") {
            // textfd.chk('<%= visual_text_01.ClientID %>', "1번째 파일 경로를 입력하세요. (반드시 하나 노출)");
            // textfd.chk('<%= visual_url_01.ClientID %>', "1번째 링크URL을 입력하세요. (반드시 하나 노출)");
        } else if (inputType == "QK") {

        } else if (inputType == "BTM") {

        } else if (inputType == "PROD") {
            // textfd.chk('<%= pdt_text_01.ClientID %>', "1번째 파일 경로를 입력하세요. (반드시 하나 노출)");
            // textfd.chk('<%= pdt_url_01.ClientID %>', "1번째 링크URL을 입력하세요. (반드시 하나 노출)");
        }

        if (textfd.result()) {
            return confirm('저장하시겠습니까?');
        } else {
            return false;
        }
    }
</script>

</asp:Content>

