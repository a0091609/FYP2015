/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.Module;
import entity.Quiz;
import java.util.Date;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Chih Yong
 */
@Stateless
public class QuizBean implements QuizBeanLocal
{

    @PersistenceContext
    private EntityManager em;

    public Long saveNewQuiz(String quizName, String moduleId) {
        Quiz quiz = new Quiz();

        quiz.setModule(em.find(Module.class, moduleId));
        quiz.setName(quizName);
        Date date = new Date();
        quiz.setTimeCreated(date);

        em.persist(quiz);
        System.out.println("New quiz created");

        return quiz.getQuizId();
    }
}
