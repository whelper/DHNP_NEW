<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="notice_head.aspx.cs" Inherits="AdminSite.inv.notice_head" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
  
	<div id="page-heading">
		<h1>공지/공고</h1>
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
					<label for="pdt_title"> 제목  </label> 
				</th>
				<td class="alignleft" colspan="2">     
					<input type="text" runat="server" id="txtTitle" class="span6 text">   
				</td>
			</tr>
			<tr>
				<th scope="row" class="th_top"> 
					<label for="pdt_ex">  내용   </label> 
				</th>
				<td><asp:TextBox ID="txtBoxBody" runat="server" CssClass="textarea_detail_adit" style="width:1000px;" TextMode="MultiLine" ></asp:TextBox></td>
				</tr>
			</tbody>
		</table>
		<div class="btn_area clearfix">
			<div class="f_right">
				<asp:LinkButton ID="btnSave" runat="server" onclick="btnSave_Click" OnClientClick="return CheckValid();"><span class="btn btn-ok">등록</span></asp:LinkButton>
			</div>
		</div>	
        <input type="hidden" id="hdnContent" runat="server" />
	</div><!--//  wrap_box -->
</div>
</div>
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

