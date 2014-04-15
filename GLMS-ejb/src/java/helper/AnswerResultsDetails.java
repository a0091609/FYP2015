package helper;

import java.io.Serializable;

public class AnswerResultsDetails implements Serializable {

    private Boolean isCorrect;
    private String status;
    private String correctAns;
    private String msg;

    public AnswerResultsDetails(Boolean isCorrect, String status, String correctAns, String msg) {
        this.isCorrect = isCorrect;
        this.status = status;
        this.correctAns = correctAns;
        this.msg = msg;
    }
}
