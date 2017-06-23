<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="with.aspx.cs" Inherits="HomePage.en.customer.with" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">
<section id="content" class="sub_content" >
	<header>
		<h1 class="pageTitle line">Business Proposal</h1>
		<p class="location">
			<a href="/en/index.aspx"><span><img src="/en/common/images/common/i_home.png" alt="home" /></span></a>
            <a href="/en/customer/inquire.aspx"><span>Customer</span></a><em> > </em>
			<a href="/en/customer/with.aspx"><strong>Business Proposal</strong></a>
		</p>
	</header>
	<!--  내용  ***************** -->
	<img src="/en/common/images/sub/cust_inq_title02.png" class="mB30" alt="대한뉴팜과 함께 비지니스 제휴를 원하시는 업체에서는 세부적인 제휴제안 내용을 등록해주시면 제안접수 후 검토하여 연락을 드리겠습니다.">
	<table class="table_list_01 mB10" border="1" >
		<caption class="hidden">제휴제안  쓰기</caption>
		<colgroup>
			<col style="width:15%">
			<col>
		</colgroup>		
		<tr>
			<th><label for="<%=ttl.ClientID %>">Title</label></th>
			<td class="td_input">
				<input type="text" id="ttl" runat="server" class="input100" />
			</td>
		</tr>
		<tr>
			<th><label for="<%=busin_nm.ClientID %>">Name of Company</label></th>
			<td class="td_input" >
				<input type="text" id="busin_nm" runat="server" class="input100" />
			</td>
		</tr>
		<tr>
			<th><label for="<%=writer_nm.ClientID %>">Name</label></th>
			<td class="td_input" >
				<input type="text" id="writer_nm" runat="server" class="input100" />
			</td>
		</tr>
		<tr>
			<th><label for="<%=posit.ClientID %>">Title</label></th>
			<td class="td_input" >
				<input type="text" id="posit" runat="server" class="input100" />
			</td>
		</tr>
		<tr>
			<th><label for="<%=tel.ClientID %>">Contact Numbers</label></th>
			<td class="td_input" >
				<input type="text" id="tel" runat="server" class="input100" />
			</td>
		</tr>
		<tr>
			<th><label for="<%=email.ClientID %>">Email Address</label></th>
			<td class="td_input" >
				<input type="text" id="email" runat="server" class="input100" />
			</td>
		</tr>
		<tr>
			<th><label for="<%=cont.ClientID %>">Comments</label></th>
			<td class="td_input" >
				<textarea  id="cont" runat="server" rows="10" class="textarea100"></textarea>
			</td>
		</tr>
	</table>
	<div class="right">
        <asp:LinkButton ID="btnSave" runat="server" onclick="btnSave_Click" OnClientClick="return CheckValid();"><span class="button next">Send</span></asp:LinkButton>
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

        textfd.chk('<%= ttl.ClientID %>', "제목을 입력하세요!");
        textfd.chk('<%= busin_nm.ClientID %>', "업체명을 입력하세요!");
        textfd.chk('<%= writer_nm.ClientID %>', "이름을 입력하세요!");
        textfd.chk('<%= posit.ClientID %>', "직위를 입력하세요!");
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