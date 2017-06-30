<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="rcm_auth_list.aspx.cs" Inherits="AdminSite.account.rcm_auth_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
  
	<div id="page-heading">
		<h1>채용직무관리</h1>
	</div>

	<div class="wrap_box">
        <ul class="list_tab  clearfix target" >
		    <li><a href="duty_list.aspx">직무관리</a></li>
		    <li class="tab_on"><a href="rcm_auth_list.aspx">부서관리</a></li>
	    </ul>
		<table cellpadding="0" cellspacing="0" border="0" class="table_new scrollTable">
			<thead>
				<tr>
					<th width="">직무구분</th>
                    <th width="">부서명</th>
                    <th width="">노출순서</th>
					<th width="10%">권한수정</th>
					<th width="7%">삭제</th>
				</tr>
			</thead>
			<tbody>
            <% 
                for (int i = 0; i < GetDataCount(); i++)
                {
            %>
				<tr>
                    <% 
                        if (GetData(i, "DUTY_NO").Equals("") == false)
                        {
                    %>
					<td><%=GetData(i, "UPR_DUTY_NM")%></td>
					<td><a href="rcm_auth_list.aspx?duty_no=<%=GetData(i, "DUTY_NO")%>&crud=S"><%=GetData(i, "DUTY_NM")%></a></td>
                    <td><%=GetData(i, "SORT_ORD")%></td>
					<td><a href="#pop_menu" data-toggle="modal"><span onclick="javascript:getDutyAuth('<%=GetData(i, "DUTY_NO")%>');">권한관리</span></a></td>
                    <td><a href="javascript:CheckDelValid('<%=GetData(i, "DUTY_NO")%>');" class="btn-link">삭제</a></td>
                    <% 
                        }
                        else
                        {
                    %>
                    <td><%=GetData(i, "UPR_DUTY_NM")%></td>
					<td>등록된 부서 없음</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <% 
                        }
                    %>
				</tr>
            <% 
                }
            %>
			</tbody>
		</table>

		<table cellpadding="0" cellspacing="0" border="0" class="table_frm">
			<colgroup>
				<col width="15%" />
				<col width="20%" />
				<col width="15%" />
				<col width="25%" />
				<col width="15%" />
				<col width="25%" />
			</colgroup>
			<tr>
				<th>직무구분</th>
				<td><asp:DropDownList ID="upr_duty_no" runat="server" AutoPostBack="false" /></td>
				<th>부서명</th>
				<td><input type="text" id="duty_nm" name="duty_nm" runat="server" /></td>
                <th>노출순서</th>
				<td><input type="text" id="sort_ord" name="sort_ord" runat="server" /></td>
			</tr>

            <input type="hidden" runat="server" id="duty_no" />
		</table>

        <div class="btn_area clearfix">
            <div class="f_right">
                <% if (CRUD != null && CRUD.Equals("S") && DutyNo != null)
                   {
                %>
                <asp:LinkButton runat="server" ID="btnMod" OnClick="btnMod_Click" OnClientClick="return CheckModValid();"><span class="btn btn-ok">수정</span></asp:LinkButton>
                <% 
                   }
                   else
                   {
                %>
                <asp:LinkButton runat="server" ID="btnAdd" OnClick="btnAdd_Click" OnClientClick="return CheckModValid();"><span class="btn btn-ok">추가</span></asp:LinkButton>
                <% 
                   }
                %>
        	 </div>
        </div>
	</div><!--//  wrap_box -->


	<!-- POPUP 카테고리 편집 -->
	<div id="pop_menu" class="modal hide fade " style="display: none; ">
		<div class="modal-header">
		  <h3>권한관리</h3>
		  <button type="button" class="close" data-dismiss="modal"><span class="icon_close"></span></button>
		</div>
		<div class="modal-body">
            로그인ID 입력, 각 ID별 구분자: 콤마 ","
			<div class="menu_wrap">
				<ul>
					<li>
						<label for="system" class="d1">채용관리자</label>
                        <textarea id="rcm_auth" name="rcm_auth" class="textarea_detail" rows="10" style="width:90%; margin:10px; height:140px;"></textarea>
                        
					</li>
				</ul>
                <ul>
					<li>
						<label for="system" class="d1">채용부관리자 (이력서 확인만 가능)</label>
						<textarea id="rcm_auth_sub" name="rcm_auth_sub" class="textarea_detail" rows="10" style="width:90%; margin:10px; height:140px;"></textarea>
					</li>
				</ul>
			</div><!-- EOT .menu_wrap -->
		</div>
		<div class="modal-footer">
			<p>* 변경 내용을 반영하시려면 반드시 '저장' 버튼을 눌러주세요.</p>
			<asp:LinkButton runat="server" ID="btnMenuSave" OnClientClick="return CheckAuthValid();" OnClick="btnAuthSave_Click"><span class="btn btn-ok">저장</span></asp:LinkButton>
			<a href="#" data-dismiss="modal"><button class="btn">닫기</button></a>
		</div>
	</div>
	<!--end: POPUP 카테고리 편집 -->

    <asp:HiddenField ID="s_duty_no" runat="server" /> 

</div>
</div>
<!--//  CONTENT -->

<!--// FOOTER -->
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

    function CheckModValid() {
        textfd.chk('<%= upr_duty_no.ClientID %>', "직무를 선택해 주세요.");
        textfd.chk('<%= duty_nm.ClientID %>', "부서를 입력해 주세요.");
        textfd.chk('<%= sort_ord.ClientID %>', "노출순서를 입력해 주세요.");

        if (textfd.result()) {
            return confirm('수정하시겠습니까?');
        } else {
            return false;
        }
    }

    function CheckAuthValid() {
        if (textfd.result()) {
            return confirm('채용관리자, 채용부관리자에 같은 아이디를 중복해서 입력하는 경우 부관리자로 적용됩니다.(기본)\n\n저장하시겠습니까?');
        } else {
            return false;
        }
    }

    function CheckDelValid(duty_no) {
        if (confirm('삭제하시겠습니까?')) {
            location.href = "rcm_auth_list.aspx?duty_no=" + duty_no + "&crud=D";
        }
    }

    function getDutyAuth(duty_no) {
        $("#ul_menu").empty();

        $("#<%= s_duty_no.ClientID %>").val(duty_no);

        $.ajax({
            type: "POST"
            , cache: false
            , url: "/ws/account.asmx/GetDutyAuth"
            , data: {
                "dutyNo": duty_no
            }
            , async: false
            , dataType: "text" // Debugging을 위해 일단 TEXT로 받는다.
            , success: function (xml, status) {
                var data = "";
                var data_sub = "";

                if (xml == null) {
                    alert("데이터를 가져오지 못했습니다.");
                } else {
                    var xmlDoc = $.parseXML(xml);
                    
                    $(xmlDoc).find("Auth").each(function () {
                        var sub_yn = $(this).find("AUTH_SUB_YN").text();

                        if (sub_yn == "Y") {
                            data_sub = data_sub + $(this).find("ADMIN_ID").text() + ",";
                        } else {
                            data = data + $(this).find("ADMIN_ID").text() + ",";
                        }
                    });

                    $("#rcm_auth").val(data);
                    $("#rcm_auth_sub").val(data_sub);
                }
            }
	        , error: function (xhr, textStatus) {
	            alert("네트워크 오류 또는 요청을 처리할 수 없습니다.");
	        }
	        , complete: function (xhr, textStatus) {
	        }
        });
    }
</script>

</asp:Content>
