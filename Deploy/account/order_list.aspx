<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="order_list.aspx.cs" Inherits="AdminSite.order.order_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
  
	<div id="page-heading">
		<h1> 계정관리  </h1>
	</div>

	<div class="wrap_box">
		<table cellpadding="0" cellspacing="0" border="0" class="table_new scrollTable">
			<thead>
				<tr> 
					<th width="15%">ID</th>
					<th width="10%">이름</th>
					<th width="">접근 가능 메뉴</th>
					<th width="10%">메뉴추가</th>
					<th width="7%">삭제</th>
				</tr>
			</thead>
			<tbody>
            <% 
                for (int i = 0; i < GetDataCount(); i++)
                {
            %>
				<tr>
					<td><a href="order_list.aspx?admin_id=<%=GetData(i, "ADMIN_ID")%>&crud=S"><%=GetData(i, "ADMIN_ID")%></a></td>
					<td><%=GetData(i, "ADMIN_NM")%></td>
					<td><%=GetData(i, "MENU_NM")%></td>
					<td><a href="#pop_menu" data-toggle="modal"><span onclick="javascript:getMenuAuth('<%=GetData(i, "ADMIN_ID")%>');">메뉴추가</span></a></td>
                    <td><a href="javascript:CheckDelValid('<%=GetData(i, "ADMIN_ID")%>');" class="btn-link">삭제</a></td>
				</tr>
            <% 
                }
            %>
			</tbody>
		</table>

		<table cellpadding="0" cellspacing="0" border="0" class="table_frm">
			<colgroup>
				<col width="10%" />
				<col width="25%" />
				<col width="10%" />
				<col width="25%" />
				<col width="10%" />
				<col width="25%" />
			</colgroup>
			<tr>
				<th>ID</th>
				<td><input type="text" id="sys_insert_member_id" name="sys_member_id" runat="server" /></td>
				<th>이름</th>
				<td><input type="text" id="sys_insert_member_nm" name="sys_member_nm" runat="server" /></td>
				<th>비밀번호</th>
				<td><input type="password" id="sys_insert_member_pwd" name="sys_member_pwd" runat="server" /></td>
			</tr>
		</table>

        <div class="btn_area clearfix">
            <div class="f_right">
                <% 
                    if (CRUD != null && CRUD.Equals("S") && AdminId != null)
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
		  <h3>메뉴추가</h3>
		  <button type="button" class="close" data-dismiss="modal"><span class="icon_close"></span></button>
		</div>
		<div class="modal-body">
			<div class="menu_wrap">
				<ul>
					<li>
						<label for="system" class="d1">메뉴</label>  
						<ul id="ul_menu" class="smenu"></ul>
					</li>
				</ul>
			</div><!-- EOT .menu_wrap -->
		</div>
		<div class="modal-footer">
			<p>* 변경 내용을 반영하시려면 반드시 '저장' 버튼을 눌러주세요.</p>
			<asp:LinkButton runat="server" ID="btnMenuSave" OnClick="btnMenuSave_Click"><span class="btn btn-ok">저장</span></asp:LinkButton>
			<a href="#" data-dismiss="modal"><button class="btn">닫기</button></a>
		</div>
	</div>
	<!--end: POPUP 카테고리 편집 -->

    <asp:HiddenField ID="s_admin_menu" runat="server" /> 

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
        textfd.chk('<%= sys_insert_member_id.ClientID %>', "ID를 입력해 주세요.");
        textfd.chk('<%= sys_insert_member_nm.ClientID %>', "이름을 입력해 주세요.");
        textfd.chk('<%= sys_insert_member_pwd.ClientID %>', "비밀번호를 입력해 주세요.");

        if (textfd.result()) {
            return confirm('수정하시겠습니까?');
        } else {
            return false;
        }
    }

    function CheckDelValid(adminId) {
        if (confirm('삭제하시겠습니까?')) {
            location.href = "order_list.aspx?admin_id=" + adminId + "&crud=D";
        }
    }

    function getMenuAuth(adminId) {
        $("#ul_menu").empty();

        $("#<%= s_admin_menu.ClientID %>").val(adminId);

        $.ajax({
            type: "POST"
            , cache: false
            , url: "/ws/account.asmx/GetMenuAuth"
            , data: {
                "adminId": adminId
            }
            , async: false
            , dataType: "text" // Debugging을 위해 일단 TEXT로 받는다.
            , success: function (xml, status) {
                if (xml == null) {
                    alert("데이터를 가져오지 못했습니다.");
                } else {
                    var xmlDoc = $.parseXML(xml);

                    var html = "";
                    $(xmlDoc).find("Menu").each(function () {
                        var checked = $(this).find("MENU_AUTH_YN").text() == "Y" ? "checked=checked" : "";

                        html += '<li>';
                        html += '<label for="sys01"><input type="checkbox" id="chk_' + $(this).find("MENU_NO").text() + '" name="chk" value="' + $(this).find("MENU_NO").text() + '" '+ checked +'/>' + $(this).find("MENU_NM").text() + '</label>';
                        html += '</li>';
                    });
                    
                    $("#ul_menu").append(html);
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
