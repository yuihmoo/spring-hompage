package kr.co.nandsoft.member;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class Board {
    private int num;
    private String memId;
    private String title;
    private String content;
    private Timestamp writeDate;
    private Timestamp updateWriteDate;
    private int hit;
    private boolean status;
    private boolean authority;
    private String updateId;
}
