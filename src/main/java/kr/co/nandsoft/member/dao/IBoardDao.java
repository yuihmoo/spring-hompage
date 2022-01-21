package kr.co.nandsoft.member.dao;

import kr.co.nandsoft.member.Board;
import kr.co.nandsoft.member.BoardRecord;
import kr.co.nandsoft.member.Criteria;
import kr.co.nandsoft.member.Member;

import java.util.List;
import java.util.Map;

public interface IBoardDao {

    int countAll(Criteria cri);
    int insertBoard(Board board);
    Map<String, Object> readBoard(int num);
    void modifyBoard(Board board, Member member);
    void deleteBoard(int Num);
    void hitBoard(Board board);
    void insertRecord(Board board);
    void selectRecord(BoardRecord boardRecord, Board board);
    List<Map<String, Object>> selectPage(Criteria cri);
}
