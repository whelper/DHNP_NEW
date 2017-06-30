
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="AdminSite.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <link rel="icon" type="image/x-icon" rel="icon" href="./favicon.ico" />
    <title>Admin Page</title>
    <link rel="stylesheet" href="<%=GetRoot()%>/common/css/style.css" rel="stylesheet" type="text/css" />
    <script src="<%=GetRoot()%>/common/js/jquery-1.9.1.min.js" ></script> 
    <script src="<%=GetRoot()%>/common/js/jquery-ui.min.js" ></script> 
    <script src="<%=GetRoot()%>/common/js/common.js" ></script> 
    <script type="text/javascript">
        $(document).ready(function () {
            $("#admin_id").focus();
        });
</script>
</head>
<body  id="login-bg"> 
    <div class="top_blank"></div>
    <!-- Start: login-holder -->
    <div>
        <form runat = "server">
	        <div id="loginbox">
		        <div id="logo-login">
			        Administrator Page
		        </div>
	
		        <!--  start login-inner -->
		        <div id="login-inner">
			        <table border="0" cellpadding="0" cellspacing="0">
			            <tr>
				            <th>User ID</th>
				            <td><input type="text" id="admin_id" class="login-inp" runat="server"/></td>
			            </tr>
			            <tr>
				            <th>Password</th>
				            <td><input type="password" id="admin_pw" onfocus="this.value=''" class="login-inp" runat="server" /></td>
			            </tr>
			        </table>
			        <asp:Button id="btnLogin" CssClass="btn btn-inverse btn-login" runat="server" onclick="btnLogin_Click" Text="Login" />
		        </div>
                <!-- End: login-holder -->
	        </div>
        </form>
    </div>
</body>

</html>
