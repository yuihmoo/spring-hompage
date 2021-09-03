package kr.co.nandsoft.member.services;

import kr.co.nandsoft.member.Board;
import kr.co.nandsoft.member.BoardRecord;
import kr.co.nandsoft.member.dao.BoardDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BoardService implements IBoardService{

    @Autowired
    BoardDao dao;

    @Override
    public List<Board> boardListAll() {
        List<Board> brd = dao.boardListAll();

        return brd;
    }

    @Override
    public Board boardInsert(Board board) {
        int result = dao.boardInsert(board);

        if (result == 0) {
            System.out.println("Write Fail!!");
        } else {
            System.out.println("Write Success!!");
        }
        return board;
    }

    @Override
    public List<Map<String, Object>> boardRead(Board board) {
        return dao.boardRead(board.getNum());
    }

    @Override
    public void boardModify(Board board) {
        dao.boardModify(board);
    }

    @Override
    public void boardDelete(int Num) {
        dao.boardDelete(Num);
    }
    @Override
    public void hit(Board board) {
        dao.boardHit(board);
    }

    @Override
    public void insert_Read_Record(Board board) {
        dao.insert_Read_Record(board);
    }
    @Override
    public void select_Record(BoardRecord boardRecord, Board board) {
        dao.select_Record(boardRecord, board);
    }
}
