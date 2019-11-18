<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MobileWeb.index" %>
<asp:Content ID="Content" ContentPlaceHolderID="HeadContent" runat="server">
    <header class="header main">
        <h1 class="logo"><span>대한뉴팜</span></h1>
		<div class="language"><a href="/en/index.aspx">English</a></div>
        <button class="gnb_icon" id="j_iconOpen" onclick="return false;"><span>글로벌 네비게이션</span></button>
        <div class="search">
            <label for="f_headerSearch" class="acc-hidden"> 검색어 입력 </label>
            <input type="text" id="txt_search" runat="server"/>
            <asp:LinkButton ID="btn_Search" class="btn_headerSearch" runat="server" onClick="btnSearch_Click">검색</asp:LinkButton>
		</div>
	</header>

	<!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/common/include/gnb.js"></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<section class="container main" style="text-align:center;">
		<h1 class="acc-hidden">메인 컨텐츠</h1>
		<!-- 롤링 배너  -->
		<div class="bxslider_box"> 
			<ul  id="slider1" >
                <% 
					if (GetDataTableCount(0) > 0)
					{
						// 이미지 존재
						for (int i = 0; i < GetDataTableCount(0); i++)
						{
							// 링크가 있는 경우
							if (GetData(0, i, "FILE_PATH").Equals("")) continue;
                %>
                <li>
                    <img src="<%=GetData(0, i, "FILE_PATH") %>" alt="" onerror="this.src='/common/images/index_visual_01.jpg'" />
                </li>
                <%
                           
                        }
                    }
                    else
                    {
                        // 등록된 이미지 없음
                %>
                <img src="" alt="등록된 이미지가 없습니다." title="#caption1" onerror="this.src='/common/images/index_visual_01.jpg'" />
                <% 
                    }
                %>
			</ul>
		</div>
		<!-- // 롤링 배너  -->

		<!--  인체의약품 /동물의약품/바이오공정소재  -->
		<article class="products_go">
			<h1 class="acc-hidden"> 제품소개 </h1>	
			<ul>
				<li><a href="/pdt/pdt_new_list.aspx?category=01&menu=0102"><img src="<%=GetRoot() %>/common/images/indexPr_icon_01.png" alt="인체 의약품" /></a></li>
				<li><a href="/pdt/pdt_new_list.aspx?category=02&menu=0202"><img src="<%=GetRoot() %>/common/images/indexPr_icon_02.png" alt="동물 의약품" /></a></li>
				<li><a href="/pdt/pdt_list.aspx?category=03&menu=0301"><img src="<%=GetRoot() %>/common/images/indexPr_icon_03.png" alt="바이오 공정소재" /></a></li>
			</ul>                
		</article> 
		<!--  //  인체의약품 /동물의약품/바이오공정소재  -->
		<div class="content  main">
			<!-- 제품소개  -->
			<article  id="slider2_btns"class="products_about">
				<h1> <span> 제품소개 </span> </h1>	
 				<ul  id="slider2" class="products_about_list bxslider">
                        <% 
                            if (GetDataTableCount(2) > 0)
                            {
                                // 이미지 존재
                                for (int i = 0; i < GetDataTableCount(2); i++)
                                {   
                                    if (GetData(2, i, "LINK_URL").Equals("") == false)
                                    {
                                        // 링크가 있는 경우
                        %>
                        <li>
						    <a href="/pdt/pdt_view.aspx?<%=GetData(2, i, "LINK_URL") %>">
                                <img src="<%=GetData(2, i, "FILE_PATH") %>" alt="" onerror="this.src='/common/images/products/new_no.jpg'" />
                            </a>
                        </li>
                        <%
                                    }
                                    else
                                    {
                                        // 링크 없음
                        %>
                        <li>
                                <img src="<%=GetData(2, i, "FILE_PATH") %>" alt="" onerror="this.src='/common/images/products/new_no.jpg'" />
                        </li>                        
                        <%
                                    }
                                }
                            }
                            else
                            {
                                // 등록된 이미지 없음
                        %>
                        <img src="" alt="등록된 이미지가 없습니다." title="#caption1" />
                        <% 
                            }
                        %>
 				</ul>
 				<a href="/pdt/pdt_new_list.aspx?category=01&menu=0102"><span class="more_arrow">more</span></a>	                     
			</article>
			<!-- // 제품소개  -->
			<article class="news_info">
				<h1 class="acc-hidden">새소식과 주가정보</h1>	
 				<ul>
 					<%--<li><strong>새소식 </strong>
 						<a href="/pr/pr_new_list.aspx" ><span><%=GetData(3, 0, "TTL")%></span></a>	 
 						<a href="/pr/pr_new_list.aspx"><span class="more_arrow">more</span></a>	
 					</li>--%>
 					<li>                      

                        <strong>주가정보</strong> 
                        <strong class="change_01 <%=NvCss %>"><%=Nv %></strong>
                        <strong class="won"><%=Nv %></strong>
                        <span class="change_02 <%=CvCss %>"><%=Cv %></span>
                        <span class="gray"><%=CrSign %><%=Cr %>% </span>
                
 					</li>
 				</ul>	                     
			</article>

			<article class="customer_go">
				<h1 class="acc-hidden"> <span> 고객센터 </span> </h1>	
 				<ul>
 					<li><a href="javascript:alert('모바일웹에서는 지원하실 수 없습니다.');"><img src="/common/images/indexCus_icon_01.png" alt="입사지원 " /></a></li>
 					<li><img src="/common/images/indexCus_icon_02.png" alt="고객전화 " /></li>
 				</ul>                   
			</article>
			
			<article class="customer_form">
				<h1 class="acc-hidden"> <span> 고객문의 </span> </h1>	
 				<ul>
 					<li><a href="/cust/inquire_list.aspx"><img src="/common/images/indexCus_icon_03.png" alt="고객문의 " /></a></li>
					<li><a href="https://www.dhnp.co.kr/micro/index.html" target="_blank"><img src="/common/images/indexCus_icon_04.png" alt="해외자원투자 " /></a></li>
 				</ul>                   
			</article>
			 <!-- // products_go  -->
		</div> <!-- // content  -->
		
		<!--begin popup
		<div class="pop_wrap" id="pop_wrap">
			<div id="popupContainer_01">
				<section class="popupContent_main1" style="width:100%;">
				<h1 class="acc-hidden">special Event</h1>
				<a href="#" target="_blank">
				</a><p class="popup_auto"><a href="#" target="_blank">
				</a><a href="http://goo.gl/rG3RUK" target="_blank"><img src="/common/images/pop_20180718.jpg" alt=""></a>
				</p>
		
				<div class="mainPopup_btn">
					<span class="mainPopup_btn">
					<span class="left">
					<input type="checkbox" id="pBox" value="Y">
					<label onclick="dayClose(1000); return false;">다시보지않기</label></span>
					<span class="right">
					<input type="checkbox" id="cBox" value="Y">
					<label onclick="dayClose(1); return false;">오늘 하루닫기</label>
					</span>
					</span>
				</div>
				<button class="btn_close" onclick="mainPopupClose(); return false;">닫기</button>
				</section>
			</div>
		</div>
		<!--end popup
		<!--begin popup
		<div class="pop_wrap" id="pop_wrap2">
			<div id="popupContainer_01">
				<section class="popupContent_main1" style="width:100%;">
					<h1 class="acc-hidden">special Event</h1>				
				<p class="popup_auto"><img src="/common/images/pop_20190624.jpg" alt=""></p>
		
				<div class="mainPopup_btn">
					<span class="mainPopup_btn">
					<span class="left">
					<input type="checkbox" id="pBox2" value="Y">
					<label onclick="dayClose2(1000); return false;">다시보지않기</label></span>
					<span class="right">
					<input type="checkbox" id="cBox2" value="Y">
					<label onclick="dayClose2(1); return false;">오늘 하루닫기</label>
					</span>
					</span>
				</div>
				<button class="btn_close" onclick="mainPopupClose2(); return false;">닫기</button>
				</section>
			</div>
		</div>
		end popup-->
		

	  <script type="text/javascript">
      $(window).load(function () {
       

		  $("#pBox").click(function () {
			  dayClose(1000);
		  });
		  $("#cBox").click(function () {
			  dayClose(1);
		  });
		  $("#pBox2").click(function () {
			  dayClose2(1000);
		  });
		  $("#cBox2").click(function () {
			  dayClose2(1);
		  });
      });


      

      // 팝업창 열기  
      function openPop(winName) {
          var blnCookie = getCookie(winName);
          var obj = eval("window." + winName);
          if (!blnCookie) {
			  $("#pop_wrap").fadeIn();    
          }
          else 
          {
              $("#pop_wrap").hide();
          }
      }

	  function openPop2(winName) {
          var blnCookie2 = getCookie(winName);
          var obj = eval("window." + winName);
          if (!blnCookie2) {
			  $("#pop_wrap2").fadeIn();    
          }
          else 
          {
              $("#pop_wrap2").hide();
          }
      }

      function dayClose(day) {
		  if (day == 1) {
			  $("#cBox").attr("checked", true);	
		  } else {
			  $("#pBox").attr("checked", true);	
		  }
		  if ($("#cBox").is(":checked") == true || $("#pBox").is(":checked") == true) {

            var todayDate = new Date();
            todayDate.setDate(todayDate.getDate() + day);
            document.cookie = "Notice" + "=" + escape("done") + "; path=/; expires=" + todayDate.toGMTString() + ";"
          }

          $("#pop_wrap").hide();
      }

	  function dayClose2(day) {
		  if (day == 1) {
			  $("#cBox2").attr("checked", true);	
		  } else {
			  $("#pBox2").attr("checked", true);	
		  }
		  if ($("#cBox2").is(":checked") == true || $("#pBox2").is(":checked") == true) {

            var todayDate = new Date();
            todayDate.setDate(todayDate.getDate() + day);
            document.cookie = "Notice2" + "=" + escape("done") + "; path=/; expires=" + todayDate.toGMTString() + ";"
          }

          $("#pop_wrap2").hide();
      }

      // 쿠키 가져오기  
      function getCookie(name) {
          var nameOfCookie = name + "=";
          var x = 0;
          while (x <= document.cookie.length) {
              var y = (x + nameOfCookie.length);
              if (document.cookie.substring(x, y) == nameOfCookie) {
                  if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
                      endOfCookie = document.cookie.length;
                  return unescape(document.cookie.substring(y, endOfCookie));
              }
              x = document.cookie.indexOf(" ", x) + 1;
              if (x == 0)
                  break;
          }
          return "";
      }

      // 팝업 닫기
      function mainPopupClose() {
          $("#pop_wrap").hide();
      }

	  function mainPopupClose2() {
          $("#pop_wrap2").hide();
      }

// 페이지 로딩시 실행 
      openPop("Notice");
	  openPop2("Notice2");
  </script>

		
		<footer class="footer main">
		    <nav class="footer_nav">
			    <h1 class="acc-hidden"> 하단 메뉴  </h1>
			    <nav class="fnb ">
				    <ul> 
					    <li> <a href="/intro/location.aspx"> 오시는 길 </a> </li>  
					    <li> <a href="#tos"> 이용약관  </a> </li>
						<li> <a href="#tos2"> 개인정보취급방침  </a> </li>
				    </ul>
			    </nav>
			    <p class="lnb"> 
				    <a href="/cust/inquire_list.aspx">Customer</a>
				    	
			    </p>  	
		    </nav> 
		    <p class="copyright"> Copyright  &copy;  Daehan New Pharm Co.,Ltd </p>
	    </footer>
		
	</section> 
	<!-- // container main -->
</asp:Content>