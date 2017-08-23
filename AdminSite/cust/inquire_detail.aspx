<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="inquire_detail.aspx.cs" Inherits="AdminSite.cust.inquire_detail" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
  
	<div id="page-heading">
		<h1> 제품문의  </h1>
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
						<label for="pdt_name01"> 구 분  </label> 
					</th>
					<td class="alignleft" colspan="2">     
					 	<asp:DropDownList ID="gubun" runat="server">
						</asp:DropDownList>
					</td>
				</tr>
				<tr>
					<th scope="row"> 
						<label for="pdt_name01"> 작성자  </label> 
					</th>
					<td class="alignleft" colspan="2">     
					 	<input type="text" id="writerNm" readonly="readonly" class="span6 text mR10"  value = "<%=GetData(0, "WRITER_NM") %>" />      
					</td>
				</tr>
				<tr>
					<th scope="row"> 
						<label for="pdt_name02"> 작성일  </label>     
					</th>
					<td class="alignleft" colspan="2">     
					 	<input type="text" id="regDt" readonly="readonly" class="span6 text" value = "<%=GetData(0, "REG_DT") %>"/>      
					</td>
				</tr>
				<tr>
					<th scope="row"> 
						<label for="pdt_name03">   연락처   </label>   
					</th>
					<td class="alignleft" colspan="2">     
					 	<input type="text" id="txtPhone" readonly="readonly" class="span6 text" value = "<%=GetData(0, "TEL") %>"/>      
					</td>
				</tr>
				<tr>
					<th scope="row"> 
						<label for="pdt_name04">   이메일   </label>   
					</th>
					<td class="alignleft" colspan="2">     
					 	<input type="text" id="txtEmail" readonly="readonly" class="span6 text" value = "<%=GetData(0, "EMAIL") %>"/>      
					</td>
				</tr>
				<tr>
					<th scope="row"> 
						<label for="pdt_name05">   제목   </label>   
					</th>
					<td class="alignleft" colspan="2">     
					 	<input type="text" id="txtTitle" readonly="readonly" class="span6 text" value = "<%=GetData(0, "TTL") %>" />      
					</td>
				</tr>
				<tr>
					<th scope="row" class="th_top"> 
						<label for="pdt_name04">  내용   </label> 
					</th>
					<td>
                     <textarea id="pdt_name04"  readonly="readonly" class="textarea_detail_adit"><%=GetData(0, "CONT")%></textarea>
					</td>
				</tr>
			</tbody>
		</table>

		<div class="btn_area clearfix">
			<div class="f_left"><a href="javascript:history.back();"><span class="btn">목록</span></a></div>
			<div class="f_right">
				<asp:LinkButton ID="btnDel" runat="server" onclick="btnDel_Click" OnClientClick="return validConfirm();"><span class="btn">삭제</span></asp:LinkButton>
			</div>
		</div>		


	</div><!--//  wrap_box -->	
</div>
</div>
<!--//  CONTENT -->
<script language="javascript" type="text/javascript">

    function validConfirm() {
        if (confirm("삭제하시겠습니까?")) {
            return true;
        }
        
        return false;
    }
</script>
</asp:Content>
