package session;

import javax.ejb.Local;

@Local
public interface QuestionBeanLocal {

    public Boolean saveMultiChoice(String quizId, String questName, String questText,
            String option1, String option2, String option3, String option4, Integer answer);
}
