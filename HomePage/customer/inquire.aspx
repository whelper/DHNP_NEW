<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="inquire.aspx.cs" Inherits="HomePage.customer.inquire" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content">
	<header>
		<h1 class="pageTitle line">제품문의</h1>
		<p class="location">
            <a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
            <a href="/customer/inquire.aspx"><span>고객</span></a><em> > </em>
			<a href="/customer/inquire.aspx"><strong>제품문의</strong></a>
		</p>
	</header>
	<!--  내용  ***************** -->
	<img src="../../common/images/sub/cust_inq_title01.png" class="mB30" alt="제품과 관련하여 문의사항이 있으시면 언제든지 연락주시기바랍니다. 의견이 접수되면 빠른 시간안에 답변드리겠습니다.">
	<table class="table_list_01 mB10" border="1" >
		<caption class="hidden">제품문의 쓰기</caption>
		<colgroup>
			<col style="width:15%">
			<col>
		</colgroup>		
		<tr>
			<th><label for="<%=gubun.ClientID %>">구 분</label></th>
			<td class="td_input">
				<asp:DropDownList ID="gubun" runat="server" style="margin:3px 1%">
				</asp:DropDownList>
			</td>
		</tr>
		<tr>
			<th><label for="<%=ttl.ClientID %>">제 목</label></th>
			<td class="td_input">
				<input type="text" id="ttl" runat="server" class="input100" />
			</td>
		</tr>
		<tr>
			<th><label for="<%=writer_nm.ClientID %>">이 름</label></th>
			<td class="td_input" >
				<input type="text" id="writer_nm" runat="server" class="input100" />
			</td>
		</tr>
		<tr>
			<th><label for="<%=tel.ClientID %>">연락처</label></th>
			<td class="td_input" >
				<input type="text" id="tel" runat="server" class="input100" />
			</td>
		</tr>
		<tr>
			<th><label for="<%=email.ClientID %>">이메일</label></th>
			<td class="td_input" >
				<input type="text" id="email" runat="server" class="input100" />
			</td>
		</tr>
		<tr>
			<th><label for="<%=cont.ClientID %>">내 용</label></th>
			<td class="td_input" >
				<textarea id="cont" runat="server" rows="10" class="textarea100"></textarea>
			</td>
		</tr>
	</table>
	<div class="right">
		<asp:LinkButton ID="btnSave" runat="server" onclick="btnSave_Click" OnClientClick="return CheckValid();"><span class="button next">문의하기</span></asp:LinkButton>
	</div>

	<!-- // 내용 ***************** -->     
</section>  <!--// sub_content -->

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
		textfd.chk('<%= gubun.ClientID %>', "구분1 선택하세요");
        textfd.chk('<%= ttl.ClientID %>', "제목을 입력하세요!");
        textfd.chk('<%= writer_nm.ClientID %>', "이름을 입력하세요!");
        textfd.chk('<%= tel.ClientID %>', "연락처를 입력하세요!");
        textfd.chk('<%= email.ClientID %>', "이메일을 입력하세요!");
        textfd.chk('<%= cont.ClientID %>', "내용을 입력하세요!");

        if (textfd.result()) {
            return confirm('저장하시겠습니까?');
        } else {
            return false;
        }

        //return textfd.result(); //모든 필드가 만족되면 true를 리턴한다.
    }
</script>

</asp:Content>