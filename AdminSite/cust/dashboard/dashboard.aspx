<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="AdminSite.dashboard.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">

	<div class="wrap_box">

		<div class="dash_box">
			<h2>빠른 실행</h2>
			<span>* 자주 사용하는 메뉴를 등록하여 바로 이동 합니다.</span> <a href="#" id="pop_qedit" class="btn btn-mini btn-inverse">메뉴편집</a>

			<div class="btn_box">
				<button type="button" class="btn btn-info">서비스- 검색설정</button>
				<button type="button" class="btn btn-info">게시판 - 공지사항</button>
				<button type="button" class="btn btn-info">게시판 - 코멘트</button>
				<button type="button" class="btn btn-info">모바일 - 1:1 채팅</button>
				<button type="button" class="btn btn-info">소모품 - 소모품 관리</button>
				<button type="button" class="btn btn-info">통계 - 방문자 통계</button>
				<button type="button" class="btn btn-info">모바일 - 문의 게시판</button>
				<button type="button" class="btn btn-info">회원 - 일반 회원</button>
				<button type="button" class="btn btn-info">회원 - SMS 발송</button>
				<button type="button" class="btn btn-info">회원 - 푸시 메시지</button>
			</div>
		</div>

	</div><!--//  wrap_box -->


	<!-- POPUP - Quick Edit -->
	<div class="popup popup_qedit" style="display:none; ">
		<div class="pop_title clearfix">
			<h2>빠른 실행 집</h2>
			<a href="#" class="pop_close ico_close"><img src="../common/images/close_button.png" alt="창닫기" /></a>
		</div>

		<div class="sel_wrap">
			<h3>[전체 메뉴]</h3>
			<div class="select">
				<div class="m_row">
					<span class="d1">시스템 관리</span> <span class="d2">시스템 계정</span>
				</div>
				<div class="m_row">
					<span class="d1">&nbsp;</span> <span class="d2">호스팅 정보</span>
				</div>
				<div class="m_row select_row">
					<span class="d1">서비스 관리</span> <span class="d2">주문설정</span>
				</div>
				<div class="m_row">
					<span class="d1">&nbsp;</span> <span class="d2">택배비 설정</span>
				</div>
				<div class="m_row">
					<span class="d1">&nbsp;</span> <span class="d2">포인트 설정</span>
				</div>
				<div class="m_row">
					<span class="d1">&nbsp;</span> <span class="d2">검색 설정</span>
				</div>
				<div class="m_row">
					<span class="d1">게시판 관리</span> <span class="d2">공지사항</span>
				</div>
				<div class="m_row">
					<span class="d1">&nbsp;</span> <span class="d2">FAQ</span>
				</div>
				<div class="m_row">
					<span class="d1">&nbsp;</span> <span class="d2">코멘트</span>
				</div>
				<div class="m_row">
					<span class="d1">&nbsp;</span> <span class="d2">리뷰</span>
				</div>
				<div class="m_row">
					<span class="d1">&nbsp;</span> <span class="d2">도움말</span>
				</div>
				<div class="m_row">
					<span class="d1">&nbsp;</span> <span class="d2">이용약관</span>
				</div>
			</div>
		</div>
		<div class="center_wrap">
			<button type="button" class="btn">추가 &gt;&gt;</button><br /><br />
			<button type="button" class="btn">&lt;&lt; 제거</button>
		</div>
		<div class="sel_wrap">
			<h3>[빠른 실행]</h3>
			<div class="select">
				<div class="m_row">
					<span class="d1">시스템 관리</span> <span class="d2">시스템 계정</span>
				</div>
				<div class="m_row">
					<span class="d1">시스템 관리</span> <span class="d2">호스팅 정보</span>
				</div>
				<div class="m_row">
					<span class="d1">서비스 관리</span> <span class="d2">주문설정</span>
				</div>
				<div class="m_row select_row">
					<span class="d1">서비스 관리</span> <span class="d2">택배비 설정</span>
				</div>
				<div class="m_row">
					<span class="d1">&nbsp;</span> <span class="d2">포인트 설정</span>
				</div>
			</div>
		</div>

		<div class="btn_area clearfix">
			<div class="f_left">* 변경 내용을 반영하려면 반드시 '저장' 버튼을 눌러주세요.</div>
			<div class="f_right">
				<button class="btn btn-ok" type="button">저장</button>
				<button class="btn pop_close">닫기</button>
			</div>
		</div>

	</div><!-- EOT .popup -->
		
</div>
</div>
<!--//  CONTENT -->

</asp:Content>
