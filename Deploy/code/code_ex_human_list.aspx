<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="code_ex_human_list.aspx.cs" Inherits="AdminSite.code.code_ex_human_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
  
	<div id="page-heading">
		<h1>수출 의약품(인체)</h1>
	</div>

	<div class="wrap_box">
        <ul class="list_tab  clearfix target" >
			<li<%if ("KOR".Equals(LANG_CD)) { %> class="tab_on"<%} %>><a href="code_ex_human_list.aspx?LANG_CD=KOR">국문</a></li>
			<li<%if ("ENG".Equals(LANG_CD)) { %> class="tab_on"<%} %>><a href="code_ex_human_list.aspx?LANG_CD=ENG">영문</a></li>
		</ul>
		<h2 class="sub_title_02">코드등록</h2>	
		<div id="cate_0" class="">		
			<table cellpadding="0" cellspacing="0" border="0" class="table_new scrollTable">
				<thead>
					<tr>
						<th width="15%">노출순서</th>
						<th>코드명</th>
						<th width="10%"> </th>
					</tr>
				</thead>
				<tbody>
                <% 
                    for (int i = 0; i < GetDataCount(); i++)
                    {
                %>
					<tr>
						<td><%=GetData(i, "SORT_ORD")%></td>
						<td><a href="./code_ex_human_list.aspx?catgNo=<%=GetData(i, "CATG_NO")%>&crud=S&LANG_CD=<%=LANG_CD %>"><%=GetData(i, "CATG_NM")%></td>
						<td><a href="#"><button type="button"class="btn-small btn-delete" onclick="javascript:CheckDelValid('<%=GetData(i, "CATG_NO")%>');">삭제</button></a></td>
					</tr>
                <% 
                    }
                %>
					<tr>
						<td><input type="text" id="sort_ord"  name="sort_ord" style="width:70%" runat="server"/></td>
						<td><input type="text" id="catg_nm"   name="catg_nm" style="width:70%" runat="server"/></td>	                    
						<td>
                            <asp:LinkButton runat="server" ID="btnSave" OnClick="btnSave_Click" OnClientClick="return CheckModValid();"><span class="btn-small btn-primary">저장</span></asp:LinkButton>
                            <asp:HiddenField ID="hSaveMode" runat="server" />
                        </td>
					<tr>
				</tbody>
			</table>			
		</div>
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

    function CheckModValid() {
        textfd.chk('<%= sort_ord.ClientID %>', "정렬 순서를 입력해 주세요.");
        textfd.chk('<%= catg_nm.ClientID %>', "코드명을 입력해 주세요.");

        if (textfd.result()) {
            return confirm('저장하시겠습니까?');
        } else {
            return false;
        }
    }

    function CheckDelValid(catgNo) {
        if (confirm('삭제하시겠습니까?')) {
            location.href = "./code_ex_human_list.aspx?catgNo=" + catgNo + "&crud=D";
        }
    }		
</script>

</asp:Content>