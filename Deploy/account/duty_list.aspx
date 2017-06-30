<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="duty_list.aspx.cs" Inherits="AdminSite.account.duty_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
  
	<div id="page-heading">
		<h1>채용직무관리</h1>
	</div>

	<div class="wrap_box">
        <ul class="list_tab  clearfix target" >
		    <li class="tab_on"><a href="duty_list.aspx">직무관리</a></li>
		    <li><a href="rcm_auth_list.aspx">부서관리</a></li>
	    </ul>
		<table cellpadding="0" cellspacing="0" border="0" class="table_new scrollTable">
			<thead>
				<tr>
					<th width="10%">직무번호</th>
                    <th>직무명</th>
                    <th>노출순서</th>
					<th width="7%">삭제</th>
				</tr>
			</thead>
			<tbody>
            <% 
                for (int i = 0; i < GetDataCount(); i++)
                {
            %>
				<tr>
					<td><%=GetData(i, "DUTY_NO")%></td>
					<td><a href="duty_list.aspx?duty_no=<%=GetData(i, "DUTY_NO")%>&crud=S"><%=GetData(i, "DUTY_NM")%></a></td>
                    <td><%=GetData(i, "SORT_ORD")%></td>
                    <td><a href="javascript:CheckDelValid('<%=GetData(i, "DUTY_NO")%>');" class="btn-link">삭제</a></td>
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
			</colgroup>
			<tr>
				<th>직무명</th>
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
        textfd.chk('<%= duty_nm.ClientID %>', "직무명을 입력해 주세요.");

        if (textfd.result()) {
            return confirm('저장하시겠습니까?');
        } else {
            return false;
        }
    }

    function CheckDelValid(duty_no) {
        if (confirm('삭제하시겠습니까?')) {
            location.href = "duty_list.aspx?duty_no=" + duty_no + "&crud=D";
        }
    }
</script>

</asp:Content>
