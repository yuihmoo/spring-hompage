package kr.co.nandsoft.member.services;

import kr.co.nandsoft.member.Member;

public interface IMemberService {

    void memberRegister(Member member);
    Member memberSearch(Member member);
    Member memberModify(Member member);
    int memberRemove(Member member);
}
