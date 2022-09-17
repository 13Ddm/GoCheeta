<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>

<nav class="bg-white shadow fixed top-0 w-full dark:bg-green-800 z-10">
  <div class="container px-6 py-3 mx-auto">
    <div class="md:flex md:items-center md:justify-between">
      <div class="flex items-center justify-between">
        <div class="text-xl font-semibold text-green-700">
          <a class="text-xl font-bold text-green-800 no-underline dark:text-white lg:text-2xl hover:text-green-700 dark:hover:text-green-300" href="index.jsp">GoCheeta Online Cab Service</a>
        </div>

        <!-- Mobile menu button -->
        <div class="flex md:hidden">
          <button type="button" class="text-green-500 dark:text-green-200 hover:text-green-600 dark:hover:text-green-400 focus:outline-none focus:text-green-600 dark:focus:text-green-400 toggle-menu" aria-label="toggle menu">
            <svg viewBox="0 0 24 24" class="w-6 h-6 fill-current">
              <path fill-rule="evenodd" d="M4 5h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2z"></path>
            </svg>
          </button>
        </div>
      </div>

      <!-- Mobile Menu open: "block", Menu closed: "hidden" -->
      <div class="flex-1 md:flex md:items-center md:justify-between hidden mobile-menu">
        <div class="flex flex-col -mx-4 md:flex-row md:items-center md:mx-8">
          <%
          	String role = (String)session.getAttribute("role");
          
          	if(session.getAttribute("id") == null){
          		out.print("<a href='login.jsp' class='px-2 py-1 mx-2 mt-2 text-sm font-medium text-green-700 transition-colors duration-200 transform rounded-md md:mt-0 dark:text-green-200 hover:bg-green-300 dark:hover:bg-green-700'>Request a Ride</a>");
          	}
          	else if(role == "customer"){
          		out.print("<a href='requestride.jsp' class='px-2 py-1 mx-2 mt-2 text-sm font-medium text-green-700 transition-colors duration-200 transform rounded-md md:mt-0 dark:text-green-200 hover:bg-green-300 dark:hover:bg-green-700'>Request a Ride</a>");
          	}
          %>
          <a href="aboutus.jsp" class="px-2 py-1 mx-2 mt-2 text-sm font-medium text-green-700 transition-colors duration-200 transform rounded-md md:mt-0 dark:text-green-200 hover:bg-green-300 dark:hover:bg-green-700">About Us</a>
          
          <%
				//allow access only if session exists
				role = (String)session.getAttribute("role");
			
				if(session.getAttribute("id") == null){
					//response.sendRedirect("/login");
					out.print("<a href='login.jsp' class='px-2 py-1 mx-2 mt-2 text-sm font-medium text-green-700 transition-colors duration-200 transform rounded-md md:mt-0 dark:text-green-200 hover:bg-green-300 dark:hover:bg-green-700'>Login</a>");
					out.print("<a href='register.jsp' class='px-2 py-1 mx-2 mt-2 text-sm font-medium text-green-700 transition-colors duration-200 transform rounded-md md:mt-0 dark:text-green-200 hover:bg-green-300 dark:hover:bg-green-700'>Register</a>");
				}
				else if(role == "admin"){
					out.print("<a href='adminDash.jsp' class='px-2 py-1 mx-2 mt-2 text-sm font-medium text-green-700 transition-colors duration-200 transform rounded-md md:mt-0 dark:text-green-200 hover:bg-green-300 dark:hover:bg-green-700'>Dashboard</a>");
					out.print("<a href='logout.jsp' class='px-2 py-1 mx-2 mt-2 text-sm font-medium text-green-700 transition-colors duration-200 transform rounded-md md:mt-0 dark:text-green-200 hover:bg-green-300 dark:hover:bg-green-700'>Logout</a>");
				}
				else if(role == "customer"){
					out.print("<a href='cusDash.jsp' class='px-2 py-1 mx-2 mt-2 text-sm font-medium text-green-700 transition-colors duration-200 transform rounded-md md:mt-0 dark:text-green-200 hover:bg-green-300 dark:hover:bg-green-700'>Dashboard</a>");
					out.print("<a href='logout.jsp' class='px-2 py-1 mx-2 mt-2 text-sm font-medium text-green-700 transition-colors duration-200 transform rounded-md md:mt-0 dark:text-green-200 hover:bg-green-300 dark:hover:bg-green-700'>Logout</a>");
				}
				else if(role == "driver"){
					out.print("<a href='driverDash.jsp' class='px-2 py-1 mx-2 mt-2 text-sm font-medium text-green-700 transition-colors duration-200 transform rounded-md md:mt-0 dark:text-green-200 hover:bg-green-300 dark:hover:bg-green-700'>Dashboard</a>");
					out.print("<a href='logout.jsp' class='px-2 py-1 mx-2 mt-2 text-sm font-medium text-green-700 transition-colors duration-200 transform rounded-md md:mt-0 dark:text-green-200 hover:bg-green-300 dark:hover:bg-green-700'>Logout</a>");
				}
			%>
			
            
            <%	      
	      		if(session.getAttribute("id") != null){
	      			/* out.print("<a class='mx-4 text-green-600 md:block dark:text-green-200 hover:text-green-700 dark:hover:text-green-400 focus:text-green-700 dark:focus:text-green-400 focus:outline-none' href=''>");
	      			out.print("    <svg xmlns='http://www.w3.org/2000/svg' class='h-6 w-6' fill='none' viewBox='0 0 24 24' stroke='currentColor'>");
	      			out.print("      <path stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1' />");
	      			out.print("    </svg>");
	      			out.print("</a>"); */
	      			
	      			out.print("<a href='' class='flex items-center focus:outline-none' aria-label='toggle profile dropdown'>");
	      			out.print("    <div class='w-8 h-8 overflow-hidden border-2 border-green-400 rounded-full'>");
	      			out.print("        <img src='https://avatars.dicebear.com/api/micah/" + session.getAttribute("fname") +".svg' class='object-cover w-full h-full' alt='avatar'>");
	      			out.print("    </div>");
	      			out.print("    <h3 class='mx-2 text-sm font-medium text-green-700 dark:text-green-200'>" + session.getAttribute("fname") +"</h3>");
	      			out.print("</a>");
	      		}
	      	%>

          </div>
        </div>
      </div>
    </div>
  </div>
</nav>

<script src="js/nav.js"></script>