package entity;

import java.io.Serializable;
import javax.persistence.Entity;

@Entity
public class QuestionMultiChoice extends Question implements Serializable
{

    private static final long serialVersionUID = 1L;

    private String answer;

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

}
