using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

using CommonLib.Utils;

namespace CommonLib.DB
{
    public class CWebSql
    {
        // sql 인자값 변수
        private string[] m_value = new string[10];
        private int variableLength = 0;

        DataSet ds = null;

        public DataSet SelectSqlByName(String proc_nm)
        {
            CSQLHelper command = new CSQLHelper();
            ds = command.ExecuteDataSet(proc_nm);

            return ds;
        }

        /// <summary>
        /// 쿼리 agent 
        /// </summary>
        /// <param name="index">쿼리 선택번호</param>
        /// <param name="arg">string화된  sql 인자</param>
        /// <returns>dataset</returns>
        public DataSet SelectSql(int index, string arg)
        {
            ParsingArg(arg);

            #region 쿼리 분배 구역

            CSQLHelper command = new CSQLHelper();
            string[] variable = new string[variableLength]; // sql 의 파라미터 변수 이름 
            SqlDbType[] sqldbtype = new SqlDbType[variableLength];  // sql 의 파라미터 변수 타입

            switch (index)
            {
                #region 공용 모듈 쿼리구역 (쿼리넘버: 1 ~ 999) : (코드, 카테고리, 분류)

                // 공통 ////////////////////////////////////////////////////////////////////////////////////////////////////
                case 1: // 제품 카테고리
                    variable[0] = "@LANG_CD";
                    variable[1] = "@UPR_CATG_NO";
                    variable[2] = "@DEPTH";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.Int;
                    sqldbtype[2] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("UPAR_COM_0001_PROD_CATG_S", variable, m_value, sqldbtype, 3);
                break;

                case 2: // 공통 코드
                variable[0] = "@UPR_COMM_CD";

                sqldbtype[0] = SqlDbType.VarChar;

                ds = command.ExecuteDataSetSecure("UPAR_COM_0002_COMM_CD_S", variable, m_value, sqldbtype, 1);
                break;

                case 10: // 우편번호
                variable[0] = "@TEXT";

                sqldbtype[0] = SqlDbType.VarChar;

                ds = command.ExecuteDataSetSecure("UPAR_COM_0010_ZIPCODE_S", variable, m_value, sqldbtype, 1);
                break;

                case 20: // 직무조회
                variable[0] = "@UPR_DUTY_NO";

                sqldbtype[0] = SqlDbType.Int;

                ds = command.ExecuteDataSetSecure("UPAR_COM_0020_DUTY_S", variable, m_value, sqldbtype, 1);
                break;

                #endregion

                #region 홈페이지 메인 쿼리구역 (쿼리넘버:1000 ~ 1099)

                case 1000: // 메인 조회
                variable[0] = "@LANG_CD";

                sqldbtype[0] = SqlDbType.VarChar;

                ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1000_MAIN_S", variable, m_value, sqldbtype, 1);
                break;

                case 1001: // 메인 퀵 메뉴 배너
                variable[0] = "@LANG_CD";

                sqldbtype[0] = SqlDbType.VarChar;

                ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1001_MAIN_QK_S", variable, m_value, sqldbtype, 1);
                break;


                case 1002:// 메인 제품검색 리스트 카운트
                variable[0] = "@NOW_PAGE";
                variable[1] = "@LANG_CD";
                variable[2] = "@SEARCHTEXT";

                sqldbtype[0] = SqlDbType.Int;
                sqldbtype[1] = SqlDbType.VarChar;
                sqldbtype[2] = SqlDbType.VarChar;

                // 마지막 인자값 항상 확인(파라미터 총수 임)
                ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1002_MAIN_PROD_LIST_COUNT_S", variable, m_value, sqldbtype, 3);
                break;

                case 1003:// 메인 제품검색 리스트
                variable[0] = "@NOW_PAGE";
                variable[1] = "@LANG_CD";
                variable[2] = "@SEARCHTEXT";

                sqldbtype[0] = SqlDbType.Int;
                sqldbtype[1] = SqlDbType.VarChar;
                sqldbtype[2] = SqlDbType.VarChar;

                // 마지막 인자값 항상 확인(파라미터 총수 임)
                ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1003_MAIN_PROD_LIST_S", variable, m_value, sqldbtype, 3);
                break;
                #endregion

                #region 홈페이지 제품 쿼리구역 (쿼리넘버:1100 ~ 1199)
                case 1100:// 제품 서브 카테고리
                variable[0] = "@LANG_CD";
                variable[1] = "@CATG_NO1";
                variable[2] = "@PROD_TYPE_CD";
                variable[3] = "@PROD_S_INIT_NM";
                variable[4] = "@PROD_E_INIT_NM";
                variable[5] = "@PROD_TAG";

                sqldbtype[0] = SqlDbType.VarChar;
                sqldbtype[1] = SqlDbType.VarChar;
                sqldbtype[2] = SqlDbType.VarChar;
                sqldbtype[3] = SqlDbType.VarChar;
                sqldbtype[4] = SqlDbType.VarChar;
                sqldbtype[5] = SqlDbType.VarChar;

                // 마지막 인자값 항상 확인(파라미터 총수 임)
                ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1100_PROD_CATG_LIST_S", variable, m_value, sqldbtype, 6);
                break;

                case 1101:// 제품관리 리스트 카운트
                variable[0] = "@NOW_PAGE";
                variable[1] = "@LANG_CD";
                variable[2] = "@CATG_NO1";
                variable[3] = "@CATG_NO2";
                variable[4] = "@PROD_TYPE_CD";
                variable[5] = "@PROD_S_INIT_NM";
                variable[6] = "@PROD_E_INIT_NM";
                variable[7] = "@PROD_TAG";
                variable[8] = "@P_PAGE_SIZE";

				sqldbtype[0] = SqlDbType.Int;
                sqldbtype[1] = SqlDbType.VarChar;
                sqldbtype[2] = SqlDbType.VarChar;
                sqldbtype[3] = SqlDbType.VarChar;
                sqldbtype[4] = SqlDbType.VarChar;
                sqldbtype[5] = SqlDbType.VarChar;
                sqldbtype[6] = SqlDbType.VarChar;
                sqldbtype[7] = SqlDbType.VarChar;
                sqldbtype[8] = SqlDbType.Int;

					// 마지막 인자값 항상 확인(파라미터 총수 임)
					ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1101_PROD_LIST_COUNT_S", variable, m_value, sqldbtype, 9);
                break;

                case 1102:// 제품관리 리스트
                variable[0] = "@NOW_PAGE";
                variable[1] = "@LANG_CD";
                variable[2] = "@CATG_NO1";
                variable[3] = "@CATG_NO2";
                variable[4] = "@PROD_TYPE_CD";
                variable[5] = "@PROD_S_INIT_NM";
                variable[6] = "@PROD_E_INIT_NM";
                variable[7] = "@PROD_TAG";
                variable[8] = "@P_PAGE_SIZE";
				variable[9] = "@ORDER_BY";

				sqldbtype[0] = SqlDbType.Int;
                sqldbtype[1] = SqlDbType.VarChar;
                sqldbtype[2] = SqlDbType.VarChar;
                sqldbtype[3] = SqlDbType.VarChar;
                sqldbtype[4] = SqlDbType.VarChar;
                sqldbtype[5] = SqlDbType.VarChar;
                sqldbtype[6] = SqlDbType.VarChar;
                sqldbtype[7] = SqlDbType.VarChar;
                sqldbtype[8] = SqlDbType.Int;
				sqldbtype[9] = SqlDbType.VarChar;

					// 마지막 인자값 항상 확인(파라미터 총수 임)
					ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1102_PROD_LIST_S", variable, m_value, sqldbtype, 10);
                break;

                case 1103:// 제품관리 리스트
                variable[0] = "@LANG_CD";
                variable[1] = "@PROD_CD";

                sqldbtype[0] = SqlDbType.VarChar;
                sqldbtype[1] = SqlDbType.VarChar;

                // 마지막 인자값 항상 확인(파라미터 총수 임)
                ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1103_PROD_DETAIL_S", variable, m_value, sqldbtype, 2);
                break;

                case 1104:// 카탈로그 리스트 카운트
                variable[0] = "@NOW_PAGE";
                variable[1] = "@LANG_CD";

                sqldbtype[0] = SqlDbType.Int;
                sqldbtype[1] = SqlDbType.VarChar;

                // 마지막 인자값 항상 확인(파라미터 총수 임)
                ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1104_PROD_CATAL_LIST_COUNT_S", variable, m_value, sqldbtype, 2);
                break;

                case 1105:// 카탈로그 리스트
                variable[0] = "@NOW_PAGE";
                variable[1] = "@LANG_CD";

                sqldbtype[0] = SqlDbType.Int;
                sqldbtype[1] = SqlDbType.VarChar;

                // 마지막 인자값 항상 확인(파라미터 총수 임)
                ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1105_PROD_CATAL_LIST_S", variable, m_value, sqldbtype, 2);
                break;

                case 1111: // 뉴스 리스트 카운트
                variable[0] = "@NOW_PAGE";
                variable[1] = "@SEARCH_TYPE";
                variable[2] = "@SEARCH_CONT";
                sqldbtype[0] = SqlDbType.Int;
                sqldbtype[1] = SqlDbType.VarChar;
                sqldbtype[2] = SqlDbType.VarChar;

                ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1111_PROD_CHA_INFO_LIST_COUNT_S", variable, m_value, sqldbtype, 3);
                break;

                case 1112: // 뉴스 리스트
                variable[0] = "@NOW_PAGE";
                variable[1] = "@SEARCH_TYPE";
                variable[2] = "@SEARCH_CONT";
                sqldbtype[0] = SqlDbType.Int;
                sqldbtype[1] = SqlDbType.VarChar;
                sqldbtype[2] = SqlDbType.VarChar;

                ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1112_PROD_CHA_INFO_LIST_S", variable, m_value, sqldbtype, 3);
                break;

                case 1113: // 뉴스 상세
                variable[0] = "@SEQ_NO";
                sqldbtype[0] = SqlDbType.Int;

                ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1113_PROD_CHA_INFO_DETAIL_S", variable, m_value, sqldbtype, 1);
                break;

                #endregion

                #region 홈페이지 홍보 쿼리구역 (쿼리넘버:1301 ~ 1399)

                case 1301: // 뉴스 리스트 카운트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@SEARCH_TYPE";
                    variable[2] = "@SEARCH_CONT";
                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1301_PROMT_NEWS_LIST_COUNT_S", variable, m_value, sqldbtype, 3);
                    break;

                case 1302: // 뉴스 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@SEARCH_TYPE";
                    variable[2] = "@SEARCH_CONT";
                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1302_PROMT_NEWS_LIST_S", variable, m_value, sqldbtype, 3);
                    break;

                case 1303: // 뉴스 상세
                    variable[0] = "@SEQ_NO";
                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1303_PROMT_NEWS_DETAIL_S", variable, m_value, sqldbtype, 1);
                    break;

                case 1304: // 뉴스 Header
                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1304_PROMT_NEWS_HEADER_S", variable, m_value, sqldbtype, 0);
                    break;

                case 1311: // 해외투자 리스트 카운트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@SEARCH_TYPE";
                    variable[2] = "@SEARCH_CONT";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1311_PROMT_FEG_LIST_COUNT_S", variable, m_value, sqldbtype, 3);
                    break;

                case 1312: // 해외투자 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@SEARCH_TYPE";
                    variable[2] = "@SEARCH_CONT";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1312_PROMT_FEG_LIST_S", variable, m_value, sqldbtype, 3);
                    break;

                case 1313: // 해외투자 상세
                    variable[0] = "@SEQ_NO";
                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1313_PROMT_FEG_DETAIL_S", variable, m_value, sqldbtype, 1);
                    break;

                case 1314: // 해외투자 머릿말
                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1314_PROMT_FEG_HEADER_S", variable, m_value, sqldbtype, 0);
                    break;

                #endregion

                #region 홈페이지 투자 쿼리구역 (쿼리넘버:1201 ~ 1299)

                case 1201: // IR 리스트 카운트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@LANG_CD";
                    variable[2] = "@SEARCH_TYPE";
                    variable[3] = "@SEARCH_CONT";
                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1201_INV_IR_LIST_COUNT_S", variable, m_value, sqldbtype, 4);
                    break;

                case 1202: // IR 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@LANG_CD";
                    variable[2] = "@SEARCH_TYPE";
                    variable[3] = "@SEARCH_CONT";
                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1202_INV_IR_LIST_S", variable, m_value, sqldbtype, 4);
                    break;

                case 1203: // IR 상세
                    variable[0] = "@SEQ_NO";
                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1203_INV_IR_DETAIL_S", variable, m_value, sqldbtype, 1);
                    break;

                case 1231: // 재무상태표 및 재무상태표 데이터

                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1231_INV_FIN_DTL_LIST_S", variable, m_value, sqldbtype, 1);
                    break;

                case 1241: //손익계산서 데이터

                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1241_INV_PROAL_CALC_LIST_S", variable, m_value, sqldbtype, 1);
                    break;

                case 1251: //주식 발행 리스트 -----
                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1251_INV_STOK_PUB_LIST_S", variable, m_value, sqldbtype, 1);

                    break;

                case 1261: //주주 구성 리스트
                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1261_INV_STO_RATIO_LIST_S", variable, m_value, sqldbtype, 1);

                    break;

                case 1271: // 자기주식 리스트
                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1271_INV_TRESTOCK_LIST_S", variable, m_value, sqldbtype, 1);
                    break;

                case 1281: // 공고사항 리스트 카운트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@SEARCH_TYPE";
                    variable[2] = "@SEARCH_CONT";
                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1281_INV_NOTICE_LIST_COUNT_S", variable, m_value, sqldbtype, 3);
                    break;

                case 1282: // 공고사항 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@SEARCH_TYPE";
                    variable[2] = "@SEARCH_CONT";
                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1282_INV_NOTICE_LIST_S", variable, m_value, sqldbtype, 3);
                    break;

                case 1283: // 공고사항 상세
                    variable[0] = "@SEQ_NO";
                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1283_INV_NOTICE_DETAIL_S", variable, m_value, sqldbtype, 1);
                    break;

                case 1284: // 투자 공지/공고 머릿말
                    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1284_INV_NOTICE_HEADER_S", variable, m_value, sqldbtype, 0);
                    break;

                #endregion

                #region 홈페이지 채용 쿼리구역 (쿼리넘버:1400 ~ 1499)
                    case 1421: // 채용공고 리스트 카운트
                        variable[0] = "@NOW_PAGE";
                        variable[1] = "@SEARCH_TYPE";
                        variable[2] = "@SEARCH_CONT";
                        sqldbtype[0] = SqlDbType.Int;
                        sqldbtype[1] = SqlDbType.VarChar;
                        sqldbtype[2] = SqlDbType.VarChar;

                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1421_RCM_NOTICE_LIST_COUNT_S", variable, m_value, sqldbtype, 3);
                        break;

                    case 1422: // 채용공고 리스트
                        variable[0] = "@NOW_PAGE";
                        variable[1] = "@SEARCH_TYPE";
                        variable[2] = "@SEARCH_CONT";
                        sqldbtype[0] = SqlDbType.Int;
                        sqldbtype[1] = SqlDbType.VarChar;
                        sqldbtype[2] = SqlDbType.VarChar;

                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1422_RCM_NOTICE_LIST_S", variable, m_value, sqldbtype, 3);
                        break;

                    case 1423: // 채용공고 상세
                        variable[0] = "@SEQ_NO";
                        sqldbtype[0] = SqlDbType.Int;

                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1423_RCM_NOTICE_DETAIL_S", variable, m_value, sqldbtype, 1);
                        break;

                    case 1424: // 채용공고 머릿말
                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1424_RCM_NOTICE_HEADER_S", variable, m_value, sqldbtype, 0);
                        break;

                    case 1451: // 채용결과 리스트수
                        variable[0] = "@NOW_PAGE";
                        sqldbtype[0] = SqlDbType.Int;

                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1451_RCM_RESULT_LIST_COUNT_S", variable, m_value, sqldbtype, 1);
                        break;

                    case 1452: // 채용결과 리스트
                        variable[0] = "@NOW_PAGE";
                        sqldbtype[0] = SqlDbType.Int;

                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1452_RCM_RESULT_LIST_S", variable, m_value, sqldbtype, 1);
                        break;

                    case 1453: // 채용결과 확인
                        variable[0] = "@REG_SEQ_NO";
                        variable[1] = "@CHI_NM";
                        variable[2] = "@CELLTEL";
                        variable[3] = "@EMAIL";

                        sqldbtype[0] = SqlDbType.Int;
                        sqldbtype[1] = SqlDbType.VarChar;
                        sqldbtype[2] = SqlDbType.VarChar;
                        sqldbtype[3] = SqlDbType.VarChar;

                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1453_RCM_RESULT_DETAIL_S", variable, m_value, sqldbtype, 4);
                        break;

                    case 1454: // 채용결과 확인
                        variable[0] = "@REG_SEQ_NO";
                        variable[1] = "@CHI_NM";
                        variable[2] = "@CELLTEL";
                        variable[3] = "@EMAIL";

                        sqldbtype[0] = SqlDbType.Int;
                        sqldbtype[1] = SqlDbType.VarChar;
                        sqldbtype[2] = SqlDbType.VarChar;
                        sqldbtype[3] = SqlDbType.VarChar;

                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1454_RCM_MYINFO_DETAIL_S", variable, m_value, sqldbtype, 4);
                        break;

                    case 1531: // 입사지원 리스트 카운트
                        variable[0] = "@NOW_PAGE";
                        variable[1] = "@RCM_JOBGROUP";
                        variable[2] = "@RCM_CAREER";

                        sqldbtype[0] = SqlDbType.Int;
                        sqldbtype[1] = SqlDbType.VarChar;
                        sqldbtype[2] = SqlDbType.VarChar;

                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1531_RCM_REG_LIST_COUNT_S", variable, m_value, sqldbtype, 3);
                        break;

                    case 1532: // 입사지원 리스트
                        variable[0] = "@NOW_PAGE";
                        variable[1] = "@RCM_JOBGROUP";
                        variable[2] = "@RCM_CAREER";

                        sqldbtype[0] = SqlDbType.Int;
                        sqldbtype[1] = SqlDbType.VarChar;
                        sqldbtype[2] = SqlDbType.VarChar;

                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1532_RCM_REG_LIST_S", variable, m_value, sqldbtype, 3);
                        break;

                     case 1533: // 입사지원 상세
                        variable[0] = "@REG_SEQ_NO";
                        variable[1] = "@CODE_YN";

                        sqldbtype[0] = SqlDbType.Int;
                        sqldbtype[1] = SqlDbType.VarChar;

                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1533_RCM_REG_DETAIL_S", variable, m_value, sqldbtype, 2);
                        break;

                    case 1534: // 입사지원 수정 상세
                        variable[0] = "@SUPPORT_NO";

                        sqldbtype[0] = SqlDbType.Int;

                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1534_RCM_MOD_DETAIL_S", variable, m_value, sqldbtype, 1);
                        break;

                    //case 1433: // 입사지원 메인 입력
                    //    variable[0] = "@SUPPORT_TYPE_CD";
                    //    variable[1] = "@SUPPORT_POS_CD";
                    //    variable[2] = "@SUPPORT_CR_CD";
                    //    variable[3] = "@SUPPORT_STAFF_CD";
                    //    variable[4] = "@BUSS_CD";
                    //    variable[5] = "@PRODT_FUNCT_CD";
                    //    variable[6] = "@RESEARCH_CD";
                    //    variable[7] = "@HOPE_POSITION";
                    //    variable[8] = "@SUPPORT_MOTIVE";
                    //    variable[9] = "@SUPPORT_MOTIVE_R";
                    //    variable[10] = "@HOPE_WORK_PLACE";
                    //    variable[11] = "@JOINCOMP_PB_DATE";
                    //    variable[12] = "@HS_NM";
                    //    variable[13] = "@HS_LOC_CD";
                    //    variable[14] = "@HS_QUAL_EXAM_YN";
                    //    variable[15] = "@HS_GRAD_DATE";
                    //    variable[16] = "@HS_GRAD_SELECT_CD";
                    //    variable[17] = "@HS_MAJOR_CD";
                    //    variable[18] = "@IMG";
                    //    variable[19] = "@CHI_NM";
                    //    variable[20] = "@BIRTHDAY";
                    //    variable[21] = "@TEL";
                    //    variable[22] = "@CELLTEL";
                    //    variable[23] = "@EMAIL";
                    //    variable[24] = "@ZIPCODE_STR";
                    //    variable[25] = "@ZIPCODE_END";
                    //    variable[26] = "@ADDR";
                    //    variable[27] = "@ADDR_DTL";
                    //    variable[28] = "@INTRO_GROW_PROCESS";
                    //    variable[29] = "@INTRO_CHAR__ADV_FAULT";
                    //    variable[30] = "@INTRO_SUPPORT_MOTIVE";
                    //    variable[31] = "@INTRO_JOINCOMP_ASPIRA";

                    //    sqldbtype[0] = SqlDbType.VarChar;
                    //    sqldbtype[1] = SqlDbType.VarChar;
                    //    sqldbtype[2] = SqlDbType.VarChar;
                    //    sqldbtype[3] = SqlDbType.VarChar;
                    //    sqldbtype[4] = SqlDbType.VarChar;
                    //    sqldbtype[5] = SqlDbType.VarChar;
                    //    sqldbtype[6] = SqlDbType.VarChar;
                    //    sqldbtype[7] = SqlDbType.VarChar;
                    //    sqldbtype[8] = SqlDbType.VarChar;
                    //    sqldbtype[9] = SqlDbType.VarChar;
                    //    sqldbtype[10] = SqlDbType.VarChar;
                    //    sqldbtype[11] = SqlDbType.VarChar;
                    //    sqldbtype[12] = SqlDbType.VarChar;
                    //    sqldbtype[13] = SqlDbType.VarChar;
                    //    sqldbtype[14] = SqlDbType.VarChar;
                    //    sqldbtype[15] = SqlDbType.VarChar;
                    //    sqldbtype[16] = SqlDbType.VarChar;
                    //    sqldbtype[17] = SqlDbType.VarChar;
                    //    sqldbtype[18] = SqlDbType.VarChar;
                    //    sqldbtype[19] = SqlDbType.VarChar;
                    //    sqldbtype[20] = SqlDbType.VarChar;
                    //    sqldbtype[21] = SqlDbType.VarChar;
                    //    sqldbtype[22] = SqlDbType.VarChar;
                    //    sqldbtype[23] = SqlDbType.VarChar;
                    //    sqldbtype[24] = SqlDbType.VarChar;
                    //    sqldbtype[25] = SqlDbType.VarChar;
                    //    sqldbtype[26] = SqlDbType.VarChar;
                    //    sqldbtype[27] = SqlDbType.VarChar;
                    //    sqldbtype[28] = SqlDbType.VarChar;
                    //    sqldbtype[29] = SqlDbType.VarChar;
                    //    sqldbtype[30] = SqlDbType.VarChar;
                    //    sqldbtype[31] = SqlDbType.VarChar;


                    //    ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1433_RCM_JOINCOMP_STATUS_I", variable, m_value, sqldbtype, 32);
                    //    break;

                    case 1434: // 입사지원 학력사항
                        variable[0] = "@SUPPORT_NO";
                        variable[1] = "@TYPE_CD";
                        variable[2] = "@SCH_NM";
                        variable[3] = "@MATER_CD";
                        variable[4] = "@BSL_TSL_CD";
                        variable[5] = "@ADMIS_YEAR";
                        variable[6] = "@ADMIS_CD";
                        variable[7] = "@GRADUT_YEAR";
                        variable[8] = "@GRADUT_CD";
                        variable[9] = "@ABILITY_CD";
                        variable[10] = "@DEPT_NM";
                        variable[11] = "@SCORE";
                        variable[12] = "@CREDIT";
                        variable[13] = "@GRADUT_DISSERT_NM";

                        sqldbtype[0] = SqlDbType.Int;
                        sqldbtype[1] = SqlDbType.VarChar;
                        sqldbtype[2] = SqlDbType.VarChar;
                        sqldbtype[3] = SqlDbType.VarChar;
                        sqldbtype[4] = SqlDbType.VarChar;
                        sqldbtype[5] = SqlDbType.VarChar;
                        sqldbtype[6] = SqlDbType.VarChar;
                        sqldbtype[7] = SqlDbType.VarChar;
                        sqldbtype[8] = SqlDbType.VarChar;
                        sqldbtype[9] = SqlDbType.VarChar;
                        sqldbtype[10] = SqlDbType.VarChar;
                        sqldbtype[11] = SqlDbType.VarChar;
                        sqldbtype[12] = SqlDbType.VarChar;
                        sqldbtype[13] = SqlDbType.VarChar;

                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1434_RCM_JOINCOMP_STATUS_AA_I", variable, m_value, sqldbtype, 14);
                        break;

                    case 1435: // 입사지원 경력사항
                        variable[0] = "@SUPPORT_NO";
                        variable[1] = "@COMPANY_NM";
                        variable[2] = "@JOINCOMP_YEAR";
                        variable[3] = "@RSN_YEAR";
                        variable[4] = "@CAREER_TERM_CD";
                        variable[5] = "@DEPT_NM";
                        variable[6] = "@POSIT_CD";
                        variable[7] = "@DUTY_CD";
                        variable[8] = "@SAL";
                        variable[9] = "@JOB_CONT";
                        variable[10] = "@PROJECT";
                        variable[11] = "@DTL_BUSIN";
                        variable[12] = "@MAJOR_JOB_OUTC";
                        variable[13] = "@CHANGE_JOB_REASON";

                        sqldbtype[0] = SqlDbType.Int;
                        sqldbtype[1] = SqlDbType.VarChar;
                        sqldbtype[2] = SqlDbType.VarChar;
                        sqldbtype[3] = SqlDbType.VarChar;
                        sqldbtype[4] = SqlDbType.VarChar;
                        sqldbtype[5] = SqlDbType.VarChar;
                        sqldbtype[6] = SqlDbType.VarChar;
                        sqldbtype[7] = SqlDbType.VarChar;
                        sqldbtype[8] = SqlDbType.VarChar;
                        sqldbtype[9] = SqlDbType.VarChar;
                        sqldbtype[10] = SqlDbType.VarChar;
                        sqldbtype[11] = SqlDbType.VarChar;
                        sqldbtype[12] = SqlDbType.VarChar;
                        sqldbtype[13] = SqlDbType.VarChar;

                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1435_RCM_JOINCOMP_STATUS_CR_I", variable, m_value, sqldbtype, 14);
                        break;

                    case 1436: // 입사지원 자격사항
                        variable[0] = "@SUPPORT_NO";
                        variable[1] = "@CDT_KIND";
                        variable[2] = "@ACQ_DT";
                        variable[3] = "@PUB_PLACE";

                        sqldbtype[0] = SqlDbType.Int;
                        sqldbtype[1] = SqlDbType.Int;
                        sqldbtype[2] = SqlDbType.VarChar;
                        sqldbtype[3] = SqlDbType.VarChar;

                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1436_RCM_JOINCOMP_STATUS_CDT_I", variable, m_value, sqldbtype, 4);
                        break;

                    case 1437: // 입사지원 경력기술서
                        variable[0] = "@SUPPORT_NO";
                        variable[1] = "@REL";
                        variable[2] = "@NM";
                        variable[3] = "@AGE";
                        variable[4] = "@ABILITY";
                        variable[5] = "@JOB";
                        variable[6] = "@JOB_NM";
                        variable[7] = "@POSIT";

                        sqldbtype[0] = SqlDbType.Int;
                        sqldbtype[1] = SqlDbType.VarChar;
                        sqldbtype[2] = SqlDbType.VarChar;
                        sqldbtype[3] = SqlDbType.VarChar;
                        sqldbtype[4] = SqlDbType.VarChar;
                        sqldbtype[5] = SqlDbType.VarChar;
                        sqldbtype[6] = SqlDbType.VarChar;
                        sqldbtype[7] = SqlDbType.VarChar;

                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1437_RCM_JOINCOMP_FAMILY_I", variable, m_value, sqldbtype, 8);
                        break;

                     case 1441: // FAQ 리스트 카운트
                        variable[0] = "@NOW_PAGE";
                        //variable[1] = "@SEARCH_TYPE";
                        //variable[2] = "@SEARCH_CONT";
                        sqldbtype[0] = SqlDbType.Int;
                        //sqldbtype[1] = SqlDbType.VarChar;
                        //sqldbtype[2] = SqlDbType.VarChar;

                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1441_RCM_FAQ_LIST_COUNT_S", variable, m_value, sqldbtype, 1);
                        break;

                     case 1442: // FAQ 리스트
                        variable[0] = "@NOW_PAGE";
                        //variable[1] = "@SEARCH_TYPE";
                        //variable[2] = "@SEARCH_CONT";
                        sqldbtype[0] = SqlDbType.Int;
                        //sqldbtype[1] = SqlDbType.VarChar;
                        //sqldbtype[2] = SqlDbType.VarChar;

                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1442_RCM_FAQ_LIST_S", variable, m_value, sqldbtype, 1);
                        break;

                     case 1443: // FAQ 상세
                        variable[0] = "@SEQ_NO";
                        sqldbtype[0] = SqlDbType.Int;

                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1443_RCM_FAQ_DETAIL_S", variable, m_value, sqldbtype, 1);
                        break;


                #endregion

                #region 홈페이지 고객 쿼리구역 (쿼리넘버:1500 ~ 1599)

                     case 1501:// 제품문의 등록
                        variable[0] = "@TTL";
                        variable[1] = "@WRITER_NM";
                        variable[2] = "@TEL";
                        variable[3] = "@EMAIL";
                        variable[4] = "@CONT";
						variable[5] = "@GUBUN";

						sqldbtype[0] = SqlDbType.VarChar;
                        sqldbtype[1] = SqlDbType.VarChar;
                        sqldbtype[2] = SqlDbType.VarChar;
                        sqldbtype[3] = SqlDbType.VarChar;
                        sqldbtype[4] = SqlDbType.VarChar;
						sqldbtype[5] = SqlDbType.VarChar;

					// 마지막 인자값 항상 확인(파라미터 총수 임)
					ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1501_CUST_PROD_INQ_I", variable, m_value, sqldbtype, 6);
                        break;

                     case 1511:// 제휴제안 등록
                        variable[0] = "@WRITER_NM";
                        variable[1] = "@BUSIN_NM";
                        variable[2] = "@POSIT";
                        variable[3] = "@TEL";
                        variable[4] = "@EMAIL";
                        variable[5] = "@TTL";
                        variable[6] = "@CONT";

                        sqldbtype[0] = SqlDbType.VarChar;
                        sqldbtype[1] = SqlDbType.VarChar;
                        sqldbtype[2] = SqlDbType.VarChar;
                        sqldbtype[3] = SqlDbType.VarChar;
                        sqldbtype[4] = SqlDbType.VarChar;
                        sqldbtype[5] = SqlDbType.VarChar;
                        sqldbtype[6] = SqlDbType.VarChar;

                        // 마지막 인자값 항상 확인(파라미터 총수 임)
                        ds = command.ExecuteDataSetSecure("USP_HOMEPAGE_1511_CUST_ALLACE_SUGT_I", variable, m_value, sqldbtype, 7);
                        break;

                #endregion

                #region Admin 공통 쿼리구역 (쿼리넘버:3000 ~ 3099)
                case 3000:// 로그인
                    variable[0] = "@ADMIN_ID";
                    variable[1] = "@ADMIN_PW";
                    variable[2] = "@ADMIN_PW_ENC";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3000_LOGIN_S", variable, m_value, sqldbtype, 3);
                    break;

                case 3001:// 매뉴권한
                    variable[0] = "@ADMIN_ID";

                    sqldbtype[0] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3001_MENU_AUTH_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3002:// 파일삭제
                    variable[0] = "@TB";
                    variable[1] = "@COL";
                    variable[2] = "@KEY_COL";
                    variable[3] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3002_FILE_U", variable, m_value, sqldbtype, 4);
                    break;

                #endregion

                #region Admin 메인 쿼리구역 (쿼리넘버:3100 ~ 3199)
                case 3100:// 메인 데이터 조회
                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3100_MAIN_LIST_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3101:// 메인 데이터 수정
                    variable[0] = "@LANG_CD";
                    variable[1] = "@INPUT_TYPE";
                    variable[2] = "@SEQ_NO";
                    variable[3] = "@FILE_PATH";
                    variable[4] = "@LINK_URL";
                    variable[5] = "@ADMIN_ID";
                    variable[6] = "@SRCH_TEXT";
                    variable[7] = "@USE_YN";
                    variable[8] = "@TARGET_YN";
                    variable[9] = "@PROD_ICON";
                    variable[10] = "@WIDTH";
                    variable[11] = "@HEIGHT";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.Int;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.VarChar;
                    sqldbtype[9] = SqlDbType.VarChar;
                    sqldbtype[10] = SqlDbType.Int;
                    sqldbtype[11] = SqlDbType.Int;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3101_MAIN_UPDATE_U", variable, m_value, sqldbtype, 12);
                    break;

                case 3102:// 주식정보 수정 (XwingAgent에서만 사용)
                    variable[0] = "@HNAME";
                    variable[1] = "@PRICE";
                    variable[2] = "@SIGN";
                    variable[3] = "@CHANGE";
                    variable[4] = "@DIFF";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.Int;
                    sqldbtype[2] = SqlDbType.Int;
                    sqldbtype[3] = SqlDbType.Int;
                    sqldbtype[4] = SqlDbType.Float;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3102_MAIN_STOCK_U", variable, m_value, sqldbtype, 5);
                    break;

                case 3103:// 메인 파일 삭제
                    variable[0] = "@LANG_CD";
                    variable[1] = "@INPUT_TYPE";
                    variable[2] = "@SEQ_NO";
                    variable[3] = "@ADMIN_ID";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.Int;
                    sqldbtype[3] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3103_MAIN_UPDATE_FILE_U", variable, m_value, sqldbtype, 4);
                    break;

                #endregion

                #region Admin 제품관리 쿼리구역 (쿼리넘버:3200 ~ 3299)
                case 3201:// 제품관리 리스트 카운트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@LANG_CD";
                    variable[2] = "@CATG_NO1";
                    variable[3] = "@CATG_NO2";
                    variable[4] = "@PROD_NM";
                    variable[5] = "@PROD_CD";
                    variable[6] = "@PROD_TYPE_CD";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3201_PROD_LIST_COUNT_S", variable, m_value, sqldbtype, 7);
                    break;

                case 3202:// 제품관리 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@LANG_CD";
                    variable[2] = "@CATG_NO1";
                    variable[3] = "@CATG_NO2";
                    variable[4] = "@PROD_NM";
                    variable[5] = "@PROD_CD";
                    variable[6] = "@PROD_TYPE_CD";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3202_PROD_LIST_S", variable, m_value, sqldbtype, 7);
                    break;

                case 3203:// 제품관리 상세
                    variable[0] = "@LANG_CD";
                    variable[1] = "@PROD_CD";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3203_PROD_DETAIL_S", variable, m_value, sqldbtype, 2);
                    break;

                case 3204:// 제품관리 입력
                    variable[0] = "@LANG_CD";
                    variable[1] = "@PROD_CD";
                    variable[2] = "@CATG_NO";
                    variable[3] = "@CATG_NO1";
                    variable[4] = "@CATG_NO2";
                    variable[5] = "@PROD_TYPE";
                    variable[6] = "@WRITER_ID";
                    variable[7] = "@PROD_IMG1";
                    variable[8] = "@PROD_IMG2";
                    variable[9] = "@PROD_IMG3";
                    variable[10] = "@PROD_IMG4";
                    variable[11] = "@PROD_IMG5";
                    variable[12] = "@CLIP_URL";
                    variable[13] = "@CATALOG";
                    variable[14] = "@MANUAL";
                    variable[15] = "@THUMBNAIL";
                    variable[16] = "@PROD_NM";
                    variable[17] = "@EFT";
                    variable[18] = "@INGREDI";
                    variable[19] = "@TEMPER";
                    variable[20] = "@PMEDI";
                    variable[21] = "@USAGE";
                    variable[22] = "@INSU_CD";
                    variable[23] = "@PACK_MEA";
                    variable[24] = "@CAVEAT";
                    variable[25] = "@DOMIN";
                    variable[26] = "@SUMR";
                    variable[27] = "@KEEP";
                    variable[28] = "@STAND";
                    variable[29] = "@REMARK";
                    variable[30] = "@COMPT";
                    variable[31] = "@PROD_INFO";
                    variable[32] = "@PROD_DIV";
                    variable[33] = "@NEW_START_DT";
                    variable[34] = "@NEW_END_DT";
                    variable[35] = "@OPEN_YN";
                    variable[36] = "@NEW_YN";
					variable[37] = "@ANI_CATE";
					variable[38] = "@REG_DT";

					sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.Int;
                    sqldbtype[3] = SqlDbType.Int;
                    sqldbtype[4] = SqlDbType.Int;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.VarChar;
                    sqldbtype[9] = SqlDbType.VarChar;
                    sqldbtype[10] = SqlDbType.VarChar;
                    sqldbtype[11] = SqlDbType.VarChar;
                    sqldbtype[12] = SqlDbType.VarChar;
                    sqldbtype[13] = SqlDbType.VarChar;
                    sqldbtype[14] = SqlDbType.VarChar;
                    sqldbtype[15] = SqlDbType.VarChar;
                    sqldbtype[16] = SqlDbType.VarChar;
                    sqldbtype[17] = SqlDbType.VarChar;
                    sqldbtype[18] = SqlDbType.VarChar;
                    sqldbtype[19] = SqlDbType.VarChar;
                    sqldbtype[20] = SqlDbType.VarChar;
                    sqldbtype[21] = SqlDbType.Text;
                    sqldbtype[22] = SqlDbType.VarChar;
                    sqldbtype[23] = SqlDbType.VarChar;
                    sqldbtype[24] = SqlDbType.VarChar;
                    sqldbtype[25] = SqlDbType.VarChar;
                    sqldbtype[26] = SqlDbType.VarChar;
                    sqldbtype[27] = SqlDbType.VarChar;
                    sqldbtype[28] = SqlDbType.VarChar;
                    sqldbtype[29] = SqlDbType.VarChar;
                    sqldbtype[30] = SqlDbType.VarChar;
                    sqldbtype[31] = SqlDbType.VarChar;
                    sqldbtype[32] = SqlDbType.VarChar;
                    sqldbtype[33] = SqlDbType.VarChar;
                    sqldbtype[34] = SqlDbType.VarChar;
                    sqldbtype[35] = SqlDbType.VarChar;
                    sqldbtype[36] = SqlDbType.VarChar;
					sqldbtype[37] = SqlDbType.VarChar;
					sqldbtype[38] = SqlDbType.VarChar;

					// 마지막 인자값 항상 확인(파라미터 총수 임)
					ds = command.ExecuteDataSetSecure("USP_ADMIN_3204_PROD_DETAIL_I", variable, m_value, sqldbtype, 39);
                    break;

                case 3205:// 제품관리 수정
                    variable[0] = "@LANG_CD";
                    variable[1] = "@PROD_CD";
                    variable[2] = "@CATG_NO";
                    variable[3] = "@CATG_NO1";
                    variable[4] = "@CATG_NO2";
                    variable[5] = "@PROD_TYPE";
                    variable[6] = "@WRITER_ID";
                    variable[7] = "@PROD_IMG1";
                    variable[8] = "@PROD_IMG2";
                    variable[9] = "@PROD_IMG3";
                    variable[10] = "@PROD_IMG4";
                    variable[11] = "@PROD_IMG5";
                    variable[12] = "@CLIP_URL";
                    variable[13] = "@CATALOG";
                    variable[14] = "@MANUAL";
                    variable[15] = "@THUMBNAIL";
                    variable[16] = "@PROD_NM";
                    variable[17] = "@EFT";
                    variable[18] = "@INGREDI";
                    variable[19] = "@TEMPER";
                    variable[20] = "@PMEDI";
                    variable[21] = "@USAGE";
                    variable[22] = "@INSU_CD";
                    variable[23] = "@PACK_MEA";
                    variable[24] = "@CAVEAT";
                    variable[25] = "@DOMIN";
                    variable[26] = "@SUMR";
                    variable[27] = "@KEEP";
                    variable[28] = "@STAND";
                    variable[29] = "@REMARK";
                    variable[30] = "@COMPT";
                    variable[31] = "@PROD_INFO";
                    variable[32] = "@PROD_DIV";
                    variable[33] = "@NEW_START_DT";
                    variable[34] = "@NEW_END_DT";
                    variable[33] = "@NEW_START_DT";
                    variable[34] = "@NEW_END_DT";
                    variable[35] = "@OPEN_YN";
                    variable[36] = "@NEW_YN";
                    variable[37] = "@ANI_CATE";
					variable[38] = "@REG_DT";


					sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.Int;
                    sqldbtype[3] = SqlDbType.Int;
                    sqldbtype[4] = SqlDbType.Int;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.VarChar;
                    sqldbtype[9] = SqlDbType.VarChar;
                    sqldbtype[10] = SqlDbType.VarChar;
                    sqldbtype[11] = SqlDbType.VarChar;
                    sqldbtype[12] = SqlDbType.VarChar;
                    sqldbtype[13] = SqlDbType.VarChar;
                    sqldbtype[14] = SqlDbType.VarChar;
                    sqldbtype[15] = SqlDbType.VarChar;
                    sqldbtype[16] = SqlDbType.VarChar;
                    sqldbtype[17] = SqlDbType.VarChar;
                    sqldbtype[18] = SqlDbType.VarChar;
                    sqldbtype[19] = SqlDbType.VarChar;
                    sqldbtype[20] = SqlDbType.VarChar;
                    sqldbtype[21] = SqlDbType.Text;
                    sqldbtype[22] = SqlDbType.VarChar;
                    sqldbtype[23] = SqlDbType.VarChar;
                    sqldbtype[24] = SqlDbType.VarChar;
                    sqldbtype[25] = SqlDbType.VarChar;
                    sqldbtype[26] = SqlDbType.VarChar;
                    sqldbtype[27] = SqlDbType.VarChar;
                    sqldbtype[28] = SqlDbType.VarChar;
                    sqldbtype[29] = SqlDbType.VarChar;
                    sqldbtype[30] = SqlDbType.VarChar;
                    sqldbtype[31] = SqlDbType.VarChar;
                    sqldbtype[32] = SqlDbType.VarChar;
                    sqldbtype[33] = SqlDbType.VarChar;
                    sqldbtype[34] = SqlDbType.VarChar;
                    sqldbtype[35] = SqlDbType.VarChar;
                    sqldbtype[36] = SqlDbType.VarChar;
                    sqldbtype[37] = SqlDbType.VarChar;
					sqldbtype[38] = SqlDbType.VarChar;

					// 마지막 인자값 항상 확인(파라미터 총수 임)
					ds = command.ExecuteDataSetSecure("USP_ADMIN_3205_PROD_DETAIL_U", variable, m_value, sqldbtype, 39);
                    break;

                case 3206:// 제품관리 삭제
                    variable[0] = "@LANG_CD";
                    variable[1] = "@PROD_CD";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3206_PROD_DETAIL_D", variable, m_value, sqldbtype, 2);
                    break;

                case 3207:// 제품관리 삭제
                    variable[0] = "@LANG_CD";
                    variable[1] = "@PROD_CD";
                    variable[2] = "@TAG_NM";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3207_PROD_TAG_U", variable, m_value, sqldbtype, 3);
                    break;

                case 3208:// 제품 태그 전부 삭제
                    variable[0] = "@LANG_CD";
                    variable[1] = "@PROD_CD";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3208_PROD_TAG_D", variable, m_value, sqldbtype, 2);
                    break;

                case 3209:// 제품 파일 삭제
                    variable[0] = "@LANG_CD";
                    variable[1] = "@PROD_CD";
                    variable[2] = "@DEL_FILE_COL";
                    variable[3] = "@WRITER_ID";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3209_PROD_DETAIL_FILE_U", variable, m_value, sqldbtype, 4);
                    break;

                case 3211:// 제품관리 카달로그 리스트 카운트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";
                    variable[2] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3211_PROD_CATAL_LIST_COUNT_S", variable, m_value, sqldbtype, 3);
                    break;

                case 3212:// 제품관리 카달로그 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";
                    variable[2] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3212_PROD_CATAL_LIST_S", variable, m_value, sqldbtype, 3);
                    break;

                case 3213:// 제품관리 카달로그 상세
                    variable[0] = "@PROD_CD";
                    variable[1] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3213_PROD_CATAL_DETAIL_S", variable, m_value, sqldbtype, 2);
                    break;

                case 3214:// 제품관리 카달로그 입력
                    variable[0] = "@LANG_CD";
                    variable[1] = "@TTL";
                    variable[2] = "@INTRO";
                    variable[3] = "@CONT";
                    variable[4] = "@WRITER_ID";
                    variable[5] = "@THUMBNAIL";
                    variable[6] = "@CATALOG";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3214_PROD_CATAL_DETAIL_I", variable, m_value, sqldbtype, 7);
                    break;

                case 3215:// 제품관리 카달로그 수정
                    variable[0] = "@LANG_CD";
                    variable[1] = "@TTL";
                    variable[2] = "@INTRO";
                    variable[3] = "@CONT";
                    variable[4] = "@WRITER_ID";
                    variable[5] = "@THUMBNAIL";
                    variable[6] = "@CATALOG";
                    variable[7] = "@PROD_CD";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3215_PROD_CATAL_DETAIL_U", variable, m_value, sqldbtype, 8);
                    break;

                case 3216:// 제품관리 카달로그 삭제
                    variable[0] = "@PROD_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3216_PROD_CATAL_DETAIL_D", variable, m_value, sqldbtype, 1);
                    break;

                case 3217:// 파일삭제
                    variable[0] = "@SEQ_NO";
                    variable[1] = "@DEL_FILE_COL";
                    variable[2] = "@WRITER_ID";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3217_PROD_CATAL_DETAIL_FILE_U", variable, m_value, sqldbtype, 3);
                    break;

                case 3221: // 제품변경정보 리스트 카운트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";
                    variable[2] = "@SDATE";
                    variable[3] = "@EDATE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3221_PROD_CHA_INFO_LIST_COUNT_S", variable, m_value, sqldbtype, 4);
                    break;

                case 3222: // 제품변경정보 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";
                    variable[2] = "@SDATE";
                    variable[3] = "@EDATE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3222_PROD_CHA_INFO_LIST_S", variable, m_value, sqldbtype, 4);
                    break;

                case 3223: // 제품변경정보 상세
                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3223_PROD_CHA_INFO_DETAIL_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3224: // 제품변경정보 입력
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@TTL";
                    variable[2] = "@CONT";
                    variable[3] = "@WRITER_ID";
                    variable[4] = "@IMG1";
                    variable[5] = "@IMG2";
                    variable[6] = "@IMG3";
                    variable[7] = "@IMG4";
                    variable[8] = "@IMG5";
                    variable[9] = "@CLIP_URL";
                    variable[10] = "@REG_DATE";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.VarChar;
                    sqldbtype[9] = SqlDbType.VarChar;
                    sqldbtype[10] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3224_PROD_CHA_INFO_DETAIL_I", variable, m_value, sqldbtype, 11);
                    break;

                case 3225: // 제품변경정보 수정
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@TTL";
                    variable[2] = "@CONT";
                    variable[3] = "@WRITER_ID";
                    variable[4] = "@IMG1";
                    variable[5] = "@IMG2";
                    variable[6] = "@IMG3";
                    variable[7] = "@IMG4";
                    variable[8] = "@IMG5";
                    variable[9] = "@CLIP_URL";
                    variable[10] = "@REG_DATE";
                    variable[11] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.VarChar;
                    sqldbtype[9] = SqlDbType.VarChar;
                    sqldbtype[10] = SqlDbType.VarChar;
                    sqldbtype[11] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3225_PROD_CHA_INFO_DETAIL_U", variable, m_value, sqldbtype, 12);
                    break;

                case 3226: // 제품변경정보 삭제
                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3226_PROD_CHA_INFO_DETAIL_D", variable, m_value, sqldbtype, 1);
                    break;

                case 3227: // 파일 삭제
                    variable[0] = "@SEQ_NO";
                    variable[1] = "@DEL_FILE_COL";
                    variable[2] = "@WRITER_ID";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3227_PROD_CHA_INFO_DETAIL_FILE_U", variable, m_value, sqldbtype, 3);
                    break;

                case 3231:
                    variable[0] = "@CATG_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3231_PROD_REP_CATAL_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3232:
                    variable[0] = "@CATG_NO";
                    variable[1] = "@LANG_CD";
                    variable[2] = "@CATAL_URL";
                    variable[3] = "@WRITER_ID";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3232_PROD_REP_CATAL_U", variable, m_value, sqldbtype, 4);
                    break;

                case 3233:
                    variable[0] = "@CATG_NO";
                    variable[1] = "@WRITER_ID";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3233_PROD_REP_CATAL_FILE_U", variable, m_value, sqldbtype, 2);
                    break;

                #endregion

                #region Admin 홍보 쿼리구역 (쿼리넘버:3301 ~ 3399)

                case 3301: // 뉴스 리스트 카운트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";
                    variable[2] = "@SDATE";
                    variable[3] = "@EDATE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3301_PROMT_NEWS_LIST_COUNT_S", variable, m_value, sqldbtype, 4);
                    break;

                case 3302: // 뉴스 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";
                    variable[2] = "@SDATE";
                    variable[3] = "@EDATE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3302_PROMT_NEWS_LIST_S", variable, m_value, sqldbtype, 4);
                    break;

                case 3303: // 뉴스 상세
                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3303_PROMT_NEWS_DETAIL_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3304: // 뉴스 입력
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@TTL";
                    variable[2] = "@CONT";
                    variable[3] = "@WRITER_ID";
                    variable[4] = "@IMG1";
                    variable[5] = "@IMG2";
                    variable[6] = "@IMG3";
                    variable[7] = "@IMG4";
                    variable[8] = "@IMG5";
                    variable[9] = "@CLIP_URL";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.VarChar;
                    sqldbtype[9] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3304_PROMT_NEWS_DETAIL_I", variable, m_value, sqldbtype, 10);
                    break;

                case 3305: // 뉴스 수정
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@TTL";
                    variable[2] = "@CONT";
                    variable[3] = "@WRITER_ID";
                    variable[4] = "@IMG1";
                    variable[5] = "@IMG2";
                    variable[6] = "@IMG3";
                    variable[7] = "@IMG4";
                    variable[8] = "@IMG5";
                    variable[9] = "@CLIP_URL";
                    variable[10] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.VarChar;
                    sqldbtype[9] = SqlDbType.VarChar;
                    sqldbtype[10] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3305_PROMT_NEWS_DETAIL_U", variable, m_value, sqldbtype, 11);
                    break;

                case 3306: // 뉴스 삭제
                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3306_PROMT_NEWS_DETAIL_D", variable, m_value, sqldbtype, 1);
                    break;

                case 3307: //뉴스 머릿말 등록
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@TTL";
                    variable[2] = "@CONT";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3307_PROMT_NEWS_PREFACE_UPDATE_U", variable, m_value, sqldbtype, 3);
                    break;

                case 3308: //뉴스 머릿말 상세
                    variable[0] = "@SEQ_NO";
                    sqldbtype[0] = SqlDbType.Int;
    
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3308_PROMT_NEWS_PREFACE_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3311: // 해외투자 리스트 카운트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";
                    variable[2] = "@SDATE";
                    variable[3] = "@EDATE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3311_PROMT_FEG_LIST_COUNT_S", variable, m_value, sqldbtype, 4);
                    break;

                case 3312: // 해외투자 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";
                    variable[2] = "@SDATE";
                    variable[3] = "@EDATE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3312_PROMT_FEG_LIST_S", variable, m_value, sqldbtype, 4);
                    break;

                case 3313: // 해외투자 상세
                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3313_PROMT_FEG_INV_DETAIL_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3314: // 해외투자 입력
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@TTL";
                    variable[2] = "@CONT";
                    variable[3] = "@WRITER_ID";
                    variable[4] = "@IMG1";
                    variable[5] = "@IMG2";
                    variable[6] = "@IMG3";
                    variable[7] = "@IMG4";
                    variable[8] = "@IMG5";
                    variable[9] = "@VIDEO_URL";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.VarChar;
                    sqldbtype[9] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3314_PROMT_FEG_INV_DETAIL_I", variable, m_value, sqldbtype, 10);
                    break;

                case 3315: // 해외투자 수정
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@TTL";
                    variable[2] = "@CONT";
                    variable[3] = "@WRITER_ID";
                    variable[4] = "@IMG1";
                    variable[5] = "@IMG2";
                    variable[6] = "@IMG3";
                    variable[7] = "@IMG4";
                    variable[8] = "@IMG5";
                    variable[9] = "@VIDEO_URL";
                    variable[10] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.VarChar;
                    sqldbtype[9] = SqlDbType.VarChar;
                    sqldbtype[10] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3315_PROMT_FEG_INV_DETAIL_U", variable, m_value, sqldbtype, 11);
                    break;

                case 3316: // 뉴스 삭제
                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3316_PROMT_FEG_INV_DETAIL_D", variable, m_value, sqldbtype, 1);
                    break;

                case 3317: //해외자원투자 머릿말 등록
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@TTL";
                    variable[2] = "@CONT";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3317_PROMT_FEG_INV_PREFACE_UPDATE_U", variable, m_value, sqldbtype, 3);
                    break;

                case 3318: //해외자원투자 머릿말 상세
                    variable[0] = "@SEQ_NO";
                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3318_PROMT_FEG_INV_PREFACE_S", variable, m_value, sqldbtype, 1);
                    break;    
                
                #endregion

                #region Admin 투자 쿼리구역 (쿼리넘버:3401 ~ 3499)

                case 3411: // IR자료 리스트 카운트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@LANG_CD";
                    variable[2] = "@TITLE";
                    variable[3] = "@SDATE";
                    variable[4] = "@EDATE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3411_INV_IR_LIST_COUNT_S", variable, m_value, sqldbtype, 5);
                    break;

                case 3412: // IR자료 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@LANG_CD";
                    variable[2] = "@TITLE";
                    variable[3] = "@SDATE";
                    variable[4] = "@EDATE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3412_INV_IR_LIST_S", variable, m_value, sqldbtype, 5);
                    break;



                case 3413: // IR자료 상세
                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3413_INV_IR_DETAIL_S", variable, m_value, sqldbtype, 1);
                    break;
                
                case 3414: // IR자료 입력
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@TTL";
                    variable[2] = "@CONT";
                    variable[3] = "@WRITER_ID";
                    variable[4] = "@IMG1";
                    variable[5] = "@IMG2";
                    variable[6] = "@IMG3";
                    variable[7] = "@IMG4";
                    variable[8] = "@IMG5";
                    variable[9] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.VarChar;
                    sqldbtype[9] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("[USP_ADMIN_3414_INV_IR_DETAIL_I]", variable, m_value, sqldbtype, 10);
                    break;

                case 3415: // IR자료 수정
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@TTL";
                    variable[2] = "@CONT";
                    variable[3] = "@WRITER_ID";
                    variable[4] = "@IMG1";
                    variable[5] = "@IMG2";
                    variable[6] = "@IMG3";
                    variable[7] = "@IMG4";
                    variable[8] = "@IMG5";
                    variable[9] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.VarChar;
                    sqldbtype[9] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3415_INV_IR_DETAIL_U", variable, m_value, sqldbtype, 10);
                    break;

                case 3416: // IR자료 삭제

                    variable[0] = "@SEQ_NO";
                    
                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3416_INV_IR_DETAIL_D", variable, m_value, sqldbtype, 1);
                    break;

                case 3421: // 재무상태표 및 재무상태표 데이터

                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3421_INV_FIN_DTL_LIST_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3422: // 재무상태표 및 재무상태표 데이터 삭제

                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3422_INV_FIN_DTL_D", variable, m_value, sqldbtype, 1);
                    break;

                case 3423: // 재무상태 입력

                    variable[0] = "@SEQ_NO";
                    variable[1] = "@FIRST_COL";
                    variable[2] = "@SECOND_COL";
                    variable[3] = "@THIRD_COL";
                    variable[4] = "@WRITER_ID";
                    variable[5] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3423_INV_FIN_DTL_I", variable, m_value, sqldbtype, 6);
                    break;

                case 3425: // 재무상태 데이터 입력

                    variable[0] = "@SUBJECT_CD";
                    variable[1] = "@LANG_CD";
                    variable[2] = "@ATC_NM";
                    variable[3] = "@L_ATC_AMTL";
                    variable[4] = "@C_ATC_AMT";
                    variable[5] = "@R_ATC_AMT";
                    variable[6] = "@WRITER_ID";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3425_INV_FIN_DTL_DATA_I", variable, m_value, sqldbtype, 7);
                    break;

                case 3431: //손익계산서 데이터

                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3431_INV_PROAL_CALC_LIST_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3432: //손익계산서 데이터 헤더 입력

                    variable[0] = "@SEQ_NO";
                    variable[1] = "@LANG_CD";
                    variable[2] = "@FLAGB";
                    variable[3] = "@REG_DAY";
                    variable[4] = "@WRITER_ID";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3432_INV_PROAL_CALC_U", variable, m_value, sqldbtype, 5);
                    break;

                case 3433: //손익계산서 데이터 헤더 입력

                    variable[0] = "@LANG_CD";
                    variable[1] = "@ATC_NM";
                    variable[2] = "@FIRST_COL";
                    variable[3] = "@SECOND_COL";
                    variable[4] = "@THIRD_COL";
                    variable[5] = "@WRITER_ID";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3433_INV_PROAL_CALC_I", variable, m_value, sqldbtype, 6);
                    break;

                case 3434: //손익계산서 삭제

                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3434_INV_PROAL_CALC_D", variable, m_value, sqldbtype, 1);
                    break;

                case 3441: //주식 발행 리스트
                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3441_INV_STOK_PUB_LIST_S", variable, m_value, sqldbtype, 1);

                    break;

                case 3442: //주식 발행 입력
                    variable[0] = "@STOK_TYPE_CD";
                    variable[1] = "@PUB_STOK_TOTAL_CNT";
                    variable[2] = "@FACE_TOTAL_AMT";
                    variable[3] = "@REMARK";
                    variable[4] = "@WRITER_ID";
                    variable[5] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3442_INV_STOK_PUB_I", variable, m_value, sqldbtype, 6);

                    break;

                case 3443: //주식 발행 삭제
                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3443_INV_STOK_PUB_D", variable, m_value, sqldbtype, 1);
                    break;


                case 3451: //주주 구성 리스트
                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3451_INV_STO_RATIO_LIST_S", variable, m_value, sqldbtype, 1);

                    break;

                 case 3452: // 주주구성 저장
                    variable[0] = "@NM";
                    variable[1] = "@REL";
                    variable[2] = "@STOK_TYPE_CD";
                    variable[3] = "@BASIC_STCK_CNT";
                    variable[4] = "@BASIC_SHARE_RATIO";
                    variable[5] = "@INC_STCK_CNT";
                    variable[6] = "@DECR_STCK_CNT";
                    variable[7] = "@END_TERM_STCK_CNT";
                    variable[8] = "@END_TERM_SHARE_RATIO";
                    variable[9] = "@WRITER_ID";
                    variable[10] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.VarChar;
                    sqldbtype[9] = SqlDbType.VarChar;
                    sqldbtype[10] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3452_INV_STO_RATIO_I", variable, m_value, sqldbtype, 11);
                    break;


                 case 3453: // 주주구성 삭제
                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3453_INV_STO_RATIO_D", variable, m_value, sqldbtype, 1);
                    break;

                case 3454: // 주주구성 계 입력
                    variable[0] = "@T_STOK_TYPE_CD";
                    variable[1] = "@T_BASIC_STCK_CNT";
                    variable[2] = "@T_BASIC_SHARE_RATIO";
                    variable[3] = "@T_INC_STCK_CNT";
                    variable[4] = "@T_DECR_STCK_CNT";
                    variable[5] = "@T_END_TERM_STCK_CNT";
                    variable[6] = "@T_END_TERM_SHARE_RATIO";
                    variable[7] = "@WRITER_ID";
                    variable[8] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3454_INV_T_STO_RATIO_I", variable, m_value, sqldbtype, 9);
                    break;
                    
                case 3461: // 자기주식 리스트
                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3461_INV_TRESTOCK_LIST_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3462: // 자기주식 저장
                    variable[0] = "@TYPE_CD";
                    variable[1] = "@STO_CNT";
                    variable[2] = "@STO_RATIO";
                    variable[3] = "@STOK_CNT";
                    variable[4] = "@STOK_RATIO";
                    variable[5] = "@REMARK";
                    variable[6] = "@WRITER_ID";
                    variable[7] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3462_INV_TRESTOCK_I", variable, m_value, sqldbtype, 8);
                    break;

                case 3463: // 자기주식 삭제
                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3463_INV_TRESTOCK_D", variable, m_value, sqldbtype, 1);
                    break;

                case 3471: // 공고사항 리스트 카운트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@SEARCH_TYPE";
                    variable[2] = "@SEARCH_CONT";
                    variable[3] = "@SDATE";
                    variable[4] = "@EDATE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3471_INV_NOTICE_LIST_COUNT_S", variable, m_value, sqldbtype, 5);
                    break;

                case 3472: // 공고사항 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@SEARCH_TYPE";
                    variable[2] = "@SEARCH_CONT";
                    variable[3] = "@SDATE";
                    variable[4] = "@EDATE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3472_INV_NOTICE_LIST_S", variable, m_value, sqldbtype, 5);
                    break;

                case 3473: // 채용공고 머릿말
                    variable[0] = "@SEQ_NO";
                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3473_INV_NOTICE_PREFACE_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3474: // 채용공고 머릿말 등록
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@TTL";
                    variable[2] = "@CONT";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3474_INV_NOTICE_PREFACE_UPDATE_U", variable, m_value, sqldbtype, 3);
                    break;

                case 3475: // 채용공고 상세
                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3475_INV_NOTICE_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3476: // 채용공고 입력
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@TTL";
                    variable[2] = "@CONT";
                    variable[3] = "@IMG1";
                    variable[4] = "@IMG2";
                    variable[5] = "@IMG3";
                    variable[6] = "@IMG4";
                    variable[7] = "@IMG5";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("[USP_ADMIN_3476_INV_NOTICE_DETAIL_I]", variable, m_value, sqldbtype, 8);
                    break;

                case 3477: // 채용공고 수정
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@TTL";
                    variable[2] = "@CONT";
                    variable[3] = "@IMG1";
                    variable[4] = "@IMG2";
                    variable[5] = "@IMG3";
                    variable[6] = "@IMG4";
                    variable[7] = "@IMG5";
                    variable[8] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3477_INV_NOTICE_DETAIL_U", variable, m_value, sqldbtype, 9);
                    break;

                case 3478: // IR자료 삭제

                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3478_INV_NOTICE_DETAIL_D", variable, m_value, sqldbtype, 1);
                    break;        

                #endregion

                #region Admin 채용 쿼리구역 (쿼리넘버:3501 ~ 3599)

                case 3511: // 채용공고 카운트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";
                    variable[2] = "@SDATE";
                    variable[3] = "@EDATE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3511_RCM_NOTICE_LIST_COUNT_S", variable, m_value, sqldbtype, 4);
                    break;

                case 3512: // 채용공고 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";
                    variable[2] = "@SDATE";
                    variable[3] = "@EDATE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3512_RCM_NOTICE_LIST_S", variable, m_value, sqldbtype, 4);
                    break;

                case 3513: // 채용공고 머릿말
                    variable[0] = "@SEQ_NO";
                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3513_RCM_NOTICE_PREFACE_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3514: // 채용공고 머릿말 등록
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@TTL";
                    variable[2] = "@CONT";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3514_RCM_NOTICE_PREFACE_UPDATE_U", variable, m_value, sqldbtype, 3);
                    break;

                case 3515: // 채용공고 등록
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@SHOW_TP";
                    variable[2] = "@TTL";
                    variable[3] = "@CONT";
                    variable[4] = "@IMG1";
                    variable[5] = "@IMG2";
                    variable[6] = "@IMG3";
                    variable[7] = "@IMG4";
                    variable[8] = "@IMG5";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.Int;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3515_RCM_NOTICE_DETAIL_I", variable, m_value, sqldbtype, 9);
                    break;

                case 3516: // 채용공고 수정
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@SHOW_TP";
                    variable[2] = "@TTL";
                    variable[3] = "@CONT";
                    variable[4] = "@IMG1";
                    variable[5] = "@IMG2";
                    variable[6] = "@IMG3";
                    variable[7] = "@IMG4";
                    variable[8] = "@IMG5";
                    variable[9] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.Int;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.VarChar;
                    sqldbtype[9] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3516_RCM_NOTICE_DETAIL_U", variable, m_value, sqldbtype, 10);
                    break;

               case 3517: // 채용공고 삭제 

                    variable[0] = "@SEQ_NO";
                    
                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3517_RCM_NOTICE_DETAIL_D", variable, m_value, sqldbtype, 1);
                    break;

                case 3518: // 채용공고 상세

                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3518_RCM_NOTICE_DETAIL_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3521: // 채용등록 리스트 카운트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@SEARCH_TTL";
                    variable[2] = "@SEARCH_TYPE";
                    variable[3] = "@ADMIN_ID";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3521_RCM_REG_LIST_COUNT_S", variable, m_value, sqldbtype, 4);
                    break;

                case 3522: // 채용등록 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@SEARCH_TTL";
                    variable[2] = "@SEARCH_TYPE";
                    variable[3] = "@ADMIN_ID";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3522_RCM_REG_LIST_S", variable, m_value, sqldbtype, 4);
                    break;

                case 3523: // 채용등록 등록
                    variable[0] = "@RCM_TTL";
                    variable[1] = "@START_DATE";
                    variable[2] = "@END_DATE";
                    variable[3] = "@RCM_CD_REG";
                    variable[4] = "@RCM_DUTY_NO";
                    variable[5] = "@WRITER_ID";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.Int;
                    sqldbtype[5] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3523_RCM_REG_I", variable, m_value, sqldbtype, 6);
                    break;

                case 3524: // 채용등록 코드 등록
                    variable[0] = "@REG_SEQ_NO";
                    variable[1] = "@CODE";
                    variable[2] = "@MODE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3524_RCM_REG_CD_I", variable, m_value, sqldbtype, 3);
                    break;

                case 3525: // 채용등록 수정
                    variable[0] = "@RCM_TTL";
                    variable[1] = "@START_DATE";
                    variable[2] = "@END_DATE";
                    variable[3] = "@RCM_CD_REG";
                    variable[4] = "@RCM_DUTY_NO";
                    variable[5] = "@WRITER_ID";
                    variable[6] = "@REG_SEQ_NO";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.Int;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3525_RCM_REG_U", variable, m_value, sqldbtype, 7);
                    break;

                case 3526: // 채용등록 삭제
                    variable[0] = "@REG_SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3526_RCM_REG_D", variable, m_value, sqldbtype, 1);
                    break;

                case 3527: // 채용등록 코드 모두 삭제
                    variable[0] = "@REG_SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3527_RCM_REG_ALL_D", variable, m_value, sqldbtype, 1);
                    break;

                case 3528: // 채용등록 상세
                    variable[0] = "@REG_SEQ_NO";
                    variable[1] = "@ADMIN_ID";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3528_RCM_REG_DETAIL_S", variable, m_value, sqldbtype, 2);
                    break;

                case 3529: // 채용지원 리스트 수
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@REG_SEQ_NO";
                    variable[2] = "@CHI_NM";
                    variable[3] = "@SUCC_YN";
                    variable[4] = "@SUPPORT_DUTY_CD";
                    variable[5] = "@SUPPORT_TYPE_CD";
                    variable[6] = "@SUPPORT_CR_CD";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3529_RCM_SUPPORT_LIST_COUNT_S", variable, m_value, sqldbtype, 7);
                    break;

                case 3530: // 채용지원 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@REG_SEQ_NO";
                    variable[2] = "@CHI_NM";
                    variable[3] = "@SUCC_YN";
                    variable[4] = "@SUPPORT_DUTY_CD";
                    variable[5] = "@SUPPORT_TYPE_CD";
                    variable[6] = "@SUPPORT_CR_CD";
                    variable[7] = "@PAGE_SIZE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3530_RCM_SUPPORT_LIST_S", variable, m_value, sqldbtype, 8);
                    break;

                case 35300: // 채용지원 상세
                    variable[0] = "@SUPPORT_NO";
                    variable[1] = "@ADMIN_ID";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_35300_RCM_SUPPORT_DETAIL_S", variable, m_value, sqldbtype, 2);
                    break;

                case 35301: // 채용지원 상세 수정/삭제
                    variable[0] = "@SUPPORT_NO";
                    variable[1] = "@MODE";
                    variable[2] = "@SUCC_YN";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_35301_RCM_SUPPORT_DETAIL_U", variable, m_value, sqldbtype, 3);
                    break;

                case 3531: //FAQ 리스트 카운트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";
                    variable[2] = "@SDATE";
                    variable[3] = "@EDATE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3531_RCM_FAQ_LIST_COUNT_S", variable, m_value, sqldbtype, 4);
                    break;

                case 3532: //FAQ 리스트 
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";
                    variable[2] = "@SDATE";
                    variable[3] = "@EDATE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3532_RCM_FAQ_LIST_S", variable, m_value, sqldbtype, 4);
                    break;

                case 3533: //FAQ 상세
                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3533_RCM_FAQ_DETAIL_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3534: // FAQ 수정
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@TTL";
                    variable[2] = "@CONT";
                    variable[3] = "@WRITER_ID";
                    variable[4] = "@IMG1";
                    variable[5] = "@IMG2";
                    variable[6] = "@IMG3";
                    variable[7] = "@IMG4";
                    variable[8] = "@IMG5";
                    variable[9] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.VarChar;
                    sqldbtype[9] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3534_RCM_FAQ_DETAIL_U", variable, m_value, sqldbtype, 10);
                    break;

                case 3535: // FAQ 입력
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@TTL";
                    variable[2] = "@CONT";
                    variable[3] = "@WRITER_ID";
                    variable[4] = "@IMG1";
                    variable[5] = "@IMG2";
                    variable[6] = "@IMG3";
                    variable[7] = "@IMG4";
                    variable[8] = "@IMG5";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;
                    sqldbtype[8] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("[USP_ADMIN_3535_RCM_FAQ_DETAIL_I]", variable, m_value, sqldbtype, 9);
                    break;

                case 3536: // FAQ 삭제
                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3536_RCM_FAQ_DETAIL_D", variable, m_value, sqldbtype, 1);
                    break;

                #endregion 
               
                #region Admin 고객관리 쿼리구역 (쿼리넘버:3601 ~ 3699)

                case 3611: // 제품문의 카운트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";
                    variable[2] = "@SDATE";
                    variable[3] = "@EDATE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3611_CUST_PROD_INQ_LIST_COUNT_S", variable, m_value, sqldbtype, 4);
                    break;

                case 3612: // 제품문의 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";
                    variable[2] = "@SDATE";
                    variable[3] = "@EDATE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3612_CUST_PROD_INQ_LIST_S", variable, m_value, sqldbtype, 4);
                    break;

                case 3613: // 제품문의 상세
                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3613_CUST_PROD_INQ_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3614: // 제품문의 삭제
                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3614_CUST_PROD_INQ_D", variable, m_value, sqldbtype, 1);
                    break;

                case 3621: // 제휴제안 카운트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";
                    variable[2] = "@SDATE";
                    variable[3] = "@EDATE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3621_CUST_ALLACE_SUGT_LIST_COUNT_S", variable, m_value, sqldbtype, 4);
                    break;

                case 3622: // 제휴제한 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";
                    variable[2] = "@SDATE";
                    variable[3] = "@EDATE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("[USP_ADMIN_3622_CUST_ALLACE_SUGT_LIST_S]", variable, m_value, sqldbtype, 4);
                    break;

                case 3623: //제휴제한 상세
                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3623_CUST_ALLACE_SUGT_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3624: // 제휴제한 삭제
                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3624_CUST_ALLACE_SUGT_D", variable, m_value, sqldbtype, 1);
                    break;


                #endregion        

                #region Admin 코드관리 쿼리구역 (쿼리넘버:3700 ~ 3799)
                case 3700: // 코드 리스트
                    variable[0] = "@LANG_CD";
                    variable[1] = "@UPR_CATG_NO";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3700_CODE_LIST_S", variable, m_value, sqldbtype, 2);
                    break;

                case 3701: // 코드 상세 조회
                    variable[0] = "@LANG_CD";
                    variable[1] = "@CATG_NO";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.Int;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3701_CODE_DETAIL_S", variable, m_value, sqldbtype, 2);
                    break;

                case 3702: // 코드 입력
                    variable[0] = "@LANG_CD";
                    variable[1] = "@UPR_CATG_NO";
                    variable[2] = "@DEPTH";
                    variable[3] = "@SORT_ORD";
                    variable[4] = "@WRITER_ID";
                    variable[5] = "@CATG_NM";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.Int;
                    sqldbtype[2] = SqlDbType.Int;
                    sqldbtype[3] = SqlDbType.Int;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3702_CODE_DETAIL_I", variable, m_value, sqldbtype, 6);
                    break;

                case 3703: // 코드 수정
                    variable[0] = "@LANG_CD";
                    variable[1] = "@UPR_CATG_NO";
                    variable[2] = "@DEPTH";
                    variable[3] = "@SORT_ORD";
                    variable[4] = "@WRITER_ID";
                    variable[5] = "@CATG_NM";
                    variable[6] = "@CATG_NO";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.Int;
                    sqldbtype[2] = SqlDbType.Int;
                    sqldbtype[3] = SqlDbType.Int;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.Int;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3703_CODE_DETAIL_U", variable, m_value, sqldbtype, 7);
                    break;

                case 3704: // 코드 삭제
                    variable[0] = "@LANG_CD";
                    variable[1] = "@CATG_NO";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.Int;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3704_CODE_DETAIL_D", variable, m_value, sqldbtype, 2);
                    break;

                #endregion

                #region Admin 계정관리 쿼리구역 (쿼리넘버:3800 ~ 3899)
                case 3800:

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3800_ACCOUNT_LIST_S", variable, m_value, sqldbtype, 0);
                    break;

                case 3801: // 계정 상세 조회
                    variable[0] = "@ADMIN_ID";

                    sqldbtype[0] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3801_ACCOUNT_DETAIL_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3802: // 계정 입력
                    variable[0] = "@ADMIN_ID";
                    variable[1] = "@ADMIN_NM";
                    variable[2] = "@ADMIN_PW";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3802_ACCOUNT_DETAIL_I", variable, m_value, sqldbtype, 3);
                    break;

                case 3803: // 계정 수정
                    variable[0] = "@ADMIN_ID";
                    variable[1] = "@ADMIN_NM";
                    variable[2] = "@ADMIN_PW";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3803_ACCOUNT_DETAIL_U", variable, m_value, sqldbtype, 3);
                    break;

                case 3804: // 계정 삭제
                    variable[0] = "@ADMIN_ID";

                    sqldbtype[0] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3804_ACCOUNT_DETAIL_D", variable, m_value, sqldbtype, 1);
                    break;

                case 3805: // 매뉴 권한 조회
                    variable[0] = "@ADMIN_ID";

                    sqldbtype[0] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3805_ACCOUNT_MENU_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3806: // 매뉴 권한 부여
                    variable[0] = "@ADMIN_ID";
                    variable[1] = "@MENU_NO";
                    variable[2] = "@WRITER_ID";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.Int;
                    sqldbtype[2] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3806_ACCOUNT_MENU_U", variable, m_value, sqldbtype, 3);
                    break;

                case 3807: // 매뉴 권한 모두 삭제
                    variable[0] = "@ADMIN_ID";
                    sqldbtype[0] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3807_ACCOUNT_MENU_ALL_D", variable, m_value, sqldbtype, 1);
                    break;

                case 3811:

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3811_DUTY_LIST_S", variable, m_value, sqldbtype, 0);
                    break;

                case 3812:
                    variable[0] = "@DUTY_NO";
                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3812_DUTY_DETAIL_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3813:
                    variable[0] = "@DUTY_NM";
                    variable[1] = "@DEPTH";
                    variable[2] = "@SORT_ORD";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.Int;
                    sqldbtype[2] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3813_DUTY_DETAIL_I", variable, m_value, sqldbtype, 3);
                    break;

                case 3814:
                    variable[0] = "@DUTY_NM";
                    variable[1] = "@DEPTH";
                    variable[2] = "@SORT_ORD";
                    variable[3] = "@DUTY_NO";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.Int;
                    sqldbtype[2] = SqlDbType.Int;
                    sqldbtype[3] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3814_DUTY_DETAIL_U", variable, m_value, sqldbtype, 4);
                    break;

                case 3815:
                    variable[0] = "@DUTY_NO";
                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3815_DUTY_DETAIL_D", variable, m_value, sqldbtype, 1);
                    break;

                case 3821:

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3821_DUTY_DEPT_LIST_S", variable, m_value, sqldbtype, 0);
                    break;

                case 3823:
                    variable[0] = "@DUTY_NM";
                    variable[1] = "@DEPTH";
                    variable[2] = "@SORT_ORD";
                    variable[3] = "@UPR_DUTY_NO";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.Int;
                    sqldbtype[2] = SqlDbType.Int;
                    sqldbtype[3] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3813_DUTY_DETAIL_I", variable, m_value, sqldbtype, 4);
                    break;

                case 3824:
                    variable[0] = "@DUTY_NM";
                    variable[1] = "@DEPTH";
                    variable[2] = "@SORT_ORD";
                    variable[3] = "@DUTY_NO";
                    variable[4] = "@UPR_DUTY_NO";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.Int;
                    sqldbtype[2] = SqlDbType.Int;
                    sqldbtype[3] = SqlDbType.Int;
                    sqldbtype[4] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3814_DUTY_DETAIL_U", variable, m_value, sqldbtype, 5);
                    break;

                case 3826:
                    variable[0] = "@DUTY_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3826_DUTY_DEPT_AUTH_S", variable, m_value, sqldbtype, 1);
                    break;

                case 3827:
                    variable[0] = "@DUTY_NO";
                    variable[1] = "@ADMIN_ID";
                    variable[2] = "@AUTH_SUB_YN";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3827_DUTY_DEPT_AUTH_U", variable, m_value, sqldbtype, 3);
                    break;

                case 3828:
                    variable[0] = "@DUTY_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_ADMIN_3828_DUTY_DEPT_AUTH_ALL_D", variable, m_value, sqldbtype, 1);
                    break;

                #endregion

                #region MobileWeb 제품 쿼리구역 (쿼리넘버:2000 ~ 2099)

                case 2001:// 제품관리 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@LANG_CD";
                    variable[2] = "@CATG_NO1";
                    variable[3] = "@CATG_NO2";
                    variable[4] = "@PROD_TYPE_CD";
                    variable[5] = "@PROD_S_INIT_NM";
                    variable[6] = "@PROD_E_INIT_NM";
                    variable[7] = "@PROD_TAG";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;
                    sqldbtype[7] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2001_PROD_LIST_S", variable, m_value, sqldbtype, 8);
                    break;

                case 2002: // 제품관리 상세
                    variable[0] = "@LANG_CD";
                    variable[1] = "@PROD_CD";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2002_PROD_DETAIL_S", variable, m_value, sqldbtype, 2);
                    break;

                case 2003: // 카탈로그 제품
                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2003_PROD_CATAL_LIST_S", variable, m_value, sqldbtype, 1);
                    break;

                case 2004: // 카탈로그 상세
                    variable[0] = "@LANG_CD";
                    variable[1] = "@PROD_CD";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2004_PROD_CATAL_DETAIL_S", variable, m_value, sqldbtype, 2);
                    break;

                #endregion

                #region MobileWeb 홍보 쿼리구역 (쿼리넘버:2100 ~ 2199)

                case 2101: // 뉴스 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2101_PROMT_NEWS_LIST_S", variable, m_value, sqldbtype, 2);
                    break;

                case 2102: // 뉴스 상세
                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2102_PROMT_NEWS_DETAIL_S", variable, m_value, sqldbtype, 1);
                    break;

                case 2111: // 해외투자 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2111_PROMT_FEG_LIST_S", variable, m_value, sqldbtype, 2);
                    break;

                case 2112: // 해외투자 상세
                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2112_PROMT_FEG_DETAIL_S", variable, m_value, sqldbtype, 1);
                    break;

                #endregion

                #region MobileWeb 투자 쿼리구역 (쿼리넘버:2200 ~ 2299)

                case 2201: // 경영정보 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";
                    variable[2] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2201_INV_IR_LIST_S", variable, m_value, sqldbtype, 3);
                    break;

                case 2202: // 경영정보 상세
                    variable[0] = "@SEQ_NO";
                    variable[1] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2202_INV_IR_DETAIL_S", variable, m_value, sqldbtype, 2);
                    break;

                case 2211: // 재무상태표 및 재무상태표 데이터

                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2211_INV_FIN_DTL_LIST_S", variable, m_value, sqldbtype, 1);
                    break;


                case 2212: //손익계산서 데이터

                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2212_INV_PROAL_CALC_LIST_S", variable, m_value, sqldbtype, 1);
                    break;

                case 2221: //주식 발행 리스트
                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2221_INV_STOK_PUB_LIST_S", variable, m_value, sqldbtype, 1);

                    break;

                case 2222: //주주 구성 리스트
                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2222_INV_STO_RATIO_LIST_S", variable, m_value, sqldbtype, 1);

                    break;

                case 2223: // 자기주식 리스트
                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2223_INV_TRESTOCK_LIST_S", variable, m_value, sqldbtype, 1);
                    break;

                case 2231: // 공고사항 리스트
                    variable[0] = "@NOW_PAGE";
                    variable[1] = "@TITLE";

                    sqldbtype[0] = SqlDbType.Int;
                    sqldbtype[1] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2231_INV_NOTICE_LIST_S", variable, m_value, sqldbtype, 2);
                    break;

                case 2232: // 공고사항 상세
                    variable[0] = "@SEQ_NO";

                    sqldbtype[0] = SqlDbType.Int;

                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2232_INV_NOTICE_DETAIL_S", variable, m_value, sqldbtype, 1);
                    break;

                #endregion

                #region MobileWeb 고객 쿼리구역 (쿼리넘버:2300 ~ 2399)

                case 2300:// 제품문의 등록
                    variable[0] = "@TTL";
                    variable[1] = "@WRITER_NM";
                    variable[2] = "@TEL";
                    variable[3] = "@EMAIL";
                    variable[4] = "@CONT";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2300_CUST_PROD_INQ_I", variable, m_value, sqldbtype, 5);
                    break;

                case 2310:// 제휴제안 등록
                    variable[0] = "@WRITER_NM";
                    variable[1] = "@BUSIN_NM";
                    variable[2] = "@POSIT";
                    variable[3] = "@TEL";
                    variable[4] = "@EMAIL";
                    variable[5] = "@TTL";
                    variable[6] = "@CONT";

                    sqldbtype[0] = SqlDbType.VarChar;
                    sqldbtype[1] = SqlDbType.VarChar;
                    sqldbtype[2] = SqlDbType.VarChar;
                    sqldbtype[3] = SqlDbType.VarChar;
                    sqldbtype[4] = SqlDbType.VarChar;
                    sqldbtype[5] = SqlDbType.VarChar;
                    sqldbtype[6] = SqlDbType.VarChar;

                    // 마지막 인자값 항상 확인(파라미터 총수 임)
                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2310_CUST_ALLACE_SUGT_I", variable, m_value, sqldbtype, 7);
                    break;

                #endregion

                #region MobileWeb 메인 쿼리구역 (쿼리넘버:2400 ~ 2499)

                case 2400: // 메인 조회
                    variable[0] = "@LANG_CD";

                    sqldbtype[0] = SqlDbType.VarChar;

                    ds = command.ExecuteDataSetSecure("USP_MOBILE_2400_MAIN_S", variable, m_value, sqldbtype, 1);
                    break;

                #endregion
            }
            return ds;

            #endregion
        }


        /// <summary>
        /// 프로시져 인자값 셋팅
        /// </summary>
        /// <param name="data">string화된  프로시져 인자</param>
        private void ParsingArg(string data)
        {
            ClearArg();
            m_value = data.Split(CConst.DB_PARAM_CHAR_DELIMITER);
            variableLength = data.Split(CConst.DB_PARAM_CHAR_DELIMITER).Length;
        }

        /// <summary>
        /// 변수(프로시져 인자값) 초기화
        /// </summary>
        private void ClearArg()
        {
            for (int i = 0; i < m_value.GetLength(0); i++)
            {
                m_value[i] = "";
            }
        }
    }
}