package kr.co.nandsoft.member;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class Board {
    private int Num;
    private String memId;
    private String title;
    private String content;
    private Timestamp write_date;
    private Timestamp update_write_date;
    private int hit;
}
