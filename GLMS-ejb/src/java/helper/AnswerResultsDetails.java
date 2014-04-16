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

    public Boolean isIsCorrect() {
        return isCorrect;
    }

    public void setIsCorrect(Boolean isCorrect) {
        this.isCorrect = isCorrect;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCorrectAns() {
        return correctAns;
    }

    public void setCorrectAns(String correctAns) {
        this.correctAns = correctAns;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}
