package kr.co.nandsoft.member;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageMaker {
    private int totalCount;
    private int displayPageNum = 10;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;

    private Criteria cri;

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;

        calcDate();
    }
    public void calcDate() {
        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
        startPage = (endPage - displayPageNum) + 1;
        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
        if(endPage > tempEndPage) {
            endPage = tempEndPage;
        }

        prev = startPage == 1 ? false : true;
        next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
    }
    @Override
    public String toString() {
        return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
                + prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
    }
}