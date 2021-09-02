package kr.co.nandsoft.member.dao;

import kr.co.nandsoft.member.Board;
import kr.co.nandsoft.member.BoardRecord;

import java.util.List;
import java.util.Map;

public interface IBoardDao {
    List<Board> boardListAll();
    int boardInsert(Board board);
    List<Map<String, Object>> boardRead(int Num);
    int boardModify(Board board);
    void boardDelete(int Num);
    int boardHit(Board board);
    int insert_Read_Record(Board board);
    int select_Record(BoardRecord boardRecord, Board board);
}
