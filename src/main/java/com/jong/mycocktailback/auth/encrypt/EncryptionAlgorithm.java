package com.jong.mycocktailback.auth.encrypt;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.scrypt.SCryptPasswordEncoder;

public enum EncryptionAlgorithm {
  BCRYPT {
    @Override
    public PasswordEncoder getEncryptionAlgorithm() {
      return new BCryptPasswordEncoder();
    }
  },
  SCRYPT {
    @Override
    public PasswordEncoder getEncryptionAlgorithm() {
      return new SCryptPasswordEncoder(16384, 8, 1, 32,64);
    }
  };

  public abstract PasswordEncoder getEncryptionAlgorithm();
}
