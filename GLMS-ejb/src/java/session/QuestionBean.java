package session;

import entity.QuestionAnswer;
import entity.QuestionMultiChoice;
import entity.Quiz;
import java.sql.Timestamp;
import java.util.Date;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class QuestionBean implements QuestionBeanLocal {

    @PersistenceContext
    private EntityManager em;

    public Boolean saveMultiChoice(String quizId, String questName, String questText,
            String option1, String option2, String option3, String option4, Integer answer) {

        QuestionMultiChoice quest = new QuestionMultiChoice();

        try {
            quest.setQuiz(em.find(Quiz.class, Long.parseLong(quizId)));
            quest.setName(questName);
            quest.setQuestionText(questText);
            quest.setTimeCreated(getCurrentTimestamp());

            em.persist(quest);
            System.out.println("New multiple choice question created.");

            // Save answers
            String[] options = {option1, option2, option3, option4};
            for (int i = 0; i < 4; i++) {
                QuestionAnswer ans = new QuestionAnswer();
                ans.setQuestion(quest);
                ans.setAnswer(options[i]);
                if (i == answer) {
                    ans.setCorrectAnswer(true);
                }

                em.persist(ans);
                System.out.println("Answer " + options[i] + " created.");
            }

            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    private Timestamp getCurrentTimestamp() {
        Date date = new Date();
        return new Timestamp(date.getTime());
    }
}
