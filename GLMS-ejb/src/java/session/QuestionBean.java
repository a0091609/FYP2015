/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.QuestionAnswer;
import entity.QuestionMultiChoice;
import entity.Quiz;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Chih Yong
 */
@Stateless
public class QuestionBean implements QuestionBeanLocal
{

    @PersistenceContext
    private EntityManager em;

    public Boolean saveMultiChoice(String quizId, String questName, String questText,
            String option1, String option2, String option3, String option4, Integer answer) {

        QuestionMultiChoice quest = new QuestionMultiChoice();

        try {
            quest.setQuiz(em.find(Quiz.class, Long.parseLong(quizId)));
            quest.setName(questName);
            quest.setQuestionText(questText);

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
        }
        catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
}
