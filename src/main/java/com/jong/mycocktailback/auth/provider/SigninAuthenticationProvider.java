package com.jong.mycocktailback.auth.provider;

import com.jong.mycocktailback.user.service.UserService;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

/**
 * 이 클래스는 스프링 시큐리티 라이프 사이클 중 인증 공급자(AuthenticationProvider) 역할을 수행하는 클래스입니다.
 * 이 클래스를 직접 오토와이어링 하여 사용하지 마세요.
 * 스프링 시큐리티 라이플 사이클에 의해 인증 관리자(AuthenticationManager)가 인증 논리가 구현된 이 객체를 직접 주입받아 사용하는 것이 바람직합니다.
 * <br><br>
 *
 * 이 클래스의 인증 논리는 UsernamePasswordAuthenticationToken 이며, 따라서 해당 토큰을 인증 관리자에게 전달 시, 이 클래스가 자등으로 사용됩니다.
 */
@Component
@RequiredArgsConstructor
public class SigninAuthenticationProvider implements AuthenticationProvider {

  private final PasswordEncoder passwordEncoder;
  private final UserService userService;

  @Override
  public Authentication authenticate(Authentication authentication) throws AuthenticationException {
    try{
      UserDetails user = userService.loadUserByUsername(authentication.getName());

      if(passwordEncoder.matches(authentication.getCredentials().toString(), user.getPassword())){
        return new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword(), user.getAuthorities());
      }
      else{
        throw new BadCredentialsException("비밀번호가 일치하지 않습니다");
      }
    }catch(UsernameNotFoundException e){
      throw new UsernameNotFoundException("사용자 " + authentication.getName() + "는 존재하지 않습니다.");
    }
  }

  @Override
  public boolean supports(Class<?> authentication) {
    return false;
  }
}
