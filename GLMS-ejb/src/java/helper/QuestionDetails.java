package helper;

import java.io.Serializable;
import java.util.List;

public class QuestionDetails implements Serializable {

    private Long questionId;
    private String questionText;
    private String answerHint;
    private List<String> options;

    public QuestionDetails(Long questionId, String questionText, String answerHint, List<String> options) {
        this.questionId = questionId;
        this.questionText = questionText;
        this.answerHint = answerHint;
        this.options = options;
    }

    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    public String getQuestionText() {
        return questionText;
    }

    public void setQuestionText(String questionText) {
        this.questionText = questionText;
    }

    public String getAnswerHint() {
        return answerHint;
    }

    public void setAnswerHint(String answerHint) {
        this.answerHint = answerHint;
    }

    public List<String> getOptions() {
        return options;
    }

    public void setOptions(List<String> options) {
        this.options = options;
    }

}
