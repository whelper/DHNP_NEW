<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="pdt_ex_ani_detail.aspx.cs" Inherits="AdminSite.pdt.pdt_ex_ani_detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
	
<div id="page-heading">
	<h1> 수출  의약품(동물)  </h1>
</div>

<div class="wrap_box">
    <ul class="list_tab  clearfix target" >
		<li<%if ("KOR".Equals(LANG_CD)) { %> class="tab_on"<%} %>><a href="pdt_ex_ani_detail.aspx?prod_cd=<%=ProdCd %>&LANG_CD=KOR">국문</a></li>
		<li<%if ("ENG".Equals(LANG_CD)) { %> class="tab_on"<%} %>><a href="pdt_ex_ani_detail.aspx?prod_cd=<%=ProdCd %>&LANG_CD=ENG">영문</a></li>
	</ul>
	<table cellpadding="0" cellspacing="0" border="0" class="table_frm">
		<colgroup>
			<col width="10%">
			<col>
		</colgroup>
		<tbody>
			<tr>
					<th scope="row"> 
						<label for="pdt_name">등록일</label>     
					</th>
					<td class="alignleft" colspan="2">     
						<input type="text" runat="server" id="reg_dt" value="" class="span2 text" onkeyup="assist();" onblur="assist();" />
					</td>
				</tr>
			<tr>
				<th scope="row"> 
					<label for="pdt_code"> Product Code </label>   <!-- 제품코드 -->
				</th>
				<td class="alignleft" colspan="2">     
					<input type="text" runat="server" id="prod_cd"  value="" class="span6 text mR10" />      
					<label for="pdt_human">	<input type="radio" runat="server" id="pdt_human" name="pdt_style" class="inline" value="PROD_BODY_DRUG" />인체 의약품</label>  &nbsp;
					<label for="pdt_ani">	<input type="radio" runat="server" id="pdt_ani"   name="pdt_style" class="inline" value="PROD_ANI_DRUG" />동물 의약품</label> 
				</td>
			</tr>
			<tr>
				<th scope="row"> 
					<label for="pdt_name"> Name </label>   <!-- 제품명 -->
				</th>
				<td class="alignleft" colspan="2">     
					<input type="text" runat="server" id="prod_nm" value="" class="span6 text"  />      
				</td>
			</tr>
			<tr>
				<th scope="row">
					<label for="pdt_select_02">  Categories </label>  <!-- 분류 -->
				</th>
				<td>  
					<asp:DropDownList ID="catg_no2" runat="server" AutoPostBack="false" />
				</td>
			</tr>
			<tr>
				<th scope="row"> 
					<label for="pdt_nember">   분류번호   </label>   
				</th>
				<td class="alignleft" colspan="2">     
					<input type="text" runat="server" id="catg_no" value="" class="span6 text" />    
				</td>
			</tr>
			<tr>
				<th scope="row"> 
					<label for="pdt_kuseong">  Composition  </label>    <!-- 구성    -->
				</th>
				<td class="alignleft" colspan="2">     
					<input type="text" runat="server" id="compt"  value=""  class="span6 text" />       
				</td>
			</tr> 
			<tr>
				<th scope="row">
						<label for="pdt_unit">  Package  </label> 
				</th> <!-- 포장단위 -->
				<td class="alignleft">  
					<input type="text" runat="server" id="pack_mea" value="" class="span6 text" />   
				</td>
			</tr>
			<tr>
				<th scope="row">  
					<label for="pdt_info"> Indications   </label> 
				</th>  <!-- 정보 -->
				<td class="alignleft" colspan="2">     
                    <textarea  id="prod_info" runat="server" class="textarea_detail" ></textarea>  
				</td>
			</tr>

			<tr>
				<th scope="row" class="th_top"> 
					<label for="pdt_ex">  제품설명 <br> (효능 효과 / 용법용량)   </label> 
				</th>
				<td >
                    <asp:TextBox ID="usage" runat="server" CssClass="textarea_detail_adit" style="width:1000px;" TextMode="MultiLine" ></asp:TextBox>
				</td>
			</tr>
			<tr>
				<th scope="row"> 
					<label for="tag"  id="tag" >태그</label> 
				</th>
				<td class="alignleft"> 
					<input  type="text" runat="server" id="tag01" class="span22 text" value="" /> 
					<input  type="text" runat="server" id="tag02" class="span22 text" value="" /> 
					<input  type="text" runat="server" id="tag03" class="span22 text" value="" /> 
					<input  type="text" runat="server" id="tag04" class="span22 text" value="" /> 
					<input  type="text" runat="server" id="tag05" class="span22 text" value="" /> 
					<input  type="text" runat="server" id="tag06" class="span22 text" value="" /> 
				</td>
			</tr>
			<tr>
				<th>
					<label for="realupload_01">제품 이미지 1<br />(300x220, 2~3배율 가능)</label>
				</th>
				<td class="alignleft">
					<div class="upload">
						<div class="fakeupload">
						    <input type="text" id="upload_path_01" name="fakeupload_01" runat="server" /> <!-- browse button is here as background -->
						</div>
						    <asp:FileUpload ID="upload_01" runat="server" CssClass="realupload" />
					</div>
                    <% 
                        if (GetData(0, 0, "PROD_IMG1").Equals("") == false)
                        {
                    %>
                    <asp:HiddenField runat="server" ID="h_prod_img1_path" />
                    <asp:LinkButton ID="btnProdImg1" runat="server" onclick="btnProdImg1_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
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
                        if (GetData(0, 0, "PROD_IMG1").Equals("") == false)
                        {
                    %>
                    <a href="javascript:open_popup('<%=GetData(0, 0, "PROD_IMG1") %>');">보기</a>
                    <% 
                        }
                    %>
                    </span>
				</td>
			</tr>
			<tr>
				<th><label for="realupload_02">제품 이미지 2<br />(300x220, 2~3배율 가능)</label></th>
				<td class="alignleft">
					<div class="upload">
						<div class="fakeupload">
						    <input type="text" id="upload_path_02" name="fakeupload_02" runat="server" /> <!-- browse button is here as background -->
						</div>
						    <asp:FileUpload ID="upload_02" runat="server" CssClass="realupload" />
					</div>
                    <% 
                        if (GetData(0, 0, "PROD_IMG2").Equals("") == false)
                        {
                    %>
                    <asp:HiddenField runat="server" ID="h_prod_img2_path" />
                    <asp:LinkButton ID="btnProdImg2" runat="server" onclick="btnProdImg2_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
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
                        if (GetData(0, 0, "PROD_IMG2").Equals("") == false)
                        {
                    %>
                    <a href="javascript:open_popup('<%=GetData(0, 0, "PROD_IMG2") %>');">보기</a>
                    <% 
                        }
                    %>
                    </span>
				</td>
			</tr>
			<tr>
				<th><label for="realupload_03">제품 이미지 3<br />(300x220, 2~3배율 가능)</label></th>
				<td class="alignleft">
					<div class="upload">
						<div class="fakeupload">
						    <input type="text" id="upload_path_03" name="fakeupload_03" runat="server" /> <!-- browse button is here as background -->
						</div>
						    <asp:FileUpload ID="upload_03" runat="server" CssClass="realupload" />
					</div>
                    <% 
                        if (GetData(0, 0, "PROD_IMG3").Equals("") == false)
                        {
                    %>
                    <asp:HiddenField runat="server" ID="h_prod_img3_path" />
                    <asp:LinkButton ID="btnProdImg3" runat="server" onclick="btnProdImg3_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
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
                        if (GetData(0, 0, "PROD_IMG3").Equals("") == false)
                        {
                    %>
                    <a href="javascript:open_popup('<%=GetData(0, 0, "PROD_IMG3") %>');">보기</a>
                    <% 
                        }
                    %>
                    </span>
				</td>
			</tr>
			<tr>
				<th><label for="realupload_04">제품 이미지 4<br />(300x220, 2~3배율 가능)</label></th>
				<td class="alignleft">
					<div class="upload">
						<div class="fakeupload">
						    <input type="text" id="upload_path_04" name="fakeupload_04" runat="server" /> <!-- browse button is here as background -->
						</div>
						    <asp:FileUpload ID="upload_04" runat="server" CssClass="realupload" />
					</div>
                    <% 
                        if (GetData(0, 0, "PROD_IMG4").Equals("") == false)
                        {
                    %>
                    <asp:HiddenField runat="server" ID="h_prod_img4_path" />
                    <asp:LinkButton ID="btnProdImg4" runat="server" onclick="btnProdImg4_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
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
                        if (GetData(0, 0, "PROD_IMG4").Equals("") == false)
                        {
                    %>
                    <a href="javascript:open_popup('<%=GetData(0, 0, "PROD_IMG4") %>');">보기</a>
                    <% 
                        }
                    %>
                    </span>
				</td>
			</tr>
			<tr>
				<th><label for="realupload_05">제품 이미지 5<br />(300x220, 2~3배율 가능)</label></th>
				<td class="alignleft">
					<div class="upload">
						<div class="fakeupload">
						    <input type="text" id="upload_path_05" name="fakeupload_05" runat="server" /> <!-- browse button is here as background -->
						</div>
						    <asp:FileUpload ID="upload_05" runat="server" CssClass="realupload" />
					</div>
                    <% 
                        if (GetData(0, 0, "PROD_IMG5").Equals("") == false)
                        {
                    %>
                    <asp:HiddenField runat="server" ID="h_prod_img5_path" />
                    <asp:LinkButton ID="btnProdImg5" runat="server" onclick="btnProdImg5_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
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
                        if (GetData(0, 0, "PROD_IMG5").Equals("") == false)
                        {
                    %>
                    <a href="javascript:open_popup('<%=GetData(0, 0, "PROD_IMG5") %>');">보기</a>
                    <% 
                        }
                    %>
                    </span>
				</td>
			</tr>
			<tr>
				<td class="alignleft" colspan="2" ></td>
			</tr>
			<tr>
				<th>Youtube 동영상 </th>
				<td colspan="3">
					<input type="text" runat="server" id="clip_url" name="clip_url" class="input-xxlarge"  value="" /> * 
					<a href="#pop_mov_guide" data-toggle="modal">Youtube 동영상 링크 방법</a>
                    <% 
                        if (GetData(0, 0, "CLIP_URL").Equals("") == false)
                        {
                    %>
                    <div class="movie_iframe">
                        <iframe width="100%" height="100%" style="height:100%" src="http://www.youtube.com/embed/<%=GetData(0, 0, "CLIP_URL")%>" frameborder="0" allowscriptaccess="always" allowfullscreen="true"></iframe>
                    </div>
                    <% 
                        }
                        else
                        {
                    %>
                    <div class="movie_iframe" style="display:none;">
                    <%
                        }
                    %>
				</td>
			</tr>
			<tr>
				<th><label for="pdt_ex_file"> 설명 </label></th>
				<td class="alignleft">
					<div class="upload">
						<div class="fakeupload">
							<input type="text" id="upload_path_file" name="upload_path_file" runat="server" /><!-- browse button is here as background -->
						</div>
                        <% 
                            if (GetData(0, 0, "MANUAL").Equals("") == false)
                            {
                        %>
                        <asp:HiddenField runat="server" ID="h_prod_menual_path" />
                        <asp:LinkButton ID="btnProdMenual" runat="server" onclick="btnProdMenual_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
                        <span class="btn">파일삭제</span>
                        </asp:LinkButton>
                        <% 
                            }
                            else
                            {
                        %>
                        <span class="btn disabled">파일삭제</span>
                        <% 
                            }
                        %>
						<asp:FileUpload ID="upload_file" runat="server" CssClass="realupload" />
					</div>
					<span class="side_span">* 현재 파일 : <a href="<%=GetData(0, 0, "MANUAL") %>" title="<%=GetData(0, 0, "MANUAL") %>"><%=GetFileName(GetData(0, 0, "MANUAL"), 65)%></a></span>
				</td>
			</tr>
			<tr>
				<th scope="row" > 
					<label for="">제품 노출 여부</label>   
				</th>
				<td class="alignleft" colspan="2">   
                    <label for="open_yn1"> <asp:RadioButton runat="server"  ID="open_yn1" GroupName="open_yn" value="Y"  Text=" 노출" /></label>
                    <label for="open_yn2"> <asp:RadioButton runat="server"  ID="open_yn2" GroupName="open_yn" value="N" Text="노출안함" style="margin-left:5px" /> </label>

				</td>
			</tr>
		</tbody>
	</table>

    <input type="hidden" id="hdnContent" runat="server" />

	<div class="btn_area clearfix">
		<div class="f_left"><a href="javascript:history.back();"><span class="btn">목록</span></a></div>
		<div class="f_right">
			<asp:LinkButton ID="btnDel" runat="server" onclick="btnDel_Click" OnClientClick="return validConfirm();"><span class="btn">삭제</span></asp:LinkButton>
			<asp:LinkButton ID="btnSave" runat="server" onclick="btnSave_Click" OnClientClick="return CheckValid();"><span class="btn btn-ok">저장</span></asp:LinkButton>
		</div>
	</div>
</div><!--//  wrap_box -->

	<!-- POPUP - 동영상 링크 방법 -->
	<div id="pop_mov_guide" class="modal hide fade" style="display: none; ">
		<div class="modal-header">
			<h3>Youtube 동영상 링크 방법</h3>
			<button type="button" class="close" data-dismiss="modal"><span class="icon_close"></span></button>
		</div>
		<div class="modal-body">	
			<p class="aligncenter"><img src="../common/images/guide_youtube_link.jpg" alt="동영상" /></p>
			<br />
			<p>1. 원하는 동영상을 재생합니다.</p>
			<p>2. 브라우저의 주소창에서 위 그림의 빨간 사각형으로 표시한 부분을 복사하여 붙여넣기 합니다.</p>
		</div>
		<div class="modal-footer">
			 <a href="#" data-dismiss="modal"><button class="btn">닫기</button></a>
		</div>
	</div>
	<!-- end: POPUP 동영상 링크 방법 -->	
		
</div>
</div>
<!--//  CONTENT -->

<script type="text/javascript" src="<%=GetRoot()%>/common/se/js/HuskyEZCreator.js" charset="utf-8"></script>
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

    function CheckValid() {
        var content = document.getElementById("<%= hdnContent.ClientID %>");
        content.value = oEditors.getById["<%= usage.ClientID %>"].getIR();
		if (!isValidDatetime($("#<%=reg_dt.ClientID%>").val())) return false;

        textfd.chk('<%= prod_cd.ClientID %>', "제품코드를 입력하세요!");
        textfd.chk('<%= prod_nm.ClientID %>', "제품명을 입력하세요!");

        if (textfd.result()) {
            return confirm('저장하시겠습니까?');
        } else {
            return false;
        }

        //return textfd.result(); //모든 필드가 만족되면 true를 리턴한다.
    }

    /**
    * 스마트 에디터 영역
    */
    var oEditors = [];
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "<%= usage.ClientID %>",
        sSkinURI: "<%=GetRoot()%>/common/se/SmartEditor2Skin.html",
        htParams: {
            bUseToolbar: true, 			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer: true, 	// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger: true, 		// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            fOnBeforeUnload: function () {
                //alert("아싸!");	
            }
        }, //boolean
        fOnAppLoad: function () {
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["내용"]);
        },
        fCreator: "createSEditor2"
    });

    function pasteHTML() {
        var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
        oEditors.getById["usage"].exec("PASTE_HTML", [sHTML]);
    }

    function showHTML() {
        var sHTML = oEditors.getById["usage"].getIR();
        alert(sHTML);
    }

    function submitContents(elClickedObj) {
        oEditors.getById["usage"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

        if (document.getElementById("usage").value == "") {
            alert("내용을 입력해 주세요.");
            $("#usage").focus();
        } else {
            var msg = '저장하시겠습니까?';

            if (confirm(msg)) {
                try {
                    elClickedObj.form.submit();
                } catch (e) {
                    alert(e);
                }
            }
        }
    }

    function setDefaultFont() {
        var sDefaultFont = '궁서';
        var nFontSize = 24;
        oEditors.getById["usage"].setDefaultFont(sDefaultFont, nFontSize);
    }

    function validConfirm() {
        if (confirm("삭제하시겠습니까?")) {
            return true;
        }

        return false;
    }

</script>

</asp:Content>
