package kr.co.nandsoft.member.services;

import kr.co.nandsoft.member.Board;
import kr.co.nandsoft.member.BoardRecord;
import kr.co.nandsoft.member.Criteria;
import kr.co.nandsoft.member.Member;
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
    public int countAll() {
        return dao.countAll();
    }

    @Override
    public Board insertBoard(Board board) {
        int result = dao.insertBoard(board);

        if (result == 0) {
            System.out.println("Write Fail!!");
        } else {
            System.out.println("Write Success!!");
        }
        return board;
    }

    @Override
    public Map readBoard(Board board) {
        return dao.readBoard(board.getNum());
    }

    @Override
    public void modifyBoard(Board board, Member member) {
        dao.modifyBoard(board, member);
    }

    @Override
    public void deleteBoard(int Num) {
        dao.deleteBoard(Num);
    }
    @Override
    public void hit(Board board) {
        dao.hitBoard(board);
    }

    @Override
    public void insertRecord(Board board) {
        dao.insertRecord(board);
    }
    @Override
    public void selectRecord(BoardRecord boardRecord, Board board) {
        dao.selectRecord(boardRecord, board);
    }
    @Override
    public List<Map<String, Object>> selectPage(Criteria cri) {
        return dao.selectPage(cri);
    }
}
