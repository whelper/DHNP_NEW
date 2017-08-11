<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="inquire_list.aspx.cs" Inherits="MobileWeb.cust.inquire_list" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    
	    <header class="header">
		    <script src="<%=GetRoot() %>/common/include/header.js" ></script> 	
		    <h1 class="acc-hidden">고객</h1>	
		    <p class="location">
			    <span>고객</span><em>></em>
			    <strong>제품문의</strong>
		    </p>
	    </header>

        <!-- 오픈시 보일 메뉴 -->
	    <nav class="gnb" >
		    <script src="<%=GetRoot() %>/common/include/gnb.js" ></script> 	
	    </nav>
	    <!-- // 오픈시 보일 메뉴  -->

	    <!--   width:100% -->
	    <section class="container">
		    <h1 class="acc-hidden">제품문의</h1>	
		    <!--   content -->
		    <section class="content w600">
			    <p class="inquire_title"> 
				    <img src="<%=GetRoot() %>/common/images/inquire_title.png" alt="제품과 관련하여 문의사항이 있으시면 언제든지 연락주시기 바랍니다. 의견이 접수되면 빠른 시간안에 답변드리겠습니다." >
			    </p>

			    <fieldset>
				    <legend>제품문의 폼</legend>
					<div class="inquire_input title">
					    <label for="ttl"><span>구분</span></label>
					    <asp:DropDownList ID="gubun" runat="server" style="margin:1px 12%">
						</asp:DropDownList>
				    </div>
					<div class="inquire_input title">
					    <label for="ttl"><span>제목</span></label>
					    <input  type="text" id="ttl" runat="server" name="" placeholder="제목을 입력해 주세요." />  
				    </div>
				    <div class="inquire_input name">
					    <label for="writer_nm"><span>이름</span></label>
					    <input  type="text" id="writer_nm" runat="server" name="" placeholder="이름을 입력해 주세요." />  
				    </div>
				    <div class="inquire_input tel">
					    <label for="tel"><span>연락처</span></label>
					    <input  type="text" id="tel" runat="server" name="" placeholder="연락처을 입력해 주세요." />  
				    </div>
				    <div class="inquire_input email">
					    <label for="email"><span>이메일 </span></label>
					    <input  type="text" id="email" runat="server" name="" placeholder="이메일을 입력해 주세요." />  
				    </div>
				    <div class="inquire_textarea">
					    <label for="cont" class="acc-hidden"></label>
					    <textarea id="cont" runat="server"></textarea>
				    </div>
				    <p class="btn_center mB40 ">	
                        <asp:LinkButton ID="LinkButton1" runat="server" onclick="btnSave_Click" OnClientClick="return CheckValid();"><span class="button next">문의하기</span></asp:LinkButton>
				    </p>
			    </fieldset>
			
		    </section> 
		    <!--   // content -->
	    </section>
	     <!-- //  width:100% -->
	     <script src="<%=GetRoot() %>/common/include/footer.js" ></script>

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
		textfd.chk('<%= gubun.ClientID %>', "구분 선택하세요");
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

    <!-- popup : 문의완료 되었습니다.  **-->
<%--    <div id="pop_wrap_01" class="pop_wrap" style="display:none;">
	    <div class="pop_wrap_alpha"></div>
	    <section class="popupContent" >
		    <div class="lineBox">
			    <h1 class="title">문의완료 되었습니다.</h1>
		    </div>
		    <div class="btn_area">
			    <button type="button" onclick="popupClose(1); return false;" class="button ok">확인</button>
		    </div>
	    </section> 		                                 										
    </div>--%>
    <!--// popup : 문의완료 되었습니다.  **-->	

</asp:Content>