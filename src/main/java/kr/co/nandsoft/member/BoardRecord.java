package kr.co.nandsoft.member;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class BoardRecord {
    private Date readTime;
    private int pageNum;
    private String memId;
}
