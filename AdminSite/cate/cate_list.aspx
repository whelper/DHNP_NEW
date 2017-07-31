<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="cate_list.aspx.cs" Inherits="AdminSite.cate.cate_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
	
	<div id="page-heading">
		<h1>카테고리 관리</h1>
	</div>

	
	<div class="wrap_box">
        <ul class="list_tab  clearfix target" >
			<li<%if ("KOR".Equals(LANG_CD)) { %> class="tab_on"<%} %>><a href="cate_list.aspx?lang_cd=KOR">국문</a></li>
			<li<%if ("ENG".Equals(LANG_CD)) { %> class="tab_on"<%} %>><a href="cate_list.aspx?lang_cd=ENG">영문</a></li>
		</ul>
		<h2 class="sub_title_02">코드등록</h2>	
		<div style="margin:10px 0">
			<asp:HiddenField ID="dbjob" runat="server" />
			<asp:HiddenField ID="parent_id" runat="server" />
			<asp:HiddenField ID="cate_no" runat="server" />
			<asp:HiddenField ID="sort_no" runat="server" />
			<asp:HiddenField ID="category" runat="server" />
			<asp:HiddenField ID="lang_cd" runat="server" />
			<span id="lbl_cate" runat="server"></span>
			<input type="text" placeholder="카테고리명" id="category_name" runat="server" />
			<%--<input type="checkbox" id="use_yn" value="Y" runat="server"> 사용--%>
			<asp:LinkButton runat="server" ID="btnSave" OnClick="btnSave_Click" OnClientClick="return CheckModValid();"><span class="btn btn-primary">등록</span></asp:LinkButton>
		</div>
		<div id="cate_0" class="">
			<table cellpadding="0" cellspacing="0" border="0" class="table_new scrollTable">
				<thead>
					<tr>
						<th width="15%">코드</th>
						<th>카테고리명</th>
						<th width="15%">관리 </th>
					</tr>

				</thead>
				<tbody>
				<% 
					for (int i = 0; i < GetDataCount(); i++)
					{
						int s = GetData(i, "CATE_CD").Length;
                %>
				<tr>
					<td class="cate ca-ml<%=s %>"><a href="?cate_no=<%=GetData(i, "CATE_NO")%>&lang_cd=<%=LANG_CD %>&dbjob=u"><%=GetData(i, "CATE_CD")%></a></td>
					<td class="cate ca-ml<%=s %>"><a href="?cate_no=<%=GetData(i, "CATE_NO")%>&lang_cd=<%=LANG_CD %>&dbjob=u"><%=GetData(i, "CATE_NAME")%></a></td>
					<td>
						<a href="?cate_no=<%=GetData(i, "CATE_NO")%>&lang_cd=<%=LANG_CD %>&dbjob=r"><span class="btn-small btn-primary">추가</span></a>
						<a href="javascript:CheckDelValid('<%=GetData(i, "CATE_NO")%>');"><span class="btn-small btn-delete">삭제</span></a>
					</td>
				</tr>
				<%
					}
				%>
				</tbody>
			</table>			
		</div>
	</div><!--//  wrap_box -->
	<!--//  wrap_box -->
	
		
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
	  textfd.chk('<%= category_name.ClientID %>', "코드명을 입력해 주세요.");

		if (textfd.result()) {
			return confirm('저장하시겠습니까?');
		} else {
			return false;
		}
  }

    function CheckDelValid(catgNo) {
        if (confirm('삭제하시겠습니까?')) {
			location.href = "./cate_list.aspx?cate_no=" + catgNo + "&dbjob=d";
        }
    }		
</script> 
</asp:Content>