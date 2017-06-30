<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="new_detail.aspx.cs" Inherits="AdminSite.pr.new_detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
  
	<div id="page-heading">
		<h1> 새소식 </h1>
	</div>

	<div class="wrap_box">
		<table cellpadding="0" cellspacing="0" border="0" class="table_frm">
			<colgroup>
				<col width="10%">
				<col>
			</colgroup>
				<tbody>
					<tr>
						<th scope="row"> 
							<label for="pdt_name01">작성자</label> 
						</th>
						<td class="alignleft" colspan="2">
						 	<input type="text" id="writerNm" class="span6 text" runat="server">      
						</td>
					</tr>
					<tr>
						<th scope="row"> 
							<label for="pdt_name03">제목</label>   
						</th>
						<td class="alignleft" colspan="2">     
						 	<input type="text" runat="server" id="txtTitle" class="span6 text">
						</td>
					</tr>
				<tr>
					<th scope="row" class="th_top"> 
						<label for="pdt_name04">내용</label>
					</th>
					<td> <asp:TextBox ID="txtBoxBody" runat="server" CssClass="textarea_detail_adit" style="width:1000px;" TextMode="MultiLine" ></asp:TextBox></td>
				</tr>
				<tr>
					<th>
						<label for="realupload_01">첨부파일 1</label>
					</th>
					<td class="alignleft">
						<div class="upload">
						    <div class="fakeupload">
						        <input type="text" id="upload_path_01" name="fakeupload_01" runat="server" /> <!-- browse button is here as background -->
						    </div>
						     <asp:FileUpload ID="upload_01" runat="server" CssClass="realupload" />
						</div>
                        <%
                            if (GetData(0, "IMG1").Equals("") == false)
                            {
                        %>
                        <asp:HiddenField runat="server" ID="h_prod_img1_path" />
                        <asp:LinkButton ID="btnImg1" runat="server" onclick="btnImg1_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
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
						<span class="side_span">* 현재 파일 : <a href="<%=GetData(0, "IMG1") %>" title="<%=GetData(0, "IMG1") %>"><%=GetFileName(GetData(0, "IMG1"), 65) %></a></span>
					</td>
				</tr>
				<tr>
					<th><label for="realupload_02">첨부파일 2</label></th>
					<td class="alignleft">
						<div class="upload">
						    <div class="fakeupload">
						        <input type="text" id="upload_path_02" name="fakeupload_02" runat="server" /> <!-- browse button is here as background -->
						    </div>
						     <asp:FileUpload ID="upload_02" runat="server" CssClass="realupload" />
						</div>
                        <% 
                            if (GetData(0, "IMG2").Equals("") == false)
                            {
                        %>
                        <asp:HiddenField runat="server" ID="h_prod_img2_path" />
                        <asp:LinkButton ID="btnImg2" runat="server" onclick="btnImg2_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
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
						<span class="side_span">* 현재 파일 : <a href="<%=GetData(0, "IMG2") %>" title="<%=GetData(0, "IMG2") %>"><%=GetFileName(GetData(0, "IMG2"), 65) %></a></span>
					</td>
				</tr>
				<tr>
					<th><label for="realupload_03">첨부파일 3</label></th>
					<td class="alignleft">
						<div class="upload">
						    <div class="fakeupload">
						        <input type="text" id="upload_path_03" name="fakeupload_03" runat="server" /> <!-- browse button is here as background -->
						    </div>
						     <asp:FileUpload ID="upload_03" runat="server" CssClass="realupload" />
						</div>
                        <% 
                            if (GetData(0, "IMG3").Equals("") == false)
                            {
                        %>
                        <asp:HiddenField runat="server" ID="h_prod_img3_path" />
                        <asp:LinkButton ID="btnImg3" runat="server" onclick="btnImg3_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
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
						<span class="side_span">* 현재 파일 : <a href="<%=GetData(0, "IMG3") %>" title="<%=GetData(0, "IMG3") %>"><%=GetFileName(GetData(0, "IMG3"), 65) %></a></span>
					</td>
				</tr>
				<tr>
					<th><label for="realupload_04">첨부파일 4</label></th>
					<td class="alignleft">
						<div class="upload">
						   <div class="fakeupload">
						        <input type="text" id="upload_path_04" name="fakeupload_04" runat="server" /> <!-- browse button is here as background -->
						    </div>
						     <asp:FileUpload ID="upload_04" runat="server" CssClass="realupload" />
						</div>
                        <% 
                            if (GetData(0, "IMG4").Equals("") == false)
                            {
                        %>
                        <asp:HiddenField runat="server" ID="h_prod_img4_path" />
                        <asp:LinkButton ID="btnImg4" runat="server" onclick="btnImg4_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
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
						<span class="side_span">* 현재 파일 : <a href="<%=GetData(0, "IMG4") %>" title="<%=GetData(0, "IMG4") %>"><%=GetFileName(GetData(0, "IMG4"), 65) %></a></span>
					</td>
				</tr>
				<tr>
					<th><label for="realupload_04">첨부파일 5</label></th>
					<td class="alignleft">
						<div class="upload">
						    <div class="fakeupload">
						        <input type="text" id="upload_path_05" name="fakeupload_05" runat="server" /> <!-- browse button is here as background -->
						    </div>
						     <asp:FileUpload ID="upload_05" runat="server" CssClass="realupload" />
						</div>
                        <% 
                            if (GetData(0, "IMG5").Equals("") == false)
                            {
                        %>
                        <asp:HiddenField runat="server" ID="h_prod_img5_path" />
                        <asp:LinkButton ID="btnImg5" runat="server" onclick="btnImg5_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
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
						<span class="side_span">* 현재 파일 : <a href="<%=GetData(0, "IMG5") %>" title="<%=GetData(0, "IMG5") %>"><%=GetFileName(GetData(0, "IMG5"), 65) %></a></span>
					</td>
				</tr>
				<tr>
					<td class="alignleft" colspan="2"></td>
				</tr>
				<tr>
					<th>Youtube 동영상 </th>
					<td colspan="3">
						<input name="mv_path_story" class="input-xxlarge" id="mv_path_story" type="text"  runat="server"> * 
						<a href="#pop_mov_guide" data-toggle="modal">Youtube 동영상 링크 방법</a>
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
        content.value = oEditors.getById["<%= txtBoxBody.ClientID %>"].getIR();

        textfd.chk('<%= txtTitle.ClientID %>', "제목을 입력하세요!");
        textfd.chk('<%= hdnContent.ClientID %>', "내용을 입력하세요!");
        
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
        elPlaceHolder: "<%= txtBoxBody.ClientID %>",
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
        oEditors.getById["txtBoxBody"].exec("PASTE_HTML", [sHTML]);
    }

    function showHTML() {
        var sHTML = oEditors.getById["txtBoxBody"].getIR();
        alert(sHTML);
    }

    function submitContents(elClickedObj) {
        oEditors.getById["txtBoxBody"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

        if (trim($("#txtTitle").val()) == "") {
            alert("제목을 입력해 주세요.");
            $("#txtTitle").focus();
        } else if (document.getElementById("txtBoxBody").value == "") {
            alert("내용을 입력해 주세요.");
            $("#txtBoxBody").focus();
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
        oEditors.getById["txtBoxBody"].setDefaultFont(sDefaultFont, nFontSize);
    }

    function validConfirm() {
        if (confirm("삭제하시겠습니까?")) {
            return true;
        }
        
        return false;
    }

</script>

</asp:Content>
