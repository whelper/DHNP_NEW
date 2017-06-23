using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using AdminSite.m_master;
using CommonLib.Utils;

namespace AdminSite.inv
{
    public partial class ju_juju_list : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SearchData();
            }
        }

        /// <summary>
        /// 데이터를 조회한다.
        /// </summary>
        private void SearchData()
        {
            StringBuilder param = new StringBuilder();
            param.Append("KOR");

            SetDataTableList(3451, param.ToString());

        }

        #region 이벤트 메소드

        /// <summary>
        /// 선택 삭제 버튼 클릭
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
           
            int loop = 1;
            if (eng_override.Checked == true)
            {
                // 영문 덮어쓰기를 한 경우에는 loop를 두번돈다.
                loop = 2;
            }

            string[] LANG_CD = { "KOR", "ENG" };

            for (int k = 0; k < loop; k++)
            {   
                StringBuilder dparam = new StringBuilder();
                dparam.Append(LANG_CD[k]);
                ExecuteQueryResult(3453, dparam.ToString());

                String[] juju_names = Request.Form.GetValues("juju_name");
                String[] juju_rels = Request.Form.GetValues("juju_rel");
                String[] juju_stcs = Request.Form.GetValues("juju_stc");
                String[] juju_bscs = Request.Form.GetValues("juju_bsc");
                String[] juju_bsrs = Request.Form.GetValues("juju_bsr");
                String[] juju_iscs = Request.Form.GetValues("juju_isc");
                String[] juju_dscs = Request.Form.GetValues("juju_dsc");
                String[] juju_etscs = Request.Form.GetValues("juju_etsc");
                String[] juju_etsrs = Request.Form.GetValues("juju_etsr");

                if (juju_names != null && juju_names.Length > 0)
                {
                    for (int i = 0; i < juju_names.Length; i++)
                    {
                        string param1 = juju_names[i];
                        string param2 = juju_rels[i];
                        string param3 = juju_stcs[i];
                        string param4 = juju_bscs[i];
                        string param5 = juju_bsrs[i];
                        string param6 = juju_iscs[i];
                        string param7 = juju_dscs[i];
                        string param8 = juju_etscs[i];
                        string param9 = juju_etsrs[i];

                        StringBuilder param = new StringBuilder();
                        param.Append(param1);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(param2);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(param3);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(param4);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(param5);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(param6);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(param7);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(param8);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(param9);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(Session["admin_id"]);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(LANG_CD[k]);

                        ExecuteQueryResult(3452, param.ToString());
                    }
                }

                String[] juju_tstcs = Request.Form.GetValues("juju_tstc");
                String[] juju_tbscs = Request.Form.GetValues("juju_tbsc");
                String[] juju_tbsrs = Request.Form.GetValues("juju_tbsr");
                String[] juju_tiscs = Request.Form.GetValues("juju_tisc");
                String[] juju_tdscs = Request.Form.GetValues("juju_tdsc");
                String[] juju_tetscs = Request.Form.GetValues("juju_tetsc");
                String[] juju_tetsrs = Request.Form.GetValues("juju_tetsr");

                if (juju_tstcs != null && juju_tstcs.Length > 0)
                {
                    for (int i = 0; i < juju_tstcs.Length; i++)
                    {
                        string param1 = juju_tstcs[i];
                        string param2 = juju_tbscs[i];
                        string param3 = juju_tbsrs[i];
                        string param4 = juju_tiscs[i];
                        string param5 = juju_tdscs[i];
                        string param6 = juju_tetscs[i];
                        string param7 = juju_tetsrs[i];

                        StringBuilder param = new StringBuilder();
                        param.Append(param1);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(param2);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(param3);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(param4);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(param5);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(param6);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(param7);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(Session["admin_id"]);
                        param.Append(CConst.DB_PARAM_DELIMITER).Append(LANG_CD[k]);

                        ExecuteQueryResult(3454, param.ToString());
                    }
                }
            }

            SearchData();
        }

        #endregion
    }
}