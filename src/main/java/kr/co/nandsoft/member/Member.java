package kr.co.nandsoft.member;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
// TODO: 페이징 기법, pagination Mybatis 적용
public class Member {
    private String memId;
    private String memPw;
    private String memMail;
}
