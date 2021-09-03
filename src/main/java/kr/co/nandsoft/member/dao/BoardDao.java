package kr.co.nandsoft.member.dao;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import kr.co.nandsoft.member.Board;
import kr.co.nandsoft.member.BoardRecord;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class BoardDao implements IBoardDao {

    private JdbcTemplate template;

    public BoardDao(ComboPooledDataSource dataSource) {
        this.template = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Board> boardListAll() {
        //remember 향상된 For 문으로 SELECT ALL, template.queryForList 사용법

        String sql = "SELECT * FROM board";

        List<Board> boardList = new ArrayList<>();

        List<Map<String, Object>> rows = template.queryForList(sql);

        for (Map row : rows) {
            Board obj = new Board();

            obj.setNum((Integer) row.get("Num"));
            obj.setMemId((String) row.get("memId"));
            obj.setTitle((String) row.get("title"));
            obj.setContent(((String) row.get("content")));
            obj.setWrite_date((Timestamp) row.get("time_stamp"));
            obj.setUpdate_write_date((Timestamp) row.get("update_time_stamp"));
            obj.setHit((Integer) row.get("hit"));
            boardList.add(obj);
        }
        return boardList;
    }

    @Override
    public int boardInsert(Board board) {
        //remember 글을 쓸 때 조회를 1번 한것으로 가정한다. hit = 1, 최근 업데이트 update_Time_stamp 추가.

        int result = 0;

        String sql = "INSERT INTO board (memId, title, content, time_stamp, update_time_stamp, hit) values (?,?,?,?,?,?)";

        result = template.update(sql, pstmt -> {
            pstmt.setString(1, board.getMemId());
            pstmt.setString(2, board.getTitle());
            pstmt.setString(3, board.getContent());
            pstmt.setTimestamp(4, board.getWrite_date());
            pstmt.setTimestamp(5, board.getWrite_date());
            pstmt.setInt(6, 1);
        });
        return result;
    }

    @Override
    public List<Map<String, Object>> boardRead(int Num) {
        //remember return 문과 함께 쓸 수도 있다.
        return this.template.queryForList(
                "select * from board where Num = ?", Num);
    }

    @Override
    public int boardModify(Board board) {

        int result = 0;

        final String sql = "UPDATE board SET title = ?, content = ?, update_time_stamp = ? WHERE Num = ?";

        result = template.update(sql, pstmt -> {
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setTimestamp(3, board.getWrite_date());
            pstmt.setInt(4, (board.getNum()));
        });
        return result;
    }
//todo 단순히 데이터를 삭제 하는것이 아니라 Delete 삭제에 대한 고민이 필요함. (실제로 DB 삭제는 속도면에서 느리고 삭제된 데이터도 보관해야함.)
    @Override
    public void boardDelete(int Num) {
        //remember 게시물 삭제 테이블로 복사 해놓고
        this.template.update(
                "insert into delete_board select * from board where Num = ?", Num);
        //remember 실제 게시물 테이블에 삭제
        this.template.update(
                "delete from board where Num = ?", Num);
    }

    @Override
    public int boardHit(Board board) {
        //remember 페이지 번호 = Num 으로 찾고 hit +1 해주기. v1.1(쿼리문 안에 hit+1로 바꾼이유는 동시에 접속하는 상황을 가정했을 때 생길 수 있는 트랜잭션 문제 때문.)

        int result = 0;

        String sql = "UPDATE board SET hit = hit+1 WHERE Num = ?";

        result = template.update(sql, pstmt -> {
            pstmt.setInt(1, board.getNum());
        });
        return result;
    }
//todo board 객체말고 boardRecord 객체로 바꿔야함. (정리 필요 )
    @Override
    public int insert_Read_Record(Board board) {

        int result = 0;

        String sql = "INSERT INTO board_record (read_Time, pageNum, memId) VALUE (?,?,?)";

        result = template.update(sql, pstmt -> {
            pstmt.setTimestamp(1, board.getWrite_date());
            pstmt.setInt(2, board.getNum());
            pstmt.setString(3, board.getMemId());
        });
        return result;
    }

    @Override
    public int select_Record(BoardRecord boardRecord, Board board) {
        //study 이 메소드를 추가 할 때 변수명이 꼬였다. 변수명 짓기에 더 주의하자.
        //study String sql 작성 시 select * 은 가급적 삼가하자.

        //remember List<Map<String, Object>> 형을 변환할 때 천천히 생각하기.

        int result = 0;

        String sql = "select read_Time from board_record WHERE read_Time = ? and pageNum = ? and memId = ?";

        List<Map<String, Object>> read_times = template.queryForList(sql, boardRecord.getRead_Time(), boardRecord.getPageNum(), boardRecord.getMemId());
        System.out.println(read_times);

        int timesSize = read_times.size();
        System.out.println(timesSize);

        //remember timesSize = 1 일 때, afterTime 값이 -1이 되어 Exception 발생.
        if (timesSize == 1 || timesSize == 0) {
            return boardHit(board);
        } else {
            //remember Map 의 key 값은 "String"!
            Date afterTime = (Date) read_times.get(timesSize -1).get("read_Time");
            Date beforeTime = (Date) read_times.get(timesSize -2).get("read_Time");

            //remember String 을 비교할땐 "equals"!
            if (beforeTime.equals(afterTime)) {
                return result;
            } else {
                return boardHit(board);
            }
        }
    }
}
//        System.out.println(beforeTime);
//        System.out.println(afterTime);