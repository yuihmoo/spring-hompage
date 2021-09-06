package kr.co.nandsoft.member;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria {
    private int page;
    private int perPageNum;

    public Criteria() {
        //remember 최초 게시판에 진입할 때를 위해 기본값 설정
        this.page = 1;
        this.perPageNum = 10;
    }

    public void setPage(int page) {
        if(page <= 0) {
            this.page = 1;
            return;
        }
        this.page = page;
    }

    public void setPerPageNum(int perPageNum) {
        if(perPageNum <= 0 || perPageNum > 50)
        this.perPageNum = perPageNum;
    }
    public int getPageStart() {
        return (this.page -1) * perPageNum;
    }
    @Override
    public String toString() {
        return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
    }
}
