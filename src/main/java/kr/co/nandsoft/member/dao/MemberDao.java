package kr.co.nandsoft.member.dao;

import kr.co.nandsoft.member.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


import javax.sql.DataSource;
import java.util.List;


@Repository
public class MemberDao implements IMemberDao {

    private final JdbcTemplate template;

    @Autowired
    public MemberDao(DataSource dataSource) {
        this.template = new JdbcTemplate(dataSource);
    }

    @Override
    public int memberInsert(final Member member) {

        int result = 0;
        //remember sha1 암호화 로직으로 저장. 원래는 WAS 단에서 암호화와 복호화가 이루어져야한다. 스프링 시큐리티 공부하기.
        String sql = "INSERT INTO member (memId, memPw, memMail) VALUES (?,sha1(?),?)";

        result = template.update(sql, pstmt -> {
            pstmt.setString(1, member.getMemId());
            pstmt.setString(2, member.getMemPw());
            pstmt.setString(3, member.getMemMail());

        });

        return result;
    }

    @Override
    public Member memberSelect(Member member) {

        List<Member> members = null;
        //remember sha1 암호화한 DB 값이랑 비교하기 위해 입력값 다시 암호화 sha1(?)
        final String sql = "SELECT * FROM member WHERE memId = ? AND memPw = sha1(?)";

        members = template.query(sql, new Object[]{member.getMemId(), member.getMemPw()}, (rs, rowNum) -> {
            Member mem = new Member();
            mem.setMemId(rs.getString("memId"));
            mem.setMemPw(rs.getString("memPw"));
            mem.setMemMail(rs.getString("memMail"));
            return mem;
        });
        if (members.isEmpty())
            return null;

        return members.get(0);
    }

    @Override
    public int memberCheckId(Member member) {
        return this.template.update(
                "SELECT memId FROM member WHERE memId = ?", member.getMemId());
    }

    @Override
    public int memberUpdate(final Member member) {

        int result = 0;

        final String sql = "UPDATE member SET memPw = sha1(?), memMail = ? WHERE memId = ?";

        result = template.update(sql, pstmt -> {
            pstmt.setString(1, member.getMemPw());
            pstmt.setString(2, member.getMemMail());
            pstmt.setString(3, member.getMemId());
        });
        return result;

    }

    @Override
    public int memberDelete(final Member member) {
        //remember 삭제하기 전 복사
        this.template.update(
                "INSERT INTO delete_member SELECT * FROM member WHERE memId = ?", member.getMemId());
        //remember 삭제하기
        return this.template.update(
                "DELETE FROM member WHERE memId = ?", member.getMemId());
    }
}