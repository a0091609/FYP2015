/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.Module;
import entity.Quiz;
import helper.QuizDetails;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Chih Yong
 */
@Stateless
public class QuizBean implements QuizBeanLocal
{

    @PersistenceContext
    private EntityManager em;

    public List<QuizDetails> getModuleQuiz(String moduleId) {
        Query q = em.createQuery("SELECT q FROM Quiz q WHERE q.module.moduleId = '" + moduleId + "'");
        List<Quiz> quizList = q.getResultList();

        ArrayList<QuizDetails> quizzes = new ArrayList<QuizDetails>();

        for (Quiz quiz : quizList) {
            QuizDetails quizDetails = new QuizDetails(quiz.getName(), quiz.getDescr(), quiz.isActive(), quiz.getTimeCreated());
            quizzes.add(quizDetails);
        }
        return quizzes;
    }

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
