package session;

import entity.Module;
import entity.Quiz;
import helper.QuizDetails;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

@Stateless
public class QuizBean implements QuizBeanLocal {

    @PersistenceContext
    private EntityManager em;

    public List<QuizDetails> instructorGetModuleQuiz(String moduleId) {
        Query q = em.createQuery("SELECT q FROM Quiz q WHERE q.module.moduleId = '" + moduleId + "'");
        List<Quiz> quizList = q.getResultList();

        ArrayList<QuizDetails> quizzes = new ArrayList<QuizDetails>();

        for (Quiz quiz : quizList) {
            QuizDetails quizDetails = new QuizDetails(quiz.getName(), quiz.getDescr(),
                    quiz.getDifficultyLvl(), formatDateToString(quiz.getDateOpen(), "dd-MM-yyyy"),
                    formatDateToString(quiz.getDateClose(), "dd-MM-yyyy"), quiz.getTimeCreated());
            quizzes.add(quizDetails);
        }
        return quizzes;
    }

    public Long saveNewQuiz(String quizName, String moduleId) {
        Quiz quiz = new Quiz();

        quiz.setModule(em.find(Module.class, moduleId));
        quiz.setName(quizName);
        quiz.setStatus("draft");

        em.persist(quiz);
        System.out.println("New quiz created");

        return quiz.getQuizId();
    }

    public Boolean saveQuizInfo(Long quizId, String descr, String difficultyLvl, Date dateOpen, Date dateClose) {
        try {
            Quiz quiz = em.find(Quiz.class, quizId);
            quiz.setDescr(descr);
            quiz.setDifficultyLvl(difficultyLvl);

            Date date = new Date();
            quiz.setTimeCreated(date);

            quiz.setDateOpen(dateOpen);
            quiz.setDateClose(dateClose);
            quiz.setStatus("complete");

            em.persist(quiz);
            System.out.println("Quiz info saved");

            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public List<QuizDetails> studentGetModuleQuiz(String moduleId) {
        Query q = em.createQuery("SELECT q FROM Quiz q WHERE q.module.moduleId = '" + moduleId + "' AND q.status = 'complete'");
        List<Quiz> quizList = q.getResultList();

        ArrayList<QuizDetails> quizzes = new ArrayList<>();

        for (Quiz quiz : quizList) {
            Date dateToday = new Date();
            Date dateOpen = quiz.getDateOpen();
            Date dateClose = quiz.getDateClose();
            String status = (dateToday.before(dateOpen)) ? "Open in " + dateDifference(dateToday, dateOpen) + " more days" : "";

            Boolean active = (dateOpen.before(dateToday) && dateToday.before(dateClose)) ? true : false;

            QuizDetails quizDetails = new QuizDetails(quiz.getQuizId(), quiz.getName(), quiz.getDescr(),
                    quiz.getDifficultyLvl(), formatDateToString(dateOpen, "dd-MM-yyyy"), formatDateToString(dateClose, "dd-MM-yyyy"),
                    active, status);
            quizzes.add(quizDetails);
        }
        return quizzes;
    }

    public Boolean checkAuthToPlay(String userId, String moduleId, String quizId) {
        return false;
    }

    private Integer dateDifference(Date d1, Date d2) {
        DateTime dt1 = new DateTime(d1);
        DateTime dt2 = new DateTime(d2);

        return Days.daysBetween(dt1, dt2).getDays();
    }

    private String formatDateToString(Date date, String dateFormat) {
        if (date != null) {
            return new SimpleDateFormat(dateFormat).format(date);
        } else {
            return "";
        }
    }
}
