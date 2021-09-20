function selChange() {
    const sel = document.getElementById('perPageNum').value;
    location.href = "/member/board/listPage?page=${pageMaker.startPage}&perPageNum=" + sel + "&sortOption=${cri.sortOption}" + "&searchText=${cri.searchOption}";
}

function sortChange() {
    const sel = document.getElementById('sortOption').value;
    location.href = "/member/board/listPage?page=${pageMaker.startPage}&perPageNum=${cri.perPageNum}&sortOption=" + sel + "&searchText=${cri.searchOption}";
}

function searchText() {
    const searchText = document.getElementById('searchText').value;
    location.href = "/member/board/listPage?page=${pageMaker.startPage}&perPageNum=${cri.perPageNum}&sortOption=${cri.sortOption}" + "&searchText=" + searchText;
}