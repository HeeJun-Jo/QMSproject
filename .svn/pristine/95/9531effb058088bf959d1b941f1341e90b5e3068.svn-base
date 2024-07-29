<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="com.qms.user.vo.UserVO"%>
<%
UserVO user =(UserVO)session.getAttribute("MallUser");
String userName = "";
String userPosition = "";
String userDept = "";

if (user != null) {
	userName = user.getUserName();
    userPosition = user.getComName(); 
    userDept = user.getDeptName(); 
}
%>

  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">QMS</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
      <button type="button" onclick="Korean();">한국어</button>
	  <button type="button" onclick="English();">English</button>
    </div><!-- End Logo -->

    
    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <span class="d-none d-md-block dropdown-toggle ps-2"><%= userName %>(<%= userPosition %>)</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6><%= userName %></h6>
              <span><%= userDept %></span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            
            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="#" onclick="logout();">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->
    
  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span><spring:message code="message.menu.electricAprv"/></span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="/approve/search">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.aprvSearch"/></span>
            </a>
          </li>
          <li>
            <a href="/approve/write">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.aprvWrite"/></span>
            </a>
          </li>
          <li>
            <a href="/board/list">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.notice"/></span>
            </a>
          </li>
          
        </ul>
      </li><!-- End Components Nav -->

      <li class="nav-item">
        <a class="nav-link " data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span><spring:message code="message.menu.productManagement"/></span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse show" data-bs-parent="#sidebar-nav">
          <li>
            <a href="/item/itemList">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.itemManagement"/></span>
            </a>
          </li>
          <li>
            <a href="/bom/bomList" class="active">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.bomSearch"/></span>
            </a>
          </li>
          <li>
            <a href="forms-editors.html">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.partnerProductManagement"/></span>
            </a>
          </li>
          <li>
            <a href="forms-validation.html">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.processManagement"/></span>
            </a>
          </li>
        </ul>
      </li><!-- End Forms Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span><spring:message code="message.menu.receivingManagement"/></span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="tables-general.html">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.receivingReg"/></span>
            </a>
          </li>
          <li>
            <a href="/receive/receiveSearch">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.receivingSearch"/></span>
            </a>
          </li>
          <li>
            <a href="tables-data.html">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.stockManagement"/></span>
            </a>
          </li>
          <li>
            <a href="tables-data.html">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.stockSearch"/></span>
            </a>
          </li>
        </ul>
      </li><!-- End Tables Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-bar-chart"></i><span><spring:message code="message.menu.orderManagement"/></span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="charts-chartjs.html">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.partnerOrderManagement"/></span>
            </a>
          </li>
          <li>
            <a href="charts-apexcharts.html">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.freeReceivingManagement"/></span>
            </a>
          </li>
          <li>
            <a href="charts-echarts.html">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.productOrder"/></span>
            </a>
          </li>
          <li>
            <a href="charts-echarts.html">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.productFreeReceiving"/></span>
            </a>
          </li>
        </ul>
      </li><!-- End Charts Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-gem"></i><span><spring:message code="message.menu.productionManagement"/></span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="/plan/planList">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.productionPlanReg"/></span>
            </a>
          </li>
          <li>
            <a href="/plan/searchPlan">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.productionPlanSearch"/></span>
            </a>
          </li>
          <li>
            <a href="/plan/productPerform">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.productionPerformenceSearch"/></span>
            </a>
          </li>
          <li>
            <a href="icons-boxicons.html">
              <i class="bi bi-circle"></i><span><spring:message code="message.menu.materialRequirementsPlanning"/></span>
            </a>
          </li>
        </ul>
      </li><!-- End Icons Nav -->

    </ul>

  </aside><!-- End Sidebar-->
  
  <form id='logoutform'>
 
  </form>
  
  <script>
  	// 언어 설정
  	function Korean() {
	    var currentUrl = window.location.href;
	    var langParam = 'lang=ko';

	    // 이미 설정된 언어가 있는지 확인
	    if (currentUrl.indexOf('?') !== -1) {
	        // 있는 경우
	        currentUrl = currentUrl.substring(0, currentUrl.indexOf('?'));
	        currentUrl += '?' + langParam;
	    } else {
	        // 없는 경우
	        currentUrl += '?' + langParam;
	    }

	    window.location.href = currentUrl;
	}
  	function English() {
	    var currentUrl = window.location.href;
	    var langParam = 'lang=en';

	 // 이미 설정된 언어가 있는지 확인
	    if (currentUrl.indexOf('?') !== -1) {
	        // 있는 경우
	        currentUrl = currentUrl.substring(0, currentUrl.indexOf('?'));
	        currentUrl += '?' + langParam;
	    } else {
	        // 없는 경우
	        currentUrl += '?' + langParam;
	    }

	    window.location.href = currentUrl;
	}
  	
    function logout(){
  		call_server(logoutform, "/logout", chkLogOut);
  	}
  	
  	function chkLogOut(){
  		location.href='/login';
  	}
  </script>