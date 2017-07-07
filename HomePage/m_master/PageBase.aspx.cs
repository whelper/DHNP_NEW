using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using log4net;
using System.Data;
using CommonLib.DB;
using CommonLib.Utils;
using System.Text;
using System.Web.Security;

namespace HomePage.m_master
{
    public partial class PageBase : System.Web.UI.Page
    {
        #region 내부변수 리스트
        private static readonly ILog logger = LogManager.GetLogger(typeof(PageBase));

        private const int pagesize = 10; //pagesize를 10으로 한정
        private int nowPageNum = 0;
        private int dataTotalCount = 0;
        private DataRow[] dataRow = null; //datarow = datatable의 행을 나타낸다
        private DataSet mds = null;
        CWebSql webSql = null;

        private CDirUtil dirUtil = null;

        #endregion

        #region 총 페이지수 메소드

        /// <summary>
        /// 총 페이지 수 (SET 내부 카운트 변수 & 페이지수 리턴)
        /// </summary>
        /// <returns></returns>
        public int GetTotalPageCount()
        {
            int pageCount = dataTotalCount / pagesize;

            if (dataTotalCount % pagesize != 0)
            {
                pageCount = pageCount + 1;
            }

            return pageCount;
        }

        /// <summary>
        /// 현재 화면에서의 총 페이지 수
        /// </summary>
        /// <returns></returns>
        public int GetNowTotalPageCount()
        {
            int pageCount = dataTotalCount / pagesize % (pagesize * 10);

            if (dataTotalCount % pagesize != 0)
            {
                pageCount = pageCount + 1;
            }

            return pageCount;
        }

        #endregion

        #region QUERY 조회 및 실행 메소드

        /// <summary>
        /// 레코드 총 수(레코드셋 1개 = 0번째 테이블)
        /// </summary>
        /// <param name="procIndex"></param>
        /// <param name="param"></param>
        protected void SetDataCount(int procIndex, string param)
        {
            try
            {
                DataSet ds = WebSql.SelectSql(procIndex, CSecureUtil.CheckString(param));

                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    dataTotalCount = Convert.ToInt32(ds.Tables[0].Select()[0][0]);
                }
            }
            catch (Exception e)
            {
                CLog.debug(logger, "PageBase.SetDataCount(" + procIndex + "," + param + ") : " + e.Message);
            }
        }

        /// <summary>
        /// 데이터 셋팅(레코드셋 1개 = 0번째 테이블)
        /// </summary>
        /// <param name="procIndex">프로시저 Index</param>
        /// <param name="param">"|" 연결된 파라미터 조합</param>
        protected void SetDataList(int procIndex, string param)
        {
            try
            {
                DataSet mds = WebSql.SelectSql(procIndex, CSecureUtil.CheckString(param));
                dataRow = mds.Tables[0].Select();

                System.Diagnostics.Debug.WriteLine("dataRow=" + dataRow);

            }
            catch (Exception e)
            {
                CLog.debug(logger, "PageBase.SetDataList(" + procIndex + "," + param + ") : " + e.Message);
            }
        }

        /// <summary>
        /// 데이터 셋팅(레코드셋 여러개)
        /// 페이지 단에서 가져올 때 = GetData(int tableNum, int rowNum, string colName) 종류의 메소드 사용
        /// </summary>
        /// <param name="procIndex">프로시저 Index</param>
        /// <param name="param">"|" 연결된 파라미터 조합</param>
        protected void SetDataTableList(int procIndex, string param)
        {
            try
            {
                mds = WebSql.SelectSql(procIndex, CSecureUtil.CheckString(param));
            }
            catch (Exception e)
            {
                CLog.debug(logger, "PageBase.SetDataList(" + procIndex + "," + param + ") : " + e.Message);
            }
        }

        /// <summary>
        /// 프로시저 실행
        /// </summary>
        /// <param name="procIndex">프로시저번호</param>
        /// <param name="param">파라미터</param>
        protected void ExecuteQuery(int procIndex, string param)
        {
            WebSql.SelectSql(procIndex, param);
        }

        /// <summary>
        /// 프로시저 실행 후 결과를 리턴한다.
        /// </summary>
        /// <param name="procIndex">프로시저번호</param>
        /// <param name="param">파라미터</param>
        protected string[] ExecuteQueryResult(int procIndex, string param)
        {
            string[] result = null;

            DataSet ds = WebSql.SelectSql(procIndex, param);

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                result = new string[3];
                result[0] = ds.Tables[0].Rows[0]["RESULT_CD"].ToString();
                result[1] = ds.Tables[0].Rows[0]["RESULT_MSG"].ToString();

                if (ds.Tables[0].Columns.Contains("PROD_CD"))
                {
                    result[2] = ds.Tables[0].Rows[0]["PROD_CD"].ToString();
                }
            }

            return result;
        }

        /// <summary>
        /// 데이터 조회
        /// </summary>
        /// <param name="procIndex"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        protected DataSet GetDataSet(int procIndex, string param)
        {
            try
            {
                return WebSql.SelectSql(procIndex, CSecureUtil.CheckString(param));
            }
            catch (Exception e)
            {
                CLog.debug(logger, "PageBase.GetDataSet(" + procIndex + "," + param + ") : " + e.Message);
            }

            return null;
        }


        protected DataSet GetDataSet(string proc_nm)
        {
            try
            {
                // 체크 잠시 중단
                //return WebSql.SelectSql(procIndex, CSecureUtil.CheckString(param));
                return WebSql.SelectSqlByName(proc_nm);
            }
            catch (Exception e)
            {
                CLog.debug(logger, "PageBase.GetDataSet(" + proc_nm + ") : " + e.Message);
            }

            return null;
        }


        public void SetDataCount(DataSet ds)
        {
            try
            {
                CheckLogin();

                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    dataTotalCount = Convert.ToInt32(ds.Tables[0].Select()[0][0]);
                }
            }
            catch (Exception e)
            {
                CLog.debug(logger, "PageBase.SetDataCount() : " + e.Message);
            }
        }

        public void SetDataRow(DataSet ds)
        {
            try
            {
                dataRow = ds.Tables[0].Select();
            }
            catch (Exception e)
            {
                CLog.debug(logger, "PageBase.SetDataRow(renamaster) : " + e.Message);
            }
        }


        #endregion

        #region Row수 카운트 메소드

        /// <summary>
        /// 한페이지 총 레코드 수
        /// </summary>
        /// <returns></returns>
        protected int GetRowCount()
        {
            int count = 0;

            if (dataRow != null)
            {
                count = dataRow.Length;
            }

            return count;
        }

        protected int GetRowCount(int tableNum)
        {
            int count = 0;

            if (mds != null && mds.Tables.Count >= tableNum && mds.Tables[tableNum].Rows.Count > 0)
            {
                count = mds.Tables[tableNum].Rows.Count;
            }

            return count;
        }

        #endregion

        #region 데이터 반환 메소드

        protected int GetDataCount()
        {
            int rows = 0;

            if (dataRow != null)
            {
                rows = dataRow.GetLength(0);
            }

            return rows;
        }

        protected int GetDataTableCount(int tableIndex)
        {
            int rows = 0;

            if (mds != null)
            {
                rows = mds.Tables[tableIndex].Rows.Count;
            }

            return rows;
        }


        /// <summary>
        /// 줄단위 정보 출력 by 줄번호, 컬럼 번호
        /// </summary>
        /// <param name="rowNum">줄 번호</param>
        /// <param name="colNum">컬럼번호(속성정보)</param>
        /// <returns>데이터</returns>
        protected string GetData(int rowNum, int colNum)
        {
            string data = "";

            try
            {
                data = dataRow[rowNum][colNum].ToString();
            }
            catch (Exception e)
            {
                CLog.debug(logger, "PageBase.GetData(" + rowNum + "," + colNum + ") : " + e.Message);
            }
            return data;
        }

        /// <summary>
        /// 글자수 제한(len)이 있는 줄단위 정보 출력 by 줄번호, 컬럼번호
        /// </summary>
        /// <param name="rowNum">줄번호</param>
        /// <param name="colName">컬럼번호</param>
        /// <param name="len">제한길이</param>
        /// <returns>데이터</returns>
        protected string GetData(int rowNum, int colNum, int len)
        {
            string data = GetData(rowNum, colNum);

            if (CStringUtil.IsNullOrEmpty(data) == false && Encoding.Default.GetByteCount(data) > len)
            {
                byte[] buf = Encoding.Default.GetBytes(data);
                data = Encoding.Default.GetString(buf, 0, len) + "...";
                buf = null;
            }

            return data;
        }

        /// <summary>
        /// 줄단위 정보 출력 by 줄번호, 컬럼명
        /// </summary>
        /// <param name="rowNum">줄 번호</param>
        /// <param name="colNum">컬럼명(속성정보)</param>
        /// <returns>데이터</returns>
        protected string GetData(int rowNum, string colName)
        {
            string data = "";

            try
            {
                data = dataRow[rowNum][colName].ToString();
            }
            catch (Exception e)
            {
                CLog.debug(logger, "PageBase.GetData(" + rowNum + "," + colName + ") : " + e.Message);
            }

            return data;
        }

        /// <summary>
        /// 글자수 제한(len)이 있는 줄단위 정보 출력 by 줄번호, 컬럼명
        /// </summary>
        /// <param name="rowNum">줄번호</param>
        /// <param name="colName">컬럼명</param>
        /// <param name="len">제한길이</param>
        /// <returns>데이터</returns>
        protected string GetData(int rowNum, string colName, int len)
        {
            string data = GetData(rowNum, colName);

            if (CStringUtil.IsNullOrEmpty(data) == false && Encoding.Default.GetByteCount(data) > len)
            {
                byte[] buf = Encoding.Default.GetBytes(data);
                data = Encoding.Default.GetString(buf, 0, len) + "...";
                buf = null;
            }

            return data;
        }

        /// <summary>
        /// 데이터 조회
        /// </summary>
        /// <param name="tableNum">테이블번호</param>
        /// <param name="rowNum">줄번호</param>
        /// <param name="colName">컬럼명</param>
        /// <returns></returns>
        protected string GetData(int tableNum, int rowNum, string colName)
        {
            string data = "";

            try
            {
                if (mds != null && mds.Tables.Count > 0 && mds.Tables[tableNum].Rows.Count > 0)
                {
                    data = mds.Tables[tableNum].Rows[rowNum][colName].ToString();
                }
            }
            catch (Exception e)
            {
                CLog.debug(logger, "PageBase.GetData(" + rowNum + "," + colName + ") : " + e.Message);
            }

            return data;
        }

        /// <summary>
        /// 데이터 조회
        /// </summary>
        /// <param name="tableNum">테이블번호</param>
        /// <param name="rowNum">줄번호</param>
        /// <param name="colName">컬럼명</param>
        /// <returns></returns>
        protected string GetData(int tableNum, int rowNum, string colName, int len)
        {
            string data = "";

            try
            {
                data = mds.Tables[tableNum].Rows[rowNum][colName].ToString();

                if (CStringUtil.IsNullOrEmpty(data) == false && Encoding.Default.GetByteCount(data) > len)
                {
                    byte[] buf = Encoding.Default.GetBytes(data);
                    data = Encoding.Default.GetString(buf, 0, len) + "...";
                    buf = null;
                }
            }
            catch (Exception e)
            {
                CLog.debug(logger, "PageBase.GetData(" + rowNum + "," + colName + ") : " + e.Message);
            }

            return data;
        }

        protected string GetDataComma(int rowNum, string colName)
        {
            string data = "";

            try
            {
                data = dataRow[rowNum][colName].ToString();

                if (CStringUtil.IsNumber(data))
                {
                    data = Convert.ToInt32(data).ToString("#,0");
                }
            }
            catch (Exception e)
            {
                CLog.debug(logger, "PageBase.GetData(" + rowNum + "," + colName + ") : " + e.Message);
            }

            return data;
        }

        /// <summary>
        /// 천단위 콤마 = 숫자형에만 사용
        /// </summary>
        /// <param name="rowNum"></param>
        /// <param name="colName"></param>
        /// <returns></returns>
        protected string GetDataComma(int tableNum, int rowNum, string colName)
        {
            string data = "";

            try
            {
                data = mds.Tables[tableNum].Rows[rowNum][colName].ToString();

                if (CStringUtil.IsNumber(data))
                {
                    data = Convert.ToInt32(data).ToString("#,0");
                }
            }
            catch (Exception e)
            {
                CLog.debug(logger, "PageBase.GetData(" + rowNum + "," + colName + ") : " + e.Message);
            }

            return data;
        }

        #endregion

        #region 테이블 존재 확인

        protected bool ExistsTable(int tableNum)
        {
            if (mds != null && mds.Tables.Count >= tableNum && mds.Tables[tableNum].Rows.Count > 0)
            {
                return true;
            }

            return false;
        }

        #endregion

        public string GetNewFileName(string filename)
        {
            string result = filename;

            try
            {
                string tempFilename = filename.Substring(0, filename.LastIndexOf(".")) + "_" + CDateUtil.GetFullNowDate();
                string ext = filename.Substring(filename.LastIndexOf("."), filename.Length - filename.LastIndexOf("."));
                result = tempFilename + ext;
            }
            catch
            {
            }

            return result;
        }

        protected string UploadFile(FileUpload upload, string dirKey)
        {
            string saveFileName = "";

            if (upload.HasFile)
            {

                string sourceDir = DirUtil.GetUploadDir(dirKey);

                string newFile = GetNewFileName(upload.FileName);
                saveFileName = sourceDir + newFile.Replace(" ", ""); // 공백은 제거

                // 물리파일 전체 경로
                string physicalPath = CConst.DIR_ROOT_IMAGE_PATH + saveFileName;

                // 디렉토리 존재 유무 검사 후 디렉토리 생성
                DirUtil.MakeDir(CConst.DIR_ROOT_IMAGE_PATH + sourceDir);

                // 파일 저장
                upload.SaveAs(physicalPath);

                string fileUrl = saveFileName;
                //string fileUrl = DirUtil.CopyRemoteServer(sourceDir, newFile);

                if (CStringUtil.IsNullOrEmpty(fileUrl))
                {
                    // 실패한 경우에 파일 명 공백
                    saveFileName = "";
                }
                else
                {
                    saveFileName = fileUrl;
                }
            }
            else
            {
                System.Diagnostics.Debug.WriteLine("upload.HasFile:" + upload.HasFile);
            }

            return saveFileName;
        }

        protected string GetFileName(string path)
        {
            return CStringUtil.GetOrgFileName(path);
        }

        protected string GetFileName(string path, int len)
        {
            string filename = CStringUtil.GetOrgFileName(path);

            if (CStringUtil.IsNullOrEmpty(filename) == false && Encoding.Default.GetByteCount(filename) > len)
            {
                byte[] buf = Encoding.Default.GetBytes(filename);
                filename = Encoding.Default.GetString(buf, 0, len) + "...";
                buf = null;
            }

            return filename;
        }

        protected int GetBoardNum(int seq_no, int nowpage, int page_size)
        {
            int result = seq_no;

            try
            {
                result = DataTotalCount - ((nowpage - 1) * page_size + seq_no);
            }
            catch
            {
            }

            return result;
        }

		protected string getCatalogURL(string CATG_NO, string LANG_CD = "KOR") {
			string catalog_url = "";

			StringBuilder param = new StringBuilder();
			param.Append(CATG_NO);
			param.Append(CConst.DB_PARAM_DELIMITER).Append(LANG_CD);
			DataSet ds = GetDataSet(3231, param.ToString());

			if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
			{
				catalog_url = ds.Tables[0].Rows[0]["CATAL_URL"].ToString();
			}

			return catalog_url;
		}

		



		#region Request 파라미터 => Dictionary, Dictionary => UrlPameter로 변환

		/// <summary>
		/// Request.Form으로 넘어온 모든 파라미터를 Dictionary로 만들어서 리턴
		/// </summary>
		/// <returns></returns>
		public Dictionary<string, string> GetParameters()
        {
            Dictionary<string, string> dic = null;

            if (Request != null && Request.Form != null && Request.Form.Count > 0)
            {
                dic = new Dictionary<string, string>();

                for (int i = 0; i < Request.Form.Count; i++)
                {
                    dic.Add(Request.Form.GetKey(i), Request.Form[i].ToString());
                    //System.Diagnostics.Debug.WriteLine(Request.Form.GetKey(i) + " : " + Request.QueryString[i].ToString());
                }
            }

            return dic;
        }

        /// <summary>
        /// Request.Form으로 넘어온 모든 파라미터를 Dictionary로 만들어서 리턴
        /// </summary>
        /// <returns></returns>
        public Dictionary<string, string> GetParamQueryString()
        {
            Dictionary<string, string> dic = null;

            if (Request != null && Request.QueryString != null && Request.QueryString.Count > 0)
            {
                dic = new Dictionary<string, string>();

                for (int i = 0; i < Request.QueryString.Count; i++)
                {
                    dic.Add(Request.QueryString.GetKey(i), Request.QueryString[i].ToString());

                    //System.Diagnostics.Debug.WriteLine(Request.QueryString.GetKey(i) + " : " + Request.QueryString[i].ToString());
                }
            }

            return dic;
        }

        /// <summary>
        /// Dictionary Type을 파라미터 URL형식으로 만듬
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public string MakeParameter(Dictionary<string, string> param)
        {
            string paramUrl = string.Empty;

            if (param != null && param.Count > 0)
            {
                StringBuilder sb = new StringBuilder();
                foreach (var obj in param)
                {
                    sb.Append(obj.Key).Append("=").Append(obj.Value).Append("&");
                    //string log = string.Format("key={0}, value={1}", obj.Key, obj.Value);
                    //System.Diagnostics.Debug.WriteLine(log);
                }

                // 마지막 &는 제거
                sb.Length = sb.Length - 1;

                paramUrl = sb.ToString();
            }

            return paramUrl;
        }

        protected string GetWebpageFullURI()
        {
            string url = "";

            StringBuilder sb = new StringBuilder();
            sb.Append(Request.Url.Scheme);
            sb.Append("://").Append(Request.Url.Host);
            sb.Append(":").Append(Request.Url.Port);
            sb.Append(Request.Url.LocalPath);
            sb.Append(Request.Url.Query);

            url = sb.ToString();

            return url;
        }

        #endregion

        #region 로그인 & 로그아웃 체크

        /// <summary>
        /// Top 네비 상단 사용자 이름
        /// </summary>
        /// <returns></returns>
        protected void CheckLogin()
        {
            if (Session["staff_name"] == null)
            {
                // session null이면 session이 만료되었거나 서버 재시작이 있었기 때문에 logout시킴
                Logout();
            }
        }

        /// <summary>
        /// logout method
        /// </summary>
        private void Logout()
        {
            FormsAuthentication.SignOut();
            Response.Redirect("../Login.aspx");// 추후 삭제 해도 되는 구문 자동으로 로그인 페이지로 가므로 
            Response.End();
        }

        #endregion

        #region Get-Set

        private CWebSql WebSql
        {
            get
            {
                if (webSql == null)
                {
                    webSql = new CWebSql();
                }

                return webSql;
            }
        }

        protected int PageSize
        {
            get
            {
                return pagesize;
            }
        }

        protected int NowPageNum
        {
            get
            {
                nowPageNum = CStringUtil.ConvertNullOrEmptyToZero(Convert.ToString(Request["pageNo"]));

                if (nowPageNum == 0)
                {
                    nowPageNum = 1;
                }

                return nowPageNum;
            }
        }

        protected int DataTotalCount
        {
            get
            {
                return dataTotalCount;
            }
            set
            {
                dataTotalCount = value;
            }
        }

        private CDirUtil DirUtil
        {
            get
            {
                if (dirUtil == null)
                {
                    dirUtil = new CDirUtil();
                }

                return dirUtil;
            }
        }

		
		#endregion
	}
}