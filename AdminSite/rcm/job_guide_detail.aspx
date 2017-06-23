<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="job_guide_detail.aspx.cs" Inherits="AdminSite.rcm.job_guide_detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
  
	<div id="page-heading">
		<h1>채용등록</h1>
	</div>
	<div class="wrap_box">
        <table cellpadding="0" cellspacing="0" border="0" class="table_frm">
			<colgroup>
				<col width="10%" />
				<col />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"> 
						<label for="pdt_name01">채용 타이틀</label> 
					</th>
					<td class="alignleft" colspan="2">     
					 	<input type="text" runat="server" id="rcm_ttl" class="span6 text" />      
					</td>
				</tr>
				<tr>
					<th scope="row"> 
						<label for="pdt_name02">채용유형</label>     
					</th>
					<td class="alignleft" colspan="2">  
						<label for="name_01" class="input_check_box" >
							<input type="checkbox" runat="server" id="rcm_type_regular" name="rcm_type_regular" value="RCM_TYPE_REGULAR" />정규직
						</label>
						<label for="name_02" class="input_check_box" >
							<input type="checkbox" runat="server" id="rcm_type_contract" name="rcm_type_contract" value="RCM_TYPE_CONTRACT" />계약직
						</label> 
						<label for="name_03" class="input_check_box" >
							<input type="checkbox" runat="server" id="rcm_type_intern" name="rcm_type_intern" value="RCM_TYPE_INTERN" />인턴
						</label> 
						<label for="name_04" class="input_check_box" >
							<input type="checkbox" runat="server" id="rcm_type_etc" name="rcm_type_etc" value="RCM_TYPE_ETC" />기타
						</label>
					</td>
				</tr>
				<tr>
					<th scope="row"> 
						<label for="pdt_name03">채용직군</label>   
					</th>
					<td class="alignleft" colspan="2">     
						<label for="name_05" class="input_check_box" > 	
							<input type="checkbox" runat="server" id="rcm_jobgroup_admin" name="rcm_jobgroup" value="RCM_JOBGROUP_ADMIN" />관리직
						</label>
						<label for="name_06" class="input_check_box" > 	
							<input type="checkbox" runat="server" id="rcm_jobgroup_sales" name="rcm_jobgroup" value="RCM_JOBGROUP_SALES" />영업직   
						</label>   
						<label for="name_07" class="input_check_box" > 	
							<input type="checkbox" runat="server" id="rcm_jobgroup_prod" name="rcm_jobgroup" value="RCM_JOBGROUP_PROD" />생산기능직 
						</label> 
						<label for="name_08" class="input_check_box" > 	
							<input type="checkbox" runat="server" id="rcm_jobgroup_resch" name="rcm_jobgroup" value="RCM_JOBGROUP_RESCH" />연구직    
						</label>   
						<label for="name_09" class="input_check_box" > 	
							<input type="checkbox" runat="server" id="rcm_jobgroup_prof" name="rcm_jobgroup" value="RCM_JOBGROUP_PROF" />전문직 
						</label> 
						<label for="name_10" class="input_check_box" > 	
							<input type="checkbox" runat="server" id="rcm_jobgroup_tech" name="rcm_jobgroup" value="RCM_JOBGROUP_TECH" />기술직  
						</label>
					</td>
				</tr>
				<tr>
					<th scope="row"> 
						<label for="pdt_name03">채용경력</label>   
					</th>
					<td class="alignleft" colspan="2">     
						<label for="name_11" class="input_check_box" > 	
							<input type="checkbox" runat="server" id="rcm_career_new" name="rcm_career_new" value="RCM_CAREER_NEW" />신입  
						</label>
						<label for="name_12" class="input_check_box" > 	
							<input type="checkbox" runat="server" id="rcm_career_career" name="rcm_career_career" value="RCM_CAREER_CAREER" />경력  
						</label>    
					</td>
				</tr>
                <tr>
					<th scope="row">  채용직무   </th>
					<td class="alignleft" colspan="2">  
						<ul class="job_check_ul">
                            <li>
                                <label for="name_32">* 직무는 하나만 선택할 수 있습니다.</label>  
                            </li>
                            <% 
                                if (DutyDs != null && DutyDs.Tables.Count > 0 && DutyDs.Tables[0].Rows.Count > 0)
                                {
                                    bool new_duty = true;
                                    string prev_duty_no = "";
                                    
                                    for (int i = 0; i < DutyDs.Tables[0].Rows.Count; i++)
                                    {   
                                        if (new_duty)
                                        {   
                            %>
                            <li> 
								<strong><%=DutyDs.Tables[0].Rows[i]["UPR_DUTY_NM"]%></strong>
                                <input type="radio" id="duty_no_<%=DutyDs.Tables[0].Rows[i]["DUTY_NO"]%>" name="duty_no" value="<%=DutyDs.Tables[0].Rows[i]["DUTY_NO"]%>" 
                                    <%if (GetDataTableCount(0) > 0 && GetData(0, 0, "RCM_DUTY_NO").Equals(DutyDs.Tables[0].Rows[i]["DUTY_NO"].ToString())) { %>checked="checked"<%} %> />
                                <label for="name_32"><%=DutyDs.Tables[0].Rows[i]["DUTY_NM"]%></label>  
                            <%
                                        }
                                        else
                                        {
                            %>
                                <input type="radio" id="duty_no_<%=DutyDs.Tables[0].Rows[i]["DUTY_NO"]%>" name="duty_no" value="<%=DutyDs.Tables[0].Rows[i]["DUTY_NO"]%>" 
                                    <%if (GetDataTableCount(0) > 0 && GetData(0, 0, "RCM_DUTY_NO").Equals(DutyDs.Tables[0].Rows[i]["DUTY_NO"].ToString())) { %>checked="checked"<%} %> />
                                <label for="name_32"><%=DutyDs.Tables[0].Rows[i]["DUTY_NM"]%></label>  
                            <% 
                                        }

                                        if ((i + 1) == DutyDs.Tables[0].Rows.Count
                                            || DutyDs.Tables[0].Rows[i]["UPR_DUTY_NO"].Equals(DutyDs.Tables[0].Rows[i + 1]["UPR_DUTY_NO"]) == false)
                                        {
                                            new_duty = true;
                            %>
                            </li>
                            <%
                                        }
                                        else
                                        {
                                            new_duty = false;
                                        }
                                    }
                                }
                            %>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row"> 
						<label for="datepicker">시작일</label> 
					</th>
					<td class="alignleft" colspan="2">     
					 	<input type="text" name="datepicker" id="datepicker" title="특정 기간 시작 날짜" class="date_in" value='<%=StartDate%>' /> 
					</td>
				</tr>
				<tr>
					<th scope="row"> 
						<label for="datepicker2">종료일</label> 
					</th>
					<td class="alignleft" colspan="2">     
					 	<input type="text" name="datepicker2" id="datepicker2" title="특정 기간 종료 날짜" class="date_in" value='<%=EndDate%>' />     
					</td>
				</tr>
				<tr>
					<th scope="row"> 
						<label for="name_18">채용코드입력</label> 
					</th>
					<td class="alignleft" colspan="2">     
					 	<input type="text" runat="server" id="rcm_cd_reg" name="rcm_cd_reg" class="span6 text" />      
					</td>
				</tr>
			</tbody>
		</table>

		<div class="btn_area clearfix">
			<div class="f_left"><a href="javascript:history.back();"><span class="btn">목록</span></a></div>
            <% 
                if (GetDataTableCount(4) > 0 && GetData(4, 0, "AUTH_SUB_YN").Equals("N"))
                {
            %>
			<div class="f_right">
                <asp:LinkButton ID="btnDel" runat="server" onclick="btnDel_Click" OnClientClick="return validConfirm();"><span class="btn">삭제</span></asp:LinkButton>
				<asp:LinkButton ID="btnSave" runat="server" onclick="btnSave_Click" OnClientClick="return CheckValid();"><span class="btn btn-ok">저장</span></asp:LinkButton>
			</div>
            <% 
                }
            %>
		</div>

	</div>
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

    function CheckValid() {
        if ($(':radio[name="duty_no"]:checked').length < 1) {
            alert("채용직무를 선택해 주세요.");
            return false;
        } else {
            textfd.chk('<%= rcm_ttl.ClientID %>', "채용 타이틀을 입력해주세요.");

            if (textfd.result()) {
                return confirm('저장하시겠습니까?');
            } else {
                return false;
            }
        }

        //return textfd.result(); //모든 필드가 만족되면 true를 리턴한다.
    }

    function validConfirm() {
        if (confirm("삭제하시겠습니까?")) {
            return true;
        }

        return false;
    }
</script>
</asp:Content>