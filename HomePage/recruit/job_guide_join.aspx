<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="job_guide_join.aspx.cs" Inherits="HomePage.recruit.job_guide_join" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

    <section id="content" class="sub_content" >
	    <header>
		    <h1 class="pageTitle line"> 입사지원  </h1>
		    <p class="location">
			    <a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
                <a href="/recruit/new_person.aspx"><span>채용</span></a><em> > </em>
			    <a href="/recruit/job_guide_list.aspx"><span>입사지원</span></a><em> > </em>
			    <a href="/recruit/job_guide_list.aspx"><strong>입사지원</strong></a>
		    </p>
	    </header>
	    <!--  내용  ***************** -->
	    <section class="join_info">
		    <header class="title">
			    <h1> 개인정보의 수집 및 이용목적 </h1>
			    <p> 본인은 아래의 내용을 확인하고, ㈜대한뉴팜이 다음과 같이 본인의 개인(신용)정보를 처리(수집,이용,제공 등)하는 것에 동의합니다 </p>
		    </header>
		    <article class="info_scroll">
			    <div class="info_scroll_in">
				    <h1> 수집이용목적  </h1>
				    <p> - 입사지원 및 선발전형(본인확인, 업무적임자의 판단, 전형결과 통보 등) </p>
				    <h1> 수집 항목  </h1>
				    <p> - 필수항목 : 성명(국/영문), 주민등록번호(외국인등록번호), 비밀번호, 현주소, 이메일, 전화번호(자택, 휴대전화), 학력사항, 병
						    역사항, 보훈, 장애인구분, 자기소개서, 취미, 결혼여부, 로그인ID, 접속로그, 쿠키, 서비스이용기록 등 
					    - 선택항목 : 경력사
						    항, 활동경험, 해외거주경험, 어학능력, 자격사항, 취미 등
				    </p>
				    <h1> 보유 및 이용기간  </h1>
				    <p> - 수집된 개인정보는 채용지원시 부터 3년동안 보유 및 이용하며, 관계법령의 규정에 따라 직원의 개인정보를 보존할 의무가 
					    있는 경우가 아닌 한, 입사지원자의 개인정보는 수집 및 이용목적을 달성할 때까지 보유 및 이용 합니다.
				    </p>
			    </div>
		    </article>
		    <fieldset class="join_radio">
			    <legend class="hidden"> 개인정보의 수집 및 이용목적 동의 선택 </legend>
			    <input type="radio" id="agreeY" name="agree" checked="checked" /> <span></span>
			    <label for="agreeY" class="mr"> 동의 </label>
			    <input type="radio" id="agreeN" name="agree" />  <span></span>
			    <label for="agreeN"> 동의하지 않음  </label>
			    <br />
                <asp:LinkButton ID="btnSave" runat="server" onclick="btnSave_Click" OnClientClick="return CheckValid();" class="button next ">다음단계</asp:LinkButton>
		    </fieldset>

	    </section>

	    <!-- // 내용 ***************** -->         
    </section>  <!--// sub_content -->

    <script language="javascript" type="text/javascript">

        function CheckValid() {

            if ($("#agreeY").is(':checked')) {
            } else {
                alert('동의를 선택해주세요');
                return false;
            }
        }
    </script>

</asp:Content>
