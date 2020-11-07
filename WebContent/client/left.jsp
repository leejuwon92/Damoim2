<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HomePage</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/client/mypageleft.css">
<style type="text/css">
</style>
</head>
<body>

              
            <!-- Menu -->
            <nav id="menu">
              <ul>
              <li>
                <span class="k">회원정보설정</span>
                <ul>
                <li><a href="${pageContext.request.contextPath}/client/clientUpdate.jsp" target="center">회원정보수정</a></li>
                </ul>
                <li>
                  <span class="k">신청내역관리</span>
                  <ul>
                    <li><a href="${pageContext.request.contextPath}/client/MyCreateMoim.jsp" target="center">개설한 모임</a></li>
                    <li><a href="${pageContext.request.contextPath}/client/MyJoinMoim.jsp" target="center">신청한 모임</a></li>
                  </ul>
                </li>
                <li>
                  <span class="k">내모임 한눈에 보기</span>
                  <ul>
                    <li><a href="${pageContext.request.contextPath}/client/chart.jsp" target="center">한눈에 보기</a></li>
                  </ul>
                </li>
              </ul>
            </nav>

</body>
</html>
