package kr.co.nandsoft.member.services;

import kr.co.nandsoft.member.Board;
import kr.co.nandsoft.member.BoardRecord;
import kr.co.nandsoft.member.Member;
import kr.co.nandsoft.member.Criteria;

import java.util.List;

public interface IBoardService {

    int countAll(Criteria cri);
    Board insertBoard(Board board);
    Object readBoard(Board board);
    void modifyBoard(Board board, Member member);
    void deleteBoard(int Num);
    void hit(Board board);
    void insertRecord(Board board);
    void selectRecord(BoardRecord boardRecord, Board board);
    List<Board> selectPage(Criteria cri);
}
