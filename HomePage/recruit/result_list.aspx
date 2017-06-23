<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="result_list.aspx.cs" Inherits="HomePage.recruit.result_list" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content" >
			<header>
				<h1 class="pageTitle line"> 전형결과확인  </h1>
				<p class="location">
					<a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
                    <a href="/recruit/new_person.aspx"><span>채용</span></a><em> > </em>
			        <a href="/recruit/job_notify_list.aspx"><span>상시채용</span></a><em> > </em>
			        <a href="/recruit/result_list.aspx"><strong>전형결과확인</strong></a>
				</p>
			</header>
			<!--  내용  ***************** -->
			<p> 채용 전형결과를 확인할 수 있습니다. </p>
			<table class="table_list_01" border="1">
				<caption class="hidden"> 전형결과확인   </caption>
				<colgroup>
					<col style="width:9%">
					<col>
					<col style="width:13%">
					<col style="width:13%">
					<col style="width:11%">
					<col style="width:11%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col"> 순번</th>
						<th scope="col">제목</th>
						<th scope="col">발표(예정일) </th>
                        <th scope="col">수정</th>
						<th scope="col">진행상태</th>
						<th scope="col">결과확인</th>
					</tr>
				</thead>
				<tbody>
                <%
                    if (GetRowCount() > 0)
                    {
                        for (int i = 0; i < GetRowCount(); i++)
                        {
                %>
					<tr>
						<td><%=GetBoardNum(i, Convert.ToInt32(nowPageNo.Value), 10)%></td>
						<td class="left">
							 <span class="wCut w300"><%=GetData(i, "RCM_TTL")%></span> 
						</td>
						<td><%=GetData(i, "SCH_DATE")%></td>
						<td><%=GetData(i, "STATUS_NM")%></td>
                        <% 
                            if (GetData(i, "STATUS_CD").Equals("CLOSE"))
                            {
                        %>
                        <td><button class="button job_off" onclick="javascript:alert('수정할 수 있는 기간이 지났습니다.'); return false;">수정</button> </td>
						<td><button class="button job_on" onclick="selected_recurit('<%=GetData(i, "REG_SEQ_NO") %>', '<%=GetData(i, "RCM_DUTY_NO") %>'); return false;" > 확인  </button> </td>
                        <% 
                            }
                            else
                            {
                        %>
                        <td><button class="button job_on" onclick="modify_recurit('<%=GetData(i, "REG_SEQ_NO")%>','<%=GetData(i, "RCM_DUTY_NO") %>'); return false;" >수정</button> </td>
                        <td><button class="button job_off" onclick="javascript:alert('서류심사 중입니다.'); return false;"> 확인  </button> </td>
                        <% 
                            }
                        %>
					</tr>
                <% 
                        }
                    }
                    else
                    {
                %>
			    <!-- 내용이 없을 경우  -->
			    <tr >
				    <td colspan="5" class="no_data"> 
						<p> 리스트  내용이 없을 경우 </p> 
					</td>
			    </tr>
                <% 
                    }
                %>
				</tbody>
			</table>
			<!-- // 내용 ***************** -->         

             <asp:HiddenField ID="nowPageNo" runat="server"  Value="1" onvaluechanged="nowPageNo_ValueChanged"/>			
            <%= HomePage.page.paging.getPageNo(DataTotalCount, Convert.ToInt32(nowPageNo.Value), 10)%>
            <input type="hidden" id="reg_seq_no" name="reg_seq_no" />
            <input type="hidden" id="rcm_duty_no" name="rcm_duty_no" />

		</section>  <!--// sub_content -->

<!-- popup 01 : 이름핸드번 이메일 -->
<div class="pop_wrap" id="pop_wrap_01"  style="display:none;">
	<div class="pop_wrap_alpha"></div>
	<section class="popupContent" >
		<div class="lineBox_input">
			<fieldset class="myinfo">
				<legend class="txt"> 채용결과 확인을 위해 아래내용을 입력해 주세요</legend>
				<div class="row">
					<label for="name">이름 </label>
					<input type="text" class="input-focused" id="name" >
				</div>
				<div class="row">
					<label for="cellphone">핸드폰번호 </label>
					<input type="text" class="input-focused" id="cellphone">
				</div>
				<div class="row">
					<label for="email">이메일주소</label>
					<input type="text" class="value_03" id="email">
				</div>
			</fieldset>
		</div>
		<p class="btn_center">
			<button type="button" onclick="javascript:popupClose();" class="button gray"> 닫기 </button>
			<button type="button" onclick="javascript:search_result();" class="button green"> 확인</button>
		</p>
	</section>
</div>
<!--// popup 01: 이름핸드번 이메일 -->	
<!-- popup  02: 불합격. -->
<div class="pop_wrap" id="pop_wrap_02" style="display:none;"  >
	<div class="pop_wrap_alpha"></div>
	<section class="popupContent" >
		<div class="lineBox_01">
			<h1 class="txt_blue"> 대한뉴팜에에서 알려드립니다. </h1>
			<p class="txt_01">지원해 주셔서 감사드립니다. <br>
			앞으로도 계속 대한뉴팜에 대한 관심과 애정 부탁드리겠습니다.</p>

			<p class="txt_02">안녕하세요. 대한뉴팜 채용 담당자 입니다<br>
				먼저, 당사의 채용에 관심을 갖고 지원해 주셔서 감사드립니다.<br>
				아쉬운 말씀은, 귀하께서 보유하고 계신 뛰어난 역량에도 불구하고,<br>
				당사의 한정된 금번 채용 계획상 부득이 최종 합격의 대상이 되지 못하셨습니다.<br>
			</p>
			<p class="txt_02">	귀하께서 그 동안 당사의 인재채용에 기울여 주신 관심과 노고에 대하여 깊은 감사의<br>
				말슴을 드립니다. 앞으로 귀하에게  건승과 행운이 함께 하시길 기원하겠습니다.<br>
			</p>
			<p class="txt_from">
				대한뉴팜(주) 채용담당자 드림
			</p>
		</div>
		<p class="btn_center">
			<button type="button" onclick="popupClose();" class="button gray"> 닫기 </button>
			<button type="button" onclick="popupClick(1);" class="button green"> 다시 조회하기 </button>
		</p>
	</section> 		                                 
</div>
<!--// popup 02: 불합격. -->
<!-- popup  03: 합격. -->
<div class="pop_wrap" id="pop_wrap_03" style="display:none;"  >
	<div class="pop_wrap_alpha"></div>
	<section class="popupContent" >
		<div class="lineBox_01">
			<h1 class="txt_blue"> 대한뉴팜에에서 알려드립니다. </h1>
			<p class="txt_01">지원해 주셔서 감사드립니다. <br>
			앞으로도 계속 대한뉴팜에 대한 관심과 애정 부탁드리겠습니다.</p>

			<p class="txt_02">안녕하세요. 대한뉴팜 채용 담당자 입니다<br>
				먼저, 당사의 채용에 관심을 갖고 지원해 주셔서 감사드립니다.<br>
				당사의 채용에 최종합격하셨습니다.<br>
			</p>
			<p class="txt_02">	대한뉴팜에서 세상에서 가장 아름다운 날개를 달아드리겠습니다.<br>
				귀하의 꿈과 열정을 펼쳐 주십시오.				
			</p>
			<p class="txt_from">
				대한뉴팜(주) 채용담당자 드림
			</p>
		</div>
		<p class="btn_center">
			<button type="button" onclick="popupClose();" class="button gray"> 닫기 </button>
			<button type="button" onclick="popupClick(1);" class="button green"> 다시 조회하기 </button>
		</p>
	</section> 		                                 
</div>
<!--// popup 03: 합격. -->
<!-- popup  04: 오입력 -->
<div class="pop_wrap" id="pop_wrap_04" style="display:none;" >
	<div class="pop_wrap_alpha"></div>
	<section class="popupContent" >
		<div class="lineBox_01">
			<h1 class="txt"> 채용결과 확인을 위해 아래내용을 입력해 주세요</h1>
			<div class="txt_one">
				<p>입력사항을 다시 한번 확인 후 입력해 주시기 바랍니다. </p>
			</div>
		</div>
		<p class="btn_center">
			<button type="button" onclick="popupClose();" class="button gray"> 닫기 </button>
			<button type="button" onclick="popupClick(1);" class="button green"> 다시 조회하기 </button>
		</p>
	</section> 		                                 
</div>
<!--// popup 04: 이름핸드번 이메일 -->

<!-- popup 05 : 이름핸드번 이메일 -->
<div class="pop_wrap" id="pop_wrap_05"  style="display:none;">
	<div class="pop_wrap_alpha"></div>
	<section class="popupContent" >
		<div class="lineBox_input">
			<fieldset class="myinfo">
				<legend class="txt">이력서 수정을 위해 아래내용을 입력해 주세요</legend>
				<div class="row">
					<label for="name">이름 </label>
					<input type="text" class="input-focused" id="mo_name" >
				</div>
				<div class="row">
					<label for="cellphone">핸드폰번호 </label>
					<input type="text" class="input-focused" id="mo_cellphone">
				</div>
				<div class="row">
					<label for="email">이메일주소</label>
					<input type="text" class="value_03" id="mo_email">
				</div>
			</fieldset>
		</div>
		<p class="btn_center">
			<button type="button" onclick="javascript:popupClose();" class="button gray"> 닫기 </button>
			<button type="button" onclick="javascript:search_my_info();" class="button green"> 확인</button>
		</p>
	</section>
</div>
<!--// popup 01: 이름핸드번 이메일 -->

<!--//  CONTENT -->
<script type="text/javascript" >
    function movePage(page_no) {
        document.getElementById('<%= nowPageNo.ClientID %>').value = page_no;
        document.forms[0].submit();
    }

    var selected_recurit = function(reg_seq_no, rcm_duty_no) {
        $("#reg_seq_no").val(reg_seq_no);
        $("#rcm_duty_no").val(rcm_duty_no);
        popupClick(1);
    }

    var modify_recurit = function (reg_seq_no, rcm_duty_no) {
        $("#reg_seq_no").val(reg_seq_no);
        $("#rcm_duty_no").val(rcm_duty_no);
        popupClick(5);
    }

    var search_result = function () {
        var reg_seq_no = $("#reg_seq_no").val();
        var name = $("#name").val();
        var cellphone = $("#cellphone").val();
        var email = $("#email").val();

        if (reg_seq_no == "") {
            alert("채용 정보를 선택하지 않았습니다.");
        } else if (name == "") {
            alert("이름을 입력해 주세요.");
            $("#name").focus();
        } else if (cellphone == "") {
            alert("휴대폰번호를 입력해 주세요.");
            $("#cellphone").focus();
        } else if (email == "") {
            alert("이메일 주소를 입력해 주세요.");
            $("#email").focus();
        } else {
            $.ajax({
                type: "POST"
                , cache: false
                , url: "/ws/recruit.asmx/GetRecruitResult"
                , data: {
                    "reg_seq_no": reg_seq_no
                    , "name": encodeURI(name)
                    , "cellphone": encodeURI(cellphone)
                    , "email": encodeURI(email)
                }
                , async: false
                , dataType: "text" // Debugging을 위해 일단 TEXT로 받는다.
                , success: function (xml, status) {
                    if (xml == null) {
                        alert("데이터를 가져오지 못했습니다.");
                    } else {
                        var xmlDoc = $.parseXML(xml);

                        var html = "";

                        if ($(xmlDoc).find("ResultCd").text() == "Y") {
                            popupClick(3);
                        } else if ($(xmlDoc).find("ResultCd").text() == "N") {
                            popupClick(2);
                        } else {
                            popupClick(4);
                        }
                    }
                }
	            , error: function (xhr, textStatus) {
	                alert("네트워크 오류 또는 요청을 처리할 수 없습니다.");
	            }
	            , complete: function (xhr, textStatus) {
	            }
            });
        }
	}

	var search_my_info = function () {
	    var reg_seq_no = $("#reg_seq_no").val();
	    var name = $("#mo_name").val();
	    var cellphone = $("#mo_cellphone").val();
	    var email = $("#mo_email").val();
	    var rcm_duty_no = $("#rcm_duty_no").val();

	    if (reg_seq_no == "") {
	        alert("채용 정보를 선택하지 않았습니다.");
	    } else if (name == "") {
	        alert("이름을 입력해 주세요.");
	        $("#mo_name").focus();
	    } else if (cellphone == "") {
	        alert("휴대폰번호를 입력해 주세요.");
	        $("#mo_cellphone").focus();
	    } else if (email == "") {
	        alert("이메일 주소를 입력해 주세요.");
	        $("#mo_email").focus();
	    } else {
	        $.ajax({
	            type: "POST"
                , cache: false
                , url: "/ws/recruit.asmx/GetRecruitMyInfo"
                , data: {
                    "reg_seq_no": reg_seq_no
                    , "name": name
                    , "cellphone": cellphone
                    , "email": email
                }
                , async: false
                , dataType: "text" // Debugging을 위해 일단 TEXT로 받는다.
                , success: function (xml, status) {
                    if (xml == null) {
                        alert("데이터를 가져오지 못했습니다.");
                    } else {
                        var xmlDoc = $.parseXML(xml);

                        var html = "";

                        if ($(xmlDoc).find("ResultCd").text() == "" || $(xmlDoc).find("ResultCd").text() == "C") {
                            alert($(xmlDoc).find("ResultMsg").text());
                        } else {
                            location.href = "job_guide_join_sub_edit.aspx?reg_seq_no=" + reg_seq_no + "&support_no=" + $(xmlDoc).find("ResultCd").text() + "&rcm_duty_no=" + rcm_duty_no;
                        }
                    }
                }
	            , error: function (xhr, textStatus) {
	                alert("네트워크 오류 또는 요청을 처리할 수 없습니다.");
	            }
	            , complete: function (xhr, textStatus) {
	            }
	        });
	    }
	}
</script>

</asp:Content>