package com.songmin.song.domain;


//  전체 페이지를 구성하는 클래스
public class PageHandler {

    //  게시글 or 카페를 가져오는데 필요한 정보를 클래스(PageCondition)로 묶음
    private PageCondition pc;
    private int naviSize = 10;
    private int totalCnt;
    private int totalPage;
    private int beginPage;
    private int endPage;
    private boolean showNext;
    private boolean showPrev;




    public PageHandler(PageCondition pc , int totalCnt) {
        this.pc = pc;
        this.totalCnt = totalCnt;
        this.totalPage = (int) Math.ceil(totalCnt / (double)pc.getPageSize());
        this.beginPage = (pc.getPage()-1) / 10 * 10 + 1;
        this.endPage =  Math.min(((pc.getPage()-1) / 10 + 1) * 10, totalPage);
        this.showNext = (endPage == totalPage) ? false : true;
        this.showPrev = (beginPage == 1) ? false : true;
    }


    public PageCondition getPc() {
        return pc;
    }

    public void setPc(PageCondition pc) {
        this.pc = pc;
    }

    public int getNaviSize() {
        return naviSize;
    }

    public void setNaviSize(int naviSize) {
        this.naviSize = naviSize;
    }

    public int getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getBeginPage() {
        return beginPage;
    }

    public void setBeginPage(int beginPage) {
        this.beginPage = beginPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isShowNext() {
        return showNext;
    }

    public void setShowNext(boolean showNext) {
        this.showNext = showNext;
    }

    public boolean isShowPrev() {
        return showPrev;
    }

    public void setShowPrev(boolean showPrev) {
        this.showPrev = showPrev;
    }

    @Override
    public String toString() {
        return "PageHandler{" +
                "pc=" + pc +
                ", naviSize=" + naviSize +
                ", totalCnt=" + totalCnt +
                ", totalPage=" + totalPage +
                ", beginPage=" + beginPage +
                ", endPage=" + endPage +
                ", showNext=" + showNext +
                ", showPrev=" + showPrev +
                '}';
    }
}