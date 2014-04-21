package helper;

import java.io.Serializable;

public class QuizResults implements Serializable {

    private String questionText;
    private String answer;
    private Boolean isCorrect;
    private String wrongAns;    //To store wrong answer provided by student

    public QuizResults(String questionText, String answer, Boolean isCorrect, String wrongAns) {
        this.questionText = questionText;
        this.answer = answer;
        this.isCorrect = isCorrect;
        this.wrongAns = wrongAns;
    }

    public QuizResults(String questionText, String answer) {
        this.questionText = questionText;
        this.answer = answer;
    }

    public String getQuestionText() {
        return questionText;
    }

    public void setQuestionText(String questionText) {
        this.questionText = questionText;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Boolean isIsCorrect() {
        return isCorrect;
    }

    public void setIsCorrect(Boolean isCorrect) {
        this.isCorrect = isCorrect;
    }

    public String getWrongAns() {
        return wrongAns;
    }

    public void setWrongAns(String wrongAns) {
        this.wrongAns = wrongAns;
    }

}
