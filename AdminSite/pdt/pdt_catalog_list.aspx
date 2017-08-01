<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="pdt_catalog_list.aspx.cs" Inherits="AdminSite.pdt.pdt_catalog_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
	
	<div id="page-heading">
		<h1>대표카탈로그</h1>
	</div>

	<div class="wrap_box">
		<ul class="list_tab  clearfix target">
            <% 
                if (PageList != null)
                {
                    foreach (System.Collections.Generic.Dictionary<string, string> dic in PageList)
                    {
            %>
            <li><a href="<%=dic["pageurl"] %>"><%=dic["pagename"]%></a></li>
            <%
                    }
                }
            %>
			<li class="tab_on"><a href="pdt_catalog_list.aspx?category=<%=_category %>">대표카탈로그</a></li>
		</ul>

		<!-- 대표 카달로그 배너 등록     -->
		<h2 class="conspan3"> 대표 카달로그 등록  </h2> 
		<table cellpadding="0" cellspacing="0" border="0" class="table_new">
			<thead>
				<tr> 
					<th width="10%"> 위치  </th>
                    <th>구분</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=PageName%></td>
                    <td>국문</td>
					<td class="alignleft">
						<div  class="row_1" >
							<span class="side_span" > 파일경로 </span>
							<div class="upload">
								<label for="path_value_01" class="blind" > 파일경로 </label>
								<div class="fakeupload inline" >
                                    <input type="text" id="path_value_01" runat="server" /> <!-- browse button is here as background -->
								</div>
                                <asp:FileUpload ID="file_01" runat="server" CssClass="realupload" />
							</div>
                            <% 
                                if (GetDataMat("KOR", "CATAL_URL").Equals("") == false)
                                {
                            %>
                            <asp:HiddenField runat="server" ID="h_catal_path_01" />
                            <asp:LinkButton ID="btnDelCatal" runat="server" onclick="btnDelCatal_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
                            <span class="btn">파일삭제</span>
                            </asp:LinkButton>
                            <% 
                                }
                                else
                                {
                            %>
                            <span class="btn disabled">파일삭제</span>
                            <% 
                                }
                            %>
                            <span class="side_span">* 현재 파일 : 
                            <% 
                                if (GetDataMat("KOR", "CATAL_URL").Equals("") == false)
                                {
                            %>
                            <a href="<%=GetDataMat("KOR", "CATAL_URL") %>" title="<%=GetFileName(GetDataMat("KOR", "CATAL_URL"))%>"><%=GetFileName(GetDataMat("KOR", "CATAL_URL"), 60) %></a>
                            <% 
                                }
                            %>
						</div>
					</td>
				</tr>
                <tr>
					<td><%=PageName%></td>
                    <td>영문</td>
					<td class="alignleft">
						<div  class="row_1" >
							<span class="side_span" > 파일경로 </span>
							<div class="upload">
								<label for="path_value_02" class="blind" > 파일경로 </label>
								<div class="fakeupload inline" >
                                    <input type="text" id="path_value_02" runat="server" /> <!-- browse button is here as background -->
								</div>
                                <asp:FileUpload ID="file_02" runat="server" CssClass="realupload" />
							</div>
                            <% 
                                if (GetDataMat("ENG", "CATAL_URL").Equals("") == false)
                                {
                            %>
                            <asp:HiddenField runat="server" ID="h_catal_path_02" />
                            <asp:LinkButton ID="btnDelCatal2" runat="server" onclick="btnDelCatal2_Click" OnClientClick="return confirm('삭제하시겠습니까?');">
                            <span class="btn">파일삭제</span>
                            </asp:LinkButton>
                            <% 
                                }
                                else
                                {
                            %>
                            <span class="btn disabled">파일삭제</span>
                            <% 
                                }
                            %>
                            <span class="side_span">* 현재 파일 : 
                            <% 
                                if (GetDataMat("ENG", "CATAL_URL").Equals("") == false)
                                {
                            %>
                            <a href="<%=GetDataMat("ENG", "CATAL_URL") %>" title="<%=GetFileName(GetDataMat("ENG", "CATAL_URL"))%>"><%=GetFileName(GetDataMat("ENG", "CATAL_URL"), 60)%></a>
                            <% 
                                }
                            %>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="btn_area clearfix">
			<div class="f_right">
                <asp:LinkButton ID="btnVisualSave" runat="server" onClick="btnSave_Click" OnClientClick="return CheckValid();"><span class="btn btn-ok">등록</span></asp:LinkButton>
			</div>
		</div>	
		<!-- // 대표 카달로그 배너 등록   -->

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

    function CheckValid() {
        //textfd.chk('<%= path_value_01.ClientID %>', "대표카탈로그를 입력해 주세요.");

        if (textfd.result()) {
            return confirm('저장하시겠습니까?');
        } else {
            return false;
        }
    }
</script>

</asp:Content>