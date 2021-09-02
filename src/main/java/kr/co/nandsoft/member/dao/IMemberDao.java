package kr.co.nandsoft.member.dao;

import kr.co.nandsoft.member.Member;

public interface IMemberDao {

    int memberInsert(Member member);
    Member memberSelect(Member member);
    int memberUpdate(Member member);
    int memberDelete(Member member);
}
