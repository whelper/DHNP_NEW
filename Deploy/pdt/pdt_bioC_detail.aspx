<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="pdt_bioC_detail.aspx.cs" Inherits="AdminSite.pdt.pdt_bioC_detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
	
	<div id="page-heading">
		<h1>카탈로그</h1>
	</div>
	<div class="wrap_box">
	    <ul class="list_tab  clearfix target" >
			<li<%if ("KOR".Equals(LANG_CD)) { %> class="tab_on"<%} %>><a href="pdt_bioC_detail.aspx?prod_cd=<%=ProdCd %>&LANG_CD=KOR">국문</a></li>
			<li<%if ("ENG".Equals(LANG_CD)) { %> class="tab_on"<%} %>><a href="pdt_bioC_detail.aspx?prod_cd=<%=ProdCd %>&LANG_CD=ENG">영문</a></li>
		</ul>
		
			<table cellpadding="0" cellspacing="0" border="0" class="table_frm">
				<colgroup>
					<col width="10%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"> 
							<label for="pdt_name">제목</label>     
						</th>
						<td class="alignleft" colspan="2">     
						 	<input type="text" id="ttl" runat="server" value="" class="span6 text" />      
						</td>
					</tr>
                    <tr>
						<th scope="row" class="th_top"> 
							<label for="pdt_ex">회사소개</label> 
						</th>
						<td>
                            <textarea  id="intro" runat="server" class="textarea_detail" style="width:980px;"></textarea>  
						</td>
					</tr>
					<tr>
						<th scope="row" class="th_top"> 
							<label for="pdt_ex">주요제품</label> 
						</th>
						<td >
                            <asp:TextBox ID="cont" runat="server" CssClass="textarea_detail_adit" style="width:1000px;" TextMode="MultiLine" ></asp:TextBox>
						</td>
					</tr>
					<tr>
					    <th scope="row"> 
						    <label for="tag" id="tag">태그</label> 
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
						<td class="alignleft" colspan="2" ></td>
					</tr>
					<tr>
					    <th>
						    <label for="realupload_01">섬네일<br />(116x102)</label>
					    </th>
					    <td class="alignleft">
						    <div class="upload">
						        <div class="fakeupload">
						            <input type="text" id="upload_path_01" name="fakeupload_01" runat="server" /> <!-- browse button is here as background -->
						        </div>
						            <asp:FileUpload ID="upload_01" runat="server" CssClass="realupload" />
						    </div>
                            <% 
                                if (GetData(0, 0, "THUMBNAIL").Equals("") == false)
                                {
                            %>
                            <asp:HiddenField runat="server" ID="h_thumbnail_path" />
                            <asp:LinkButton ID="btnThumbnail" runat="server" onclick="btnThumbnail_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
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
                            <span class="side_span">* 현재 파일 : 
                            <% 
                                if (GetData(0, 0, "THUMBNAIL").Equals("") == false)
                                {
                            %>
                            <a href="javascript:open_popup('<%=GetData(0, 0, "THUMBNAIL") %>');">보기</a>
                            <% 
                                }
                            %>
                            </span>
					    </td>
				    </tr>
				    <tr>
					    <th><label for="realupload_02">카달로그</label></th>
					    <td class="alignleft">
						    <div class="upload">
						        <div class="fakeupload">
						            <input type="text" id="upload_path_02" name="fakeupload_02" runat="server" /> <!-- browse button is here as background -->
						        </div>
						            <asp:FileUpload ID="upload_02" runat="server" CssClass="realupload" />
						    </div>
                            <% 
                                if (GetData(0, 0, "CATALOG").Equals("") == false)
                                {
                            %>
                            <asp:HiddenField runat="server" ID="h_catalog_path" />
                            <asp:LinkButton ID="btnCatalog" runat="server" onclick="btnCatalog_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
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
                            <span class="side_span">* 현재 파일 : <a href="<%=GetData(0, 0, "CATALOG") %>" title="<%=GetData(0, 0, "CATALOG") %>"><%=GetFileName(GetData(0, 0, "CATALOG"), 65)%></a></span>
					    </td>
				    </tr>
				</tbody>
			</table>
		<div class="btn_area clearfix">
			<div class="f_left"><a href="javascript:history.back();"><span class="btn">목록</span></a></div>
			<div class="f_right">
				<asp:LinkButton ID="btnDel" runat="server" onclick="btnDel_Click" OnClientClick="return validConfirm();"><span class="btn">삭제</span></asp:LinkButton>
				<asp:LinkButton ID="btnSave" runat="server" onclick="btnSave_Click" OnClientClick="return CheckValid();"><span class="btn btn-ok">저장</span></asp:LinkButton>
			</div>
		</div>
	</div><!--//  wrap_box -->

    <input type="hidden" id="hdnContent" runat="server" />
    <input type="hidden" id="seqNo" runat="server" />
		
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
        content.value = oEditors.getById["<%= cont.ClientID %>"].getIR();

        textfd.chk('<%= ttl.ClientID %>', "제목을 입력하세요!");

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
        elPlaceHolder: "<%= cont.ClientID %>",
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
        oEditors.getById["cont"].exec("PASTE_HTML", [sHTML]);
    }

    function showHTML() {
        var sHTML = oEditors.getById["cont"].getIR();
        alert(sHTML);
    }

    function submitContents(elClickedObj) {
        oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

        if (document.getElementById("cont").value == "") {
            alert("내용을 입력해 주세요.");
            $("#cont").focus();
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
        oEditors.getById["cont"].setDefaultFont(sDefaultFont, nFontSize);
    }

    function validConfirm() {
        if (confirm("삭제하시겠습니까?")) {
            return true;
        }

        return false;
    }

</script>
</asp:Content>