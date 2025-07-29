package com.jong.mycocktailback.user.service;

import org.springframework.security.provisioning.UserDetailsManager;

import java.util.Random;

public interface UserService extends UserDetailsManager {
  /**
   * 이 메서드는 자가사용 메서드입니다.
   * 새로운 사용자 생성시 사용자의 닉네임이 공란인 경우 랜덤한 닉네임을 만들어내기 위해 사용됩니다.
   * 닉네임 형식은 "USER-대소문자,숫자포함8자" 입니다. Ex) "USER-8d7eSC12"
   * 새로운 닉네임 형식을 지원해야 한다면, 오버라이딩해 사용하세요.
   *
   * @return 랜덤하게 부여된 사용자의 닉네임을 String 타입 문자열로 반환합니다.
   */
  default String createRandomName(){
    String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    Random random = new Random();
    StringBuilder sb = new StringBuilder();

    do{
      for (int i = 0; i < 8; i++) {
        int index = random.nextInt(characters.length());
        sb.append(characters.charAt(index));
      }
      sb.insert(0, "USER-");
    }while (userExists(sb.toString()));

    return sb.toString();
  }
}
