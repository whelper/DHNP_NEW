<%@ Page Language="C#" MasterPageFile="/en/EnSite.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MobileWeb.en.index" %>
<asp:Content ID="Content" ContentPlaceHolderID="HeadContent" runat="server">
    <header class="header main">
        <h1 class="logo"><span>대한뉴팜</span></h1>
        <button class="gnb_icon" id="j_iconOpen" onclick="return false;"><span>글로벌 네비게이션</span></button>
        <div class="search">
            <label for="f_headerSearch" class="acc-hidden"> 검색어 입력 </label>
            <input type="text" id="txt_search" runat="server"/>
            <asp:LinkButton ID="btn_Search" class="btn_headerSearch" runat="server" onClick="btnSearch_Click">검색</asp:LinkButton>
		</div>
	</header>

    <!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/en/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<section class="container main" style="text-align:center;">
		<h1 class="acc-hidden"> 메인 컨텐츠  </h1>	
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
				<li><a href="/en/pdt/pdt_human_new_list.aspx"><img src="<%=GetRoot() %>/en/common/images/indexPr_icon_01.png" alt="인체 의약품" /></a></li>
				<li><a href="/en/pdt/pdt_animal_new_list.aspx"><img src="<%=GetRoot() %>/en/common/images/indexPr_icon_02.png" alt="동물 의약품" /></a></li>
				<li><a href="/en/pdt/pdt_bio_badge_list.aspx"><img src="<%=GetRoot() %>/en/common/images/indexPr_icon_03.png" alt="바이오 공정소재" /></a></li>
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
                                    if (GetData(0, i, "LINK_URL").Equals("") == false)
                                    {
                                        // 링크가 있는 경우
                        %>
                        <li>
						    <a href="<%=GetData(2, i, "LINK_URL") %>">
                                <img src="<%=GetData(2, i, "FILE_PATH") %>" alt="" onerror="this.src='/en/common/images/products/new_no.jpg'" />
                            </a>
                        </li>
                        <%
                                    }
                                    else
                                    {
                                        // 링크 없음
                        %>
                        <li>
                                <img src="<%=GetData(2, i, "FILE_PATH") %>" alt="" onerror="this.src='/en/common/images/products/new_no.jpg'" />
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
 				<a href="/en/pdt/pdt_human_new_list.aspx"><span class="more_arrow">more</span></a>	                     
			</article>
			<!-- // 제품소개  -->
			<article class="news_info">
				<h1 class="acc-hidden">새소식과 주가정보</h1>	
 				<ul>
 					<li><strong>새소식 </strong>
 						<span><%=GetData(3, 0, "TTL")%></span>
 						<span class="more_arrow">more</span>
 					</li>
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
 					<li><a href="/en/intro/location.aspx"> <img src="/en/common/images/indexCus_icon_01.png" alt="Customer " ></a></li>
					<li><a href="/en/cust/inquire_list.aspx"> <img src="/en/common/images/indexCus_icon_02.png" alt="Customer" /></a></li>
 				</ul>                   
			</article> <!-- // products_go  -->
		</div> <!-- // content  -->
		
		<footer class="footer main">
		    <nav class="footer_nav">
			    <h1 class="acc-hidden"> 하단 메뉴  </h1>
			    <nav class="fnb ">
				    <ul> 
					    <li> <a href="/en/intro/location.aspx">Contact Us</a> </li>
					    <li> <a href="#tos">TOS</a> </li>
				    </ul>
			    </nav>
			    <p class="lnb"> 
				    <a href="/en/cust/inquire_list.aspx">Customer</a>  <span>|</span> 
				    <a href="/index.aspx">Korean</a>
			    </p>  	
		    </nav> 
		    <p class="copyright"> Copyright  &copy;  Daehan New Pharm Co.,Ltd </p>
	    </footer>
		
	</section> 
	<!-- // container main -->
</asp:Content>