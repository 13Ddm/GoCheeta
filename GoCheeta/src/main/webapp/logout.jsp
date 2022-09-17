<jsp:include page="header.jsp">
	<jsp:param name="title" value="Home"/>
</jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<%
	session.invalidate(); 
//remove these 2 lines
//from this

    //to this
%>
//add this line
<c:redirect url="/index.jsp"/>
<jsp:include page="footer.jsp"></jsp:include>