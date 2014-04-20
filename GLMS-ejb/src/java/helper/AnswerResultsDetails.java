package helper;

import java.io.Serializable;

public class AnswerResultsDetails implements Serializable {

    private Boolean isCorrect;
    private String status;
    private String correctAns;
    private Integer pts;
    private Integer streak;

    public AnswerResultsDetails(Boolean isCorrect, String correctAns, Integer pts, Integer streak) {
        this.isCorrect = isCorrect;
        this.correctAns = correctAns;
        this.pts = pts;
        this.streak = streak;
    }

    public AnswerResultsDetails(Boolean isCorrect, String status, String correctAns, Integer pts) {
        this.isCorrect = isCorrect;
        this.status = status;
        this.correctAns = correctAns;
        this.pts = pts;
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

    public Integer getPts() {
        return pts;
    }

    public void setPts(Integer pts) {
        this.pts = pts;
    }

    public Integer getStreak() {
        return streak;
    }

    public void setStreak(Integer streak) {
        this.streak = streak;
    }

}
