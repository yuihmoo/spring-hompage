package kr.co.nandsoft.member.dao;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import kr.co.nandsoft.member.Board;
import kr.co.nandsoft.member.BoardRecord;
import kr.co.nandsoft.member.Criteria;
import kr.co.nandsoft.member.Member;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.sql.Date;
import java.util.List;
import java.util.Map;

@Repository
public class BoardDao implements IBoardDao {

    @Resource
    SqlSessionTemplate sessionTemplate;

    private JdbcTemplate template;

    public BoardDao(ComboPooledDataSource dataSource) {
        this.template = new JdbcTemplate();
    }

    @Override
    public int countAll(Criteria cri) {
        //remember 향상된 For 문으로 SELECT ALL, template.queryForList 사용법, v.1.2 status 추가 (활성화, 비활성화)
        //remember authority 란 관리자의 권한 여부를 말한다. (공지사항 = 0, 나머지 = 1) 본인 글은 본인만 권한을 가지고 관리자는 모든 게시글에 권한이 있다.
        return sessionTemplate.update("board.countAll");

//        String sql = "SELECT num, memId, title, content, status, authority, hit, writeDate, updateWriteDate, updateId, boardNum FROM board where status = true";
//
//        List<Board> boardList = new ArrayList<>();
//
//        List<Map<String, Object>> rows = template.queryForList(sql);
//
//        for (Map row : rows) {
//            Board obj = new Board();
//
//            obj.setNum((Integer) row.get("num"));
//            obj.setMemId((String) row.get("memId"));
//            obj.setTitle((String) row.get("title"));
//            obj.setContent(((String) row.get("content")));
//            obj.setWriteDate((Timestamp) row.get("writeDate"));
//            obj.setUpdateWriteDate((Timestamp) row.get("updateWriteDate"));
//            obj.setUpdateId((String) row.get("updateId"));
//            obj.setHit((Integer) row.get("hit"));
//            boardList.add(obj);
//        }
//        return boardList;
    }

    @Override
    public int insertBoard(Board board) {
        //remember 글을 쓸 때 조회를 1번 한것으로 가정한다. hit = 1, 최근 업데이트 update_Time_stamp 추가.

        int result = 0;

        String sql = "INSERT INTO board (memId, title, content, writeDate, updateWriteDate, hit, updateId) values (?,?,?,?,?,?)";

        result = template.update(sql, pstmt -> {
            pstmt.setString(1, board.getMemId());
            pstmt.setString(2, board.getTitle());
            pstmt.setString(3, board.getContent());
            pstmt.setTimestamp(4, board.getWriteDate());
            pstmt.setTimestamp(5, board.getWriteDate());
            pstmt.setInt(6, 1);
            pstmt.setString(7, board.getMemId());
        });
        return result;
    }

    @Override
    public Map<String, Object> readBoard(int num) {
        //remember return 문과 함께 쓸 수도 있다.
        /*
        board =  this.template.queryForList(
                "select * from board where Num = ?", Board.class, num);
        return board;
         */

        String query = "select num, memid, title, content, writeDate, updateWriteDate, hit, status, authority, updateId from board where Num = ?";
        return template.queryForMap(query, num);
    }

    @Override
    public int modifyBoard(Board board, Member member) {
        int result = 0;
        //remember 같은 값일 때를 대비해 한번 초기화
        this.template.update(
                "update board set updateId = 1 WHERE num = ?", board.getNum());

        final String sql = "UPDATE board SET title = ?, content = ?, updateWriteDate = ?, updateId = ? WHERE Num = ?";

        result = template.update(sql, pstmt -> {
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setTimestamp(3, board.getWriteDate());
            pstmt.setString(4, member.getMemId());
            pstmt.setInt(5, (board.getNum()));
        });
        return result;
    }
//todo 단순히 데이터를 삭제 하는것이 아니라 Delete 삭제에 대한 고민이 필요함. (실제로 DB 삭제는 속도면에서 느리고 삭제된 데이터도 보관해야함.)
    @Override
    public void deleteBoard(int Num) {
        //remember 게시물 삭제 테이블로 복사 해놓고 , v1.2 테이블 수정 작업으로 delete_board 테이블 삭제
//        this.template.update(
//                "insert into delete_board select * from board where Num = ?", Num);
        //remember 실제 게시물 테이블에 삭제, v1.2 status = false 값으로 비활성화 상태 설정
        this.template.update(
                "UPDATE board set status = false where Num = ?", Num);
    }

    @Override
    public int hitBoard(Board board) {
        //remember 페이지 번호 = Num 으로 찾고 hit +1 해주기. v1.1(쿼리문 안에 hit+1로 바꾼이유는 동시에 접속하는 상황을 가정했을 때 생길 수 있는 트랜잭션 문제 때문.)

        int result = 0;

        String sql = "UPDATE board SET hit = hit+1 WHERE num = ?";

        result = template.update(sql, pstmt -> {
            pstmt.setInt(1, board.getNum());
        });
        return result;
    }
//todo board 객체말고 boardRecord 객체로 바꿔야함. (정리 필요 )
    @Override
    public int insertRecord(Board board) {

        int result = 0;

        String sql = "INSERT INTO board_record (readTime, pageNum, memId) VALUE (?,?,?)";

        result = template.update(sql, pstmt -> {
            pstmt.setTimestamp(1, board.getWriteDate());
            pstmt.setInt(2, board.getNum());
            pstmt.setString(3, board.getMemId());
        });
        return result;
    }

    @Override
    public int selectRecord(BoardRecord boardRecord, Board board) {
        //study 이 메소드를 추가 할 때 변수명이 꼬였다. 변수명 짓기에 더 주의하자.
        //study String sql 작성 시 select * 은 가급적 삼가하자.

        //remember List<Map<String, Object>> 형을 변환할 때 천천히 생각하기.

        int result = 0;

        String sql = "select readTime from board_record WHERE readTime = ? and pageNum = ? and memId = ?";

        List<Map<String, Object>> read_times = template.queryForList(sql, boardRecord.getReadTime(), boardRecord.getPageNum(), boardRecord.getMemId());
        System.out.println(read_times);

        int timesSize = read_times.size();
        System.out.println(timesSize);

        //remember timesSize = 1 일 때, afterTime 값이 -1이 되어 Exception 발생.
        if (timesSize == 1 || timesSize == 0) {
            return hitBoard(board);
        } else {
            //remember Map 의 key 값은 "String"!
            Date afterTime = (Date) read_times.get(timesSize -1).get("readTime");
            Date beforeTime = (Date) read_times.get(timesSize -2).get("readTime");

            //remember String 을 비교할땐 "equals"!
            if (beforeTime.equals(afterTime)) {
                return result;
            } else {
                return hitBoard(board);
            }
        }
    }
    @Override
    public List<Board> selectPage (Criteria cri) {
        Map<String, Integer> params = null;
        params.put("page", cri.getPage());
        params.put("perPageNum", cri.getPerPageNum());
        return sessionTemplate.selectList("selectPage", params);
    }
}
//        System.out.println(beforeTime);
//        System.out.println(afterTime);