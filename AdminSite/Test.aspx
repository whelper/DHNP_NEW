<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="AdminSite.Test" %>
<%@ Import NameSpace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      
<script language="C#" runat="server">
	int recordCount= 0;
	void Page_Load( Object o, EventArgs e) {
		string c = "01,02,03";
		ArrayList arrCate = new ArrayList( c.Split(new char[] { ',' }));

		SqlConnection dbConnection;
		dbConnection=new SqlConnection("server=(local);uid=sa;pwd=lhj@3132;database=DHNP_DEV_NEW;" );
		dbConnection.Open();
		SqlCommand cmd;
		cmd = new SqlCommand( "select *  FROM TB_PROD_CATEGORY", dbConnection );
		SqlDataReader dr;
		dr=cmd.ExecuteReader();
		ArrayList a = new ArrayList();

		while ( dr.Read() ) {
			a.Add((string)dr["CATE_CD"]);
			//a[i] = (string)dr["CATE_CD"];
		}

		ArrayList insertSQL = new ArrayList();
		//insert
		foreach (string ca in arrCate) {
			if (!a.Contains(ca)) {
				insertSQL.Add(ca);
			}
		}

		ArrayList deleteSQL = new ArrayList();
		//delete
		foreach (string ca in a) {

			if (!arrCate.Contains(ca)) {
				deleteSQL.Add(ca);
			}
		}

		/*dr=cmd.ExecuteReader();
		if(dr.Read()) {
			recordCount=(int)dr["cnt"];
		}
		else {
			recordCount=0;
		}*/
		dr.Close();

		

		Response.Write("insert 카테고리");
		foreach (string ca in insertSQL)
		{
			Response.Write(ca.ToString()+"<br>");
		}


		Response.Write("delete 카테고리");
		foreach (char ca in deleteSQL)
		{
			Response.Write(ca.ToString());
		}

		dbConnection.Close();
		DataBind();
	}
</script>
		
    </form>
</body>
</html>
