package kr.co.nandsoft.member.services;

import kr.co.nandsoft.member.Board;
import kr.co.nandsoft.member.BoardRecord;

import java.util.List;

public interface IBoardService {
    List<Board> boardListAll();
    Board boardInsert(Board board);
    Object boardRead(Board board);
    void boardModify(Board board);
    void boardDelete(int Num);
    void hit(Board board);
    void insert_Read_Record(Board board);
    void select_Record(BoardRecord boardRecord, Board board);
}
