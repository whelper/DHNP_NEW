<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master"  AutoEventWireup="true" CodeBehind="event_detail.aspx.cs" Inherits="AdminSite.evt.event_detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
  
	<div id="page-heading">
		<h1> 이벤트 정보 </h1>
	</div>

	<div class="wrap_box">
            <table cellpadding="0" cellspacing="0" border="0" class="table_frm mb30">
				<colgroup>
					<col width="10%">
					<col>
					<col width="10%">
					<col width="30%">
				</colgroup>
					<tbody>
						<tr>
							<th scope="row"> 
								작성자
							</th>
							<td class="alignleft">
							 	<input type="text" id="WRITER_ID" class="span6 text" runat="server"> 
							</td>
							<th scope="row">
								등록일
							</th>
							<td class="aligncenter">
								<%=GetData(0, "REG_DT")%>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="pdt_name03">   제목   </label>
							</th>
							<td class="alignleft" colspan="3">
								<input type="text" id="EVT_TTL"  class="span6 text" runat="server">
							</td>
						</tr>
						<tr>
							<th scope="row"> 
								<label for="pdt_name03">   이벤트 기간   </label>
							</th>
							<td class="alignleft" colspan="3">
								<input type="text" name="START_DATE" title="특정 기간 시작 날짜" class="date_in" id="datepicker" value='<%=START_DATE%>'  />
								~
								<input type="text" name="END_DATE" title="특정 기간 종료 날짜" class="date_in" id="datepicker2" value='<%=END_DATE%>' />
							</td>
						</tr>
						<tr>
							<th>
								<label for="realupload_01"> 이미지 첨부 </label>
							</th>
							<td class="alignleft" colspan="3">
                                <div class ="c_red"> 가로 600px(최대 920px)</div>
								<div class="upload">
									<div class="fakeupload">
										<input type="text" id="IMG_TITLE_VALUE" runat="server"> <!-- browse button is here as background -->
									</div>
                                      <asp:FileUpload ID="IMG_TITLE_TEXT" runat="server" CssClass="realupload" />
								</div>
                              
								<span class="side_span">* 현재 파일 : 
                                     <% 
                                        if (GetData(0,"IMG_TITLE").Equals("") == false)
                                        {
                                     %>
								     <a href="javascript:open_popup('<%=GetData(0, "IMG_TITLE") %>');"><%=GetData(0, "IMG_TITLE")%></a>
                                     <% 
                                        }
                                     %>
                                </span>
                                
							</td>
						</tr>

					<tr>
						<th scope="row" class="th_top"> 
							<label for="pdt_name04">  상단 텍스트 </label>
						</th>
						<td colspan="3">
                            <textarea id="CONT_T" class="textarea_detail_adit" style="height: 200px" runat="server"></textarea>
						</td>
					</tr>
						<tr>
							<th scope="row" class="th_top">
								<label for="pdt_name05">  하단 안내 텍스트   </label>
							</th>
							<td colspan="3">
                                <textarea id="CONT_B" class="textarea_detail_adit" style="height: 150px" runat="server"></textarea>
							</td>
						</tr>

					<tr>
						<th>노출여부</th>
						<td class="alignleft" colspan="3">
							<label for="pdt_name01" class="mR10">
								<input type="radio" id="IS_SHOW_Y" name="IS_SHOW" class="inline" value="Y" runat="server"> 예
							</label>
							<label for="pdt_name02" class="mR10">
								<input type="radio" id="IS_SHOW_N" name="IS_SHOW" class="inline" value="N" runat="server"> 아니오
							</label>
						</td>
					</tr>
					<tr>
						<th>이벤트 페이지 URL</th>
						<td class="alignleft" colspan="3">
                            <% if (GetData(0, "SEQ_NO") != "") { %>
							<a href="<%=ConfigurationManager.AppSettings["HOMEPAGE_DOMAIN"] %>event/event_view.aspx?seq_no=<%=GetData(0, "SEQ_NO") %>" target="_blank"><%=ConfigurationManager.AppSettings["HOMEPAGE_DOMAIN"]%>event/event_view.aspx?seq_no=<%=GetData(0, "SEQ_NO")%></a>
                            <% } else { %>
                                입력 완료 후 수정 화면에서 확인할 수 있습니다
                            <% } %>
						</td>
					</tr>

				</tbody>
			</table>
			<h2 style="margin-top:20px">이벤트 항목</h2>
			<table cellpadding="0" cellspacing="0" border="0" class="table_frm ">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="40%">					
				</colgroup>
				<tbody>
					<tr>
						<th>
							<label for="addcategory_01"> 항목 </label>
						</th>
						<td class="alignleft">
                               <textarea id="ITEMS" class="textarea_detail_adit" style="height: 150px" runat="server"></textarea>
						</td>

						<td class="alignleft">
                               <pre>
예제) 3개 질문 생성 시 각 항목 입력 후 엔터로 구분합니다

이름
소속기업 또는 학교
결혼여부                                      
...
                               </pre>
						</td>
					</tr>
				</tbody>
			</table>
			
			<div class="btn_area clearfix">
				<div class="f_left"><a href="javascript:history.back();"><span class="btn">목록</span></a></div>
				<div class="f_right">
                    <asp:LinkButton ID="btnDel" runat="server" 
                        OnClientClick="return CheckValidDel();" onclick="btnDel_Click1"><span class="btn btn">삭제</span></asp:LinkButton>
					<asp:LinkButton ID="btnSave" runat="server" onclick="btnSave_Click" OnClientClick="return CheckValid();"><span class="btn btn-ok">저장</span></asp:LinkButton>
				</div>
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

    function CheckValidDel() {
        return confirm('삭제하시겠습니까?');
    }

    function CheckValid() {
        textfd.chk('<%= WRITER_ID.ClientID %>', "작성자를 입력하세요!");
        textfd.chk('<%= EVT_TTL.ClientID %>', "제목을 입력하세요!");
        //textfd.chk('<%= CONT_T.ClientID %>', "상단 텍스트를 입력해 주세요.");
        textfd.chk('<%= CONT_B.ClientID %>', "하단 안내 텍스트를 입력해 주세요.");
        
        
        if (textfd.result()) {
            return confirm('저장하시겠습니까?');
        } else {
            return false;
        }   
    }

</script>

</asp:Content>
