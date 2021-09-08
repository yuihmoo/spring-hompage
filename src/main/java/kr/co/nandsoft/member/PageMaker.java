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
    private int tempEndPage;

    private Criteria cri;

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;

        calcDate();
    }
    public void calcDate() {
        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);

        startPage = (endPage - displayPageNum) + 1;
        if(startPage <= 0) startPage = 1;

        this.tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
        if (endPage > tempEndPage) {
            endPage = tempEndPage;

        }
        prev = startPage == 1 ? false : true;
        next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
    }
    //study lombok 기능 중 @toString 을 사용하면 자동으로 만들어준다.
    //study lombok 기능 중 생성자를 자동으로 생성해주는 어노테이션 @NoArgsConstructor(기본 생성자), @AllArgsConstructor(모든 멤버변수 값), @RequiredArgsConstructor(final or @NonNull 인 멤버변수 값)
    @Override
    public String toString() {
        return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
                + prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
    }
}