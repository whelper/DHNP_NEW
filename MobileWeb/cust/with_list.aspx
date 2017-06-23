<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="with_list.aspx.cs" Inherits="MobileWeb.cust.with_list" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	    <header class="header">
		    <script src="<%=GetRoot() %>/common/include/header.js"></script> 	
		    <h1 class="acc-hidden">고객</h1>	
		    <p class="location">
			    <span>고객</span><em>></em>
			    <strong>제휴제안</strong>
		    </p>
	    </header>

        <!-- 오픈시 보일 메뉴 -->
	    <nav class="gnb" >
		    <script src="<%=GetRoot() %>/common/include/gnb.js" ></script> 	
	    </nav>
	    <!-- // 오픈시 보일 메뉴  -->

	    <!--   width:100% -->
	    <section class="container">
		    <h1 class="acc-hidden">제휴제안</h1>	
		    <!--   content -->
		    <section class="content w600">
			    <p class="inquire_title"> 
				    <img src="<%=GetRoot() %>/common/images/with_title.png" alt="제휴를 원하시는 업체에서는 세부적인 제휴제안 내용을 등록해 주시면 제안접수 후 검토하여 연락을 드리겠습니다." />
			    </p>

			    <fieldset>
				    <legend>제휴제안 폼</legend>
				    <div class="inquire_input title">
					    <label for="ttl"><span>제목</span></label>
					    <input  type="text" id="ttl" runat="server" name="" placeholder="제목을 입력해 주세요." />  
				    </div>
				    <div class="inquire_input business">
					    <label for="busin_nm"><span>업체명</span></label>
					    <input  type="text" id="busin_nm" runat="server" name="" placeholder="업체명을 입력해 주세요." />  
				    </div>
				    <div class="inquire_input name">
					    <label for="writer_nm"><span>이름</span></label>
					    <input  type="text" id="writer_nm" runat="server" name="" placeholder="이름을 입력해 주세요." />  
				    </div>
				    <div class="inquire_input position">
					    <label for="posit"><span>직위 </span></label>
					    <input  type="text" id="posit" runat="server" name="" placeholder="직위을 입력해 주세요." />  
				    </div>
				    <div class="inquire_input tel">
					    <label for="tel"><span>연락처 </span></label>
					    <input  type="text" id="tel" runat="server" name="" placeholder="연락처를 입력해 주세요." />  
				    </div>
				    <div class="inquire_input email">
					    <label for="email"><span>이메일 </span></label>
					    <input  type="text" id="email" runat="server" name="" placeholder="이메일를 입력해 주세요." />  
				    </div>
				    <div class="inquire_textarea">
					    <label for="cont" class="acc-hidden"></label>
					    <textarea id="cont" runat="server"></textarea>
				    </div>
				    <p class="btn_center mB40 ">				
                        <asp:LinkButton ID="btnSave" runat="server" onclick="btnSave_Click" OnClientClick="return CheckValid();"><span class="button next">저장하기</span></asp:LinkButton>
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

    <!-- popup : 문의완료 되었습니다.  **-->
<%--    <div id="pop_wrap_01" class="pop_wrap" style="display:none;">
	    <div class="pop_wrap_alpha"></div>
	    <section class="popupContent" >
		    <div class="lineBox">
			    <h1 class="title">저장완료 되었습니다.</h1>
		    </div>
		    <div class="btn_area">
			    <button type="button" onclick="popupClose(1); return false;" class="button ok">확인</button>
		    </div>
	    </section> 		                                 										
    </div>--%>
    <!--// popup : 문의완료 되었습니다.  **-->	

</asp:Content>