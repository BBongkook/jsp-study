<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%=pageContext.getAttribute("난") %>
<%=request.getAttribute("종인")%>
<%=session.getAttribute("backend") %>
<%=application.getAttribute("왜웃어") %>

<%
RequestDispatcher rd1 = request.getRequestDispatcher("/req/req3.jsp");
rd1.forward(request, response);

//response.sendRedirect("/jsp-study/req/req3.jsp");
%>

