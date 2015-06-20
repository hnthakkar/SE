package spring.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

public class LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
	
	@Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		try{
			User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			request.getSession().setAttribute("user", user);
			//if(request.isUserInRole("ROLE_ADMIN"))
				//request.getSession().setAttribute("isAdmin", 1);
			setDefaultTargetUrl("/index");
		}catch(Exception e){
			e.printStackTrace();
		}
        super.onAuthenticationSuccess(request, response, authentication);
    }

}
