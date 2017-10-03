package com.mainacad.myproject.config;

import com.mainacad.myproject.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomAuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private UserService userService;

    public CustomAuthenticationSuccessHandler() {
        super();
    }

    private String refererUrl;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        String loginName = authentication.getName();

        userService.addActiveUser(loginName);
        userService.plusActiveUser(loginName);

        super.onAuthenticationSuccess(httpServletRequest, httpServletResponse, authentication);
    }

    public String getRefererUrl() {
        return refererUrl;
    }
}
