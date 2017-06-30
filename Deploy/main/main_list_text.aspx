<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master"  AutoEventWireup="true" CodeBehind="main_list_text.aspx.cs" Inherits="AdminSite.main.main_list_text" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
	
	<div id="page-heading">
		<h1> 메인관리   </h1>
	</div>

	<div class="wrap_box">
               <ul class="list_tab  clearfix target" >
			<li class="tab_on"><a href="main_list.aspx"> 국문 </a></li>
			<li><a href="main_list_eng.aspx"> 영문 </a></li>
		</ul>
		<form action="" method="">
			<!-- 비주얼  -->
			<h2 class="conspan2"> 비주얼 </h2> <span class="c_red">560*674 px  .JPG로 입력하세요 </span>
			<table cellpadding="0" cellspacing="0" border="0" class="table_new">
				<thead>
					<tr> 
						<th width="10%"> 순서  </th>
						<th> 파일명  </th>
						<th width="15%"> 등록  </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> 1</td>
						<td class="alignleft">
							<div  class="upload_box" >
								<label for="file_01" class="up_label"> 파일경로  </label>
								<div class="upload_main">
									<input type="text" name="text_upload_01" > 
								</div>
							</div>	
							<div  class="upload_box" >
								<label for="link_01" class="up_label"> 링크URL  </label>
								<div class="upload_main">
										<input type="text" name="link_01" > 
								</div>
							</div>				
						</td>
						<td> 
							<div class="fakeupload_main" >  <!--  파일선택 버튼  -->
								<label for="click_upload_01" class="label_hidden"> 파일경로  </label>
								<input type="file" id="click_upload_01" name="imgfile"  onchange="this.form.text_upload_01.value = this.value;" class="realupload_main"  > 
							</div>
						 </td>
					</tr>
					<tr>
						<td> 2</td>
						<td class="alignleft">
							<div  class="upload_box" >
								<label for="file_02" class="up_label"> 파일경로  </label>
								<div class="upload_main">
									<input type="text" name="text_upload_02" > 
								</div>
							</div>	
							<div  class="upload_box" >
								<label for="link_02" class="up_label"> 링크URL  </label>
								<div class="upload_main">
										<input type="text" name="link_02" > 
								</div>
							</div>				
						</td>
						<td> 
							<div class="fakeupload_main" >  <!--  파일선택 버튼  -->
								<label for="click_upload_02" class="label_hidden"> 파일경로  </label>
								<input type="file" id="click_upload_02" name="imgfile"  onchange="this.form.text_upload_02.value = this.value;" class="realupload_main"  > 
							</div>
						 </td>
					</tr>
					<tr>
						<td>3</td>
						<td class="alignleft">
							<div  class="upload_box" >
								<label for="file_03" class="up_label"> 파일경로  </label>
								<div class="upload_main">
									<input type="text" name="text_upload_03" > 
								</div>
							</div>	
							<div  class="upload_box" >
								<label for="link_03" class="up_label"> 링크URL  </label>
								<div class="upload_main">
										<input type="text" name="link_03" > 
								</div>
							</div>				
						</td>
						<td> 
							<div class="fakeupload_main" >  <!--  파일선택 버튼  -->
								<label for="click_upload_03" class="label_hidden"> 파일경로  </label>
								<input type="file" id="click_upload_03" name="imgfile"  onchange="this.form.text_upload_03.value = this.value;" class="realupload_main"  > 
							</div>
						 </td>
					</tr>
				</tbody>
			</table>
			<div class="btn_area clearfix">
				<div class="f_right">
					<a href="#"><span class="btn btn-ok">등록</span></a>
				</div>
			</div>	
			<!-- // 비주얼  -->
			
			<!-- 퀵메뉴 배너    -->
			<h2 class="conspan2"> 퀵메뉴 배너  </h2> <span class="c_red"> 70*237 px  .JPG로 입력하세요 </span>
			<table cellpadding="0" cellspacing="0" border="0" class="table_new">
				<thead>
					<tr> 
						<th width="10%"> 순서  </th>
						<th> 파일명  </th>
						<th width="15%"> 등록  </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> 1</td>
						<td class="alignleft">
							<div  class="upload_box" >
								<label for="Quick_file_01" class="up_label"> 파일경로  </label>
								<div class="upload_main">
									<input type="text" name="Quick_text_upload_01" > 
								</div>
							</div>	
							<div  class="upload_box" >
								<label for="Quick_link_01" class="up_label"> 링크URL  </label>
								<div class="upload_main">
										<input type="text" name="Quick_link_01" > 
								</div>
							</div>				
						</td>
						<td> 
							<div class="fakeupload_main" >  <!--  파일선택 버튼  -->
								<label for="Quick_click_upload_01" class="label_hidden"> 파일경로  </label>
								<input type="file" id="Quick_click_upload_01" name="imgfile"  onchange="this.form.Quick_text_upload_01.value = this.value;" class="realupload_main"  > 
							</div>
						 </td>
					</tr>
				</tbody>
			</table>
			<div class="btn_area clearfix">
				<div class="f_right">
					<a href="#"><span class="btn btn-ok">등록</span></a>
				</div>
			</div>	
			<!-- // 퀵메뉴 배너  -->

			<!-- 하단배너   -->
			<h2 class="conspan2"> 하단배너  </h2> <span class="c_red"> 420*50 px  .JPG로 입력하세요 </span>
			<table cellpadding="0" cellspacing="0" border="0" class="table_new">
				<thead>
					<tr> 
						<th width="10%"> 순서  </th>
						<th> 파일명  </th>
						<th width="15%"> 등록  </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> 1</td>
						<td class="alignleft">
							<div  class="upload_box" >
								<label for="bottom_file_01" class="up_label"> 파일경로  </label>
								<div class="upload_main">
									<input type="text" name="bottom_text_upload_01" > 
								</div>
							</div>	
							<div  class="upload_box" >
								<label for="bottom_link_01" class="up_label"> 링크URL  </label>
								<div class="upload_main">
										<input type="text" name="bottom_link_01" > 
								</div>
							</div>				
						</td>
						<td> 
							<div class="fakeupload_main" >  <!--  파일선택 버튼  -->
								<label for="bottom_click_upload_01" class="label_hidden"> 파일경로  </label>
								<input type="file" id="bottom_click_upload_01" name="imgfile"  onchange="this.form.bottom_text_upload_01.value = this.value;" class="realupload_main"  > 
							</div>
						 </td>
					</tr>
				</tbody>
			</table>
			<div class="btn_area clearfix">
				<div class="f_right">
					<a href="#"><span class="btn btn-ok">등록</span></a>
				</div>
			</div>	
			<!-- // 하단배너  -->

			<!-- 제품    -->
			<h2 class="conspan2"> 제품  </h2> <span class="c_red"> 175*107 px  .JPG로 입력하세요 </span>
			<table cellpadding="0" cellspacing="0" border="0" class="table_new">
				<thead>
					<tr> 
						<th width="10%"> 순서  </th>
						<th> 파일명  </th>
						<th width="15%"> 등록  </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> 1</td>
						<td class="alignleft">
							<div  class="upload_box" >
								<label for="pdt_name" class="up_label"> 제품명   </label>
								<div class="upload_main">
									<input type="text" name="pdt_name" > 
								</div>
							</div>
							<div  class="upload_box  mB" >
								<label for="pdt_ex" class="up_label"> 제품설명    </label>
								<div class="upload_main">
									<input type="text" name="pdt_ex" > 
								</div>
							</div>
							<div  class="upload_box mB" >
								<label for="bottom_file_01" class="up_label"> 파일경로  </label>
								<div class="upload_main">
									<input type="text" name="pdt_text_upload_01" > 
								</div>
							</div>	
							<div  class="upload_box" >
								<label for="bottom_link_01" class="up_label"> 링크URL  </label>
								<div class="upload_main">
										<input type="text" name="bottom_link_01" > 
								</div>
							</div>				
						</td>
						<td> 
							<div class="fakeupload_main" >  <!--  파일선택 버튼  -->
								<label for="pdt_click_upload_01" class="label_hidden"> 파일경로  </label>
								<input type="file" id="pdt_click_upload_01" name="imgfile"  onchange="this.form.pdt_text_upload_01.value = this.value;" class="realupload_main"  > 
							</div>
						 </td>
					</tr>
				</tbody>
			</table>
			<div class="btn_area clearfix">
				<div class="f_right">
					<a href="#"><span class="btn btn-ok">등록</span></a>
				</div>
			</div>	
			<!-- // 제품  -->


		</from>

					
	</div><!--//  wrap_box -->
	
		
</div>
</div>
<!--//  CONTENT -->

</asp:Content>