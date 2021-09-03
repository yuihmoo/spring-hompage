package kr.co.nandsoft.member.services;

import kr.co.nandsoft.member.Board;
import kr.co.nandsoft.member.BoardRecord;
import kr.co.nandsoft.member.Member;

import java.util.List;

public interface IBoardService {
    List<Board> allBoards();
    Board insertBoard(Board board);
    Object readBoard(Board board);
    void modifyBoard(Board board, Member member);
    void deleteBoard(int Num);
    void hit(Board board);
    void insertReadRecord(Board board);
    void selectRecord(BoardRecord boardRecord, Board board);
}
