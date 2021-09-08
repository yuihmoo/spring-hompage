package kr.co.nandsoft.member;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
//study lombok 의 @Getter, @Setter 는 편하지만 변하지 않아야 할 것들에 대해서 set 을 사용하게 될수도 있다.
public class Member {
    private String memId;
    private String memPw;
    private String memMail;
}
