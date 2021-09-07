package kr.co.nandsoft.member.dao;

import kr.co.nandsoft.member.Board;
import kr.co.nandsoft.member.BoardRecord;
import kr.co.nandsoft.member.Member;
import kr.co.nandsoft.member.Criteria;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IBoardDao {
    int countAll();
    int insertBoard(Board board);
    Map<String, Object> readBoard(int num);
    int modifyBoard(Board board, Member member);
    void deleteBoard(int Num);
    int hitBoard(Board board);
    int insertRecord(Board board);
    int selectRecord(BoardRecord boardRecord, Board board);
    List<Map<String, Object>> selectPage(Criteria cri);
}
