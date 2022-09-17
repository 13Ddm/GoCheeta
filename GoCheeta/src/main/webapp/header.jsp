<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>


<!DOCTYPE html>
<html>

	<head>
	    <meta charset="ISO-8859-1">
	    <% String title = request.getParameter("title"); %>
	    <title><%= title %></title>
	    
	    <!-- Font Awesome -->
		<link
		  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
		  rel="stylesheet"
		/>
		<!-- Google Fonts -->
		<link
		  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
		  rel="stylesheet"
		/>
		<!-- MDB -->
		<link
		  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.4.0/mdb.min.css"
		  rel="stylesheet"
		/>
		
		<!-- Bootstrap CSS -->
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	    
	    <!-- Tailwind CSS -->
	    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">    
	    
	    <link rel="stylesheet" href="css/main.css" />
	    <link rel="stylesheet" href="css/header.css" />
	    <link rel="stylesheet" href="css/forms.css" />
	    <link rel="stylesheet" href="css/aboutus.css" />
	    
		<script src="https://kit.fontawesome.com/881e7597bb.js" crossorigin="anonymous"></script>
		<script
		  type="text/javascript"
		  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.4.0/mdb.min.js"
		></script>
		
	</head>

<body>
	
	<jsp:include page="nav.jsp"></jsp:include>
	
	<div class="container my-24">
	
	<%-- <%
		String alert = (String)request.getAttribute("alert");
	%>
	
	<c:if test="${alert != null}">
		<div class="w-full">
	        <div class="py-3 px-5 mb-4 bg-red-100 text-red-900 text-sm rounded-md border border-red-200 flex items-center"
	            role="alert">
	            <div class="w-4 mr-2">
	                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
	                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
	                        d="M20.618 5.984A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016zM12 9v2m0 4h.01" />
	                </svg>
	            </div>
	            <span>${alert} !</span>
	        </div>
	    </div>
	</c:if> --%>
	
	
	<script src="js/header.js"></script>