<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.qms.user.vo.UserVO"%>

<%!
  boolean isActive(String[] urlPath, String path, int idx) {
  	 try{
	  	if(path.indexOf(urlPath[idx]+".jsp")>0){
	  		return true;
	  	} 
  	 return false;
  	 }catch(Exception e){
  		 return false;
  	 }
  }
  
  public boolean isShow(int show, int start, int end){
	  if(show>=start && show<=end){
	  	  return true;
	  }else{
		  return false;
	  }
  }
%>

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

String path = request.getRequestURI();	//현재경로
System.out.println(path);
String[] urlPath = {"aprv02","aprv01","notice01","notice02","item01","bom01","rcv01","order01","pt01","plan01","plan02","plan04"};	//jsp 파일명 배열
int[]    showArr = {3,5,7};
int showIdx = 0;
for(int i=0;i<urlPath.length;i++){
	if(isActive(urlPath, path, i)){
		showIdx = i;
	}
}

%>




  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">QMS</span>
      </a>
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
            <span class="d-none d-md-block dropdown-toggle ps-2"><%=userName%>(<%=userPosition%>)</span>
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
        <a class="nav-link collapse" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>전자결재</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse <%if(isShow(showIdx,0,3)){ %>show<% } %>" data-bs-parent="#sidebar-nav">
          <li>
            <a href="/approve/search"><i class="bi bi-circle"></i><span>기안서 조회</span>
            </a>
          </li>
          <li>
            <a href="/approve/write"><i class="bi bi-circle"></i><span>기안서 작성</span>
            </a>
          </li>
          <li>
            <a href="/board/list"><i class="bi bi-circle"></i><span>공지 사항</span>
            </a>
          </li>
          <li>
            <a href="/board/list2"><i class="bi bi-circle"></i><span>일정 관리</span>
            </a>
          </li>
          
        </ul>
      </li><!-- End Components Nav -->

      <li class="nav-item">
        <a class="nav-link " data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>자재관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse <%if(isShow(showIdx,4,5)){ %>show<% } %>" data-bs-parent="#sidebar-nav">
          <li>
            <a href="/item/itemList"><i class="bi bi-circle"></i><span>제품 관리</span>
            </a>
          </li>
          <li>
            <a href="/bom/bomList"> 
              <i class="bi bi-circle"></i><span>BOM 조회</span>
            </a>
          </li>
          
         </ul>
      </li><!-- End Forms Nav -->

      <li class="nav-item">
        <a class="nav-link" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>입고관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse <%if(isShow(showIdx,6,7)){ %>show<% } %>" data-bs-parent="#sidebar-nav">
          
          <li>
            <a href="/receive/list">
              <i class="bi bi-circle"></i><span>입고 등록/조회</span>
            </a>
          </li>
          
          <li>
            <a href="/order/list">
              <i class="bi bi-circle"></i><span>품목 주문조회</span>
            </a>
          </li>
        </ul>
      </li><!-- End Tables Nav -->

      <li class="nav-item">
        <a class="nav-link" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-bar-chart"></i><span>거래처관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="charts-nav" class="nav-content collapse <%if(isShow(showIdx,8,8)){ %>show<% } %>" data-bs-parent="#sidebar-nav">
          <li>
            <a href="/partner/list">
              <i class="bi bi-circle"></i><span>거래처 등록/조회</span>
            </a>
          </ul>
      </li><!-- End Charts Nav -->

      <li class="nav-item">
        <a class="nav-link" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-gem"></i><span>생산관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse <%if(isShow(showIdx,9,11)){ %>show<% } %>" data-bs-parent="#sidebar-nav">
          <li>
            <a href="/plan/planList">
              <i class="bi bi-circle"></i><span>생산계획관리</span>
            </a>
          </li>
          <li>
            <a href="/plan/searchPlan">
              <i class="bi bi-circle"></i><span>생산계획확인</span>
            </a>
          </li>
          <li>
            <a href="/plan/productPerform">
              <i class="bi bi-circle"></i><span>생산실적조회</span>
            </a>
          </li>
        
        </ul>
      </li><!-- End Icons Nav -->

    </ul>

  </aside><!-- End Sidebar-->
  
  <form id='logoutform'>
 
  </form>
  
  <script>
  
    function logout(){
  		call_server(logoutform, "/logout", chkLogOut);
  	}
  	
  	function chkLogOut(){
  		location.href='/login';
  	}
  </script>