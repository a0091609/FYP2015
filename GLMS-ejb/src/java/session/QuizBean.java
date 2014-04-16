package session;

import entity.Module;
import entity.Question;
import entity.QuestionAnswer;
import entity.Quiz;
import entity.Student;
import helper.AnswerResultsDetails;
import helper.QuestionDetails;
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

    public Boolean saveQuizInfo(Long quizId, String descr, String difficultyLvl, Date dateOpen, Date dateClose, Long prereqQuizId) {
        try {
            Quiz quiz = em.find(Quiz.class, quizId);
            quiz.setDescr(descr);
            quiz.setDifficultyLvl(difficultyLvl);

            Date date = new Date();
            quiz.setTimeCreated(date);

            quiz.setDateOpen(dateOpen);
            quiz.setDateClose(dateClose);
            if (prereqQuizId != null) {
                quiz.setPrereq(em.find(Quiz.class, prereqQuizId));
            }
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

    public Boolean checkAuthToPlay(String userId, String moduleId, Long quizId) {
        //check if student is in this module & quiz is active
        Student student = em.find(Student.class, userId);
        if (student.getModules().contains(em.find(Module.class, moduleId)) && quizIsActive(quizId)) {
            return true;
        } else {
            return false;
        }
    }

    public List<QuestionDetails> getQuizQuestions(Long quizId) {
        String strQuery = "SELECT q FROM Question q WHERE q.quiz.quizId = '" + quizId + "'";
        Query q = em.createQuery(strQuery);

        List<Question> qList = q.getResultList();
        ArrayList<QuestionDetails> questions = new ArrayList<QuestionDetails>();

        for (Question quest : qList) {
            List<String> options = new ArrayList<String>();
            strQuery = "SELECT a FROM QuestionAnswer a "
                    + "WHERE a.question.questionId = '" + quest.getQuestionId() + "'";
            q = em.createQuery(strQuery);
            List<QuestionAnswer> answers = q.getResultList();

            for (QuestionAnswer ans : answers) {
                options.add(ans.getAnswer());
            }
            QuestionDetails qDetails = new QuestionDetails(quest.getQuestionId(),
                    quest.getQuestionText(), quest.getAnswerHint(), options);
            questions.add(qDetails);
        }

        return questions;
    }

    public AnswerResultsDetails checkAnswer(Long questionId, String answer) {
        Boolean isCorrect = false;
        String status = "Wrong!";
        String correctAns = "", msg2 = "";

        String strQuery = "SELECT a FROM QuestionAnswer a "
                + "WHERE a.question.questionId = '" + questionId + "'";
        Query q = em.createQuery(strQuery);

        List<QuestionAnswer> answerList = q.getResultList();

        for (QuestionAnswer a : answerList) {
            if (a.isCorrectAnswer() != null && a.isCorrectAnswer()) {
                correctAns = a.getAnswer();
                if (a.getAnswer().equals(answer)) {
                    isCorrect = true;
                    status = "Correct!";
                }
            }
        }

        AnswerResultsDetails content = new AnswerResultsDetails(isCorrect, status, correctAns, msg2);
        return content;
    }

    private Boolean quizIsActive(Long quizId) {
        Quiz quiz = em.find(Quiz.class, quizId);
        Date dateToday = new Date();
        Date dateOpen = quiz.getDateOpen();
        Date dateClose = quiz.getDateClose();

        return (dateOpen.before(dateToday) && dateToday.before(dateClose)) ? true : false;
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
