using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Threading;

using log4net;
using CommonLib.Utils;

namespace XWingAgent
{
    public partial class Form1 : Form
    {
        private static readonly ILog logger = LogManager.GetLogger(typeof(Form1));

        private CAgent agent;
        private bool isStarted = false;
        private string lastDate = "";

        public Form1()
        {
            InitializeComponent();
        }

        /// <summary>
        /// 초기화
        /// </summary>
        private void Init()
        {   
            laData.Text = "";
            timer2.Interval = CConst.DATA_CYCLE2;
            timer2.Enabled = true;

            timer1.Interval = CConst.DATA_CYCLE;

            string[] conResult = Agent.Start();

            if (conResult != null)
            {
                laMsg.Text = conResult[1];
            }
        }

        private void GetData()
        {
            if (isStarted == false)
            {
                laMsg.Text = "데이터 연동 시작됨";
                isStarted = true;
                btnStart.Text = "데이터 연동 중지";

                Agent.RequestData();

                timer1.Enabled = true;
            }
            else
            {
                laMsg.Text = "데이터 연동 중지됨";
                isStarted = false;
                btnStart.Text = "데이터 연동 시작";

                timer1.Enabled = false;
            }
        }

        public void DisplayReturnMessage(string msg)
        {
            laData.Text = msg;
            lastDate = CDateUtil.getYYYYMMDDHHMMSS();
            laDate.Text = lastDate;

            //Agent.DisConnect();
            //Agent.Start();
        }

        /// <summary>
        /// 데이터 체크
        /// </summary>
        private void CheckData()
        {
            if (CStringUtil.IsNullOrEmpty(lastDate) == false)
            {
                int diff = CDateUtil.GetDiffDate(lastDate, CDateUtil.getYYYYMMDDHHMMSS());

                if (diff >= CConst.MAX_DATA_FILE_TIME)
                {
                    // MAX_DATA_FILE_TIME(분) 이상 데이터를 못가져오고 있는 경우: 커넥션을 다시 맺음(서버접속 및 로그인)
                    ReConnection();
                }
            }
        }

        /// <summary>
        /// 다시 접속
        /// </summary>
        private void ReConnection()
        {
            CLog.debug(logger, "Form1.ReConnection() : 재연결");

            Agent.DisConnect();

            string[] conResult = Agent.Start();

            if (conResult != null)
            {
                laMsg.Text = conResult[1];
            }
        }

        #region GET-SET
        private CAgent Agent
        {
            get
            {
                if (agent == null)
                {
                    agent = new CAgent(this);
                }

                return agent;
            }
            set
            {
                agent = value;
            }
        }
        #endregion

        #region 이벤트

        private void Form1_Load(object sender, EventArgs e)
        {
            Init();
        }

        private void btnStart_Click(object sender, EventArgs e)
        {
            GetData();
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            Agent.DisConnect();
            Agent = null;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (isStarted)
            {   
                Agent.RequestData();
            }
        }

        private void timer2_Tick(object sender, EventArgs e)
        {
            CheckData();
        }

        #endregion
    }
}
