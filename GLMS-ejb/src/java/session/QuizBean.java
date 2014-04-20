package session;

import entity.GameProfile;
import entity.Leaderboard;
import entity.Module;
import entity.Question;
import entity.QuestionAnswer;
import entity.Quiz;
import entity.QuizItem;
import entity.QuizSession;
import entity.SessionQuestion;
import entity.Student;
import helper.AnswerResultsDetails;
import helper.GameProfileDetails;
import helper.LeaderboardDetails;
import helper.QuestionDetails;
import helper.QuizDetails;
import helper.QuizItemDetails;
import helper.QuizResults;
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

    public List<QuizDetails> studentGetModuleQuiz(String userId, String moduleId) {
        Query q = em.createQuery("SELECT q FROM Quiz q WHERE q.module.moduleId = '" + moduleId + "' AND q.status = 'complete'");
        List<Quiz> quizList = q.getResultList();

        ArrayList<QuizDetails> quizzes = new ArrayList<>();

        for (Quiz quiz : quizList) {
            Boolean next = false;
            String status = "", sql = "";
            Boolean active = false;
            QuizSession session = null;
            Quiz prereq = quiz.getPrereq();

            if (prereq != null) {
                sql = "SELECT s FROM QuizSession s WHERE s.userId = '" + userId + "' AND s.quizId = " + prereq.getQuizId();
                q = em.createQuery(sql);
                if (!q.getResultList().isEmpty()) {
                    session = (QuizSession) q.getSingleResult();
                    if (session.getStatus().equals("complete")) {
                        next = true;
                    } else {
                        status = "Complete <b>" + prereq.getName() + "</b> to unlock.";
                    }
                } else {
                    status = "Complete <b>" + prereq.getName() + "</b> to unlock.";
                }
            } else {
                next = true;
            }
            sql = "SELECT s FROM QuizSession s WHERE s.userId = '" + userId + "' AND s.quizId = " + quiz.getQuizId();
            q = em.createQuery(sql);
            if (!q.getResultList().isEmpty()) {
                session = (QuizSession) q.getSingleResult();
                if (session.getStatus().equals("complete")) {
                    next = false;
                    status = "Completed on " + formatDateToString(session.getTimeCompleted(), "dd-MM-yyyy h:mm a");
                }
            }

            Date dateToday = new Date();
            Date dateOpen = quiz.getDateOpen();
            Date dateClose = quiz.getDateClose();

            if (next) {
                status = (dateToday.before(dateOpen)) ? "Open in " + dateDifference(dateToday, dateOpen) + " more days" : "";
                active = (dateOpen.before(dateToday) && dateToday.before(dateClose)) ? true : false;
            }

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

    public Boolean createQuizSession(String userId, Long quizId) {
        Query q = em.createQuery("SELECT s FROM QuizSession s WHERE s.userId = '" + userId + "' AND s.quizId = " + quizId);
        // New QuizSession
        if (q.getResultList().isEmpty()) {
            QuizSession session = new QuizSession();
            session.setUserId(userId);
            session.setQuizId(quizId);
            Date date = new Date();
            session.setTimeStarted(date);
            session.setStatus("incomplete");
            em.persist(session);
            em.flush();
        } else {
            QuizSession s = (QuizSession) q.getSingleResult();
            Date date = new Date();
            s.setTimeStarted(date);
            em.persist(s);
            em.flush();
        }

        System.out.println("Quiz session for user[" + userId + "] and quiz[" + quizId + "] created.");
        return true;
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

    public Integer getQuizItemQty(String userId, String moduleId, String itemName) {
        Query q = em.createQuery("SELECT p FROM GameProfile p WHERE p.userId = '" + userId + "' AND p.moduleId = '" + moduleId + "'");
        GameProfile p = (GameProfile) q.getSingleResult();

        q = em.createQuery("SELECT i FROM QuizItem i WHERE i.profile.profileId = " + p.getProfileId() + " AND i.name = '" + itemName + "'");
        QuizItem item = (QuizItem) q.getSingleResult();

        return item.getQty();
    }

    public Integer getStreakCount(String userId, String moduleId) {
        GameProfile profile = getGameProfile(userId, moduleId);
        return profile.getStreak();
    }

    public AnswerResultsDetails checkAnswer(String userId, String moduleId, Long quizId, Long questionId, String answer) {
        Boolean isCorrect = false;
        String correctAns = "";
        Integer pts = 0, streak = 0;

        String strQuery = "SELECT a FROM QuestionAnswer a "
                + "WHERE a.question.questionId = '" + questionId + "'";
        Query q = em.createQuery(strQuery);

        List<QuestionAnswer> answerList = q.getResultList();

        for (QuestionAnswer a : answerList) {
            if (a.isCorrectAnswer() != null && a.isCorrectAnswer()) {
                correctAns = a.getAnswer();
                if (a.getAnswer().equals(answer)) {
                    isCorrect = true;
                    Quiz quiz = em.find(Quiz.class, quizId);
                    if (quiz.getDifficultyLvl().equals("beginner")) {
                        pts = 2;
                    } else if (quiz.getDifficultyLvl().equals("intermediate")) {
                        pts = 4;
                    } else if (quiz.getDifficultyLvl().equals("advanced")) {
                        pts = 6;
                    }
                    streak = increaseStreakCount(userId, moduleId, true);
                    updateExpPoints(userId, moduleId, pts);
                    updateQuizSession(userId, quizId, questionId, true);
                } else {
                    streak = increaseStreakCount(userId, moduleId, false);
                    updateQuizSession(userId, quizId, questionId, false);
                }
            }
        }

        AnswerResultsDetails content = new AnswerResultsDetails(isCorrect, correctAns, pts, streak);
        return content;
    }

    private void updateQuizSession(String userId, Long quizId, Long questionId, Boolean isCorrect) {
        Query q = em.createQuery("SELECT s FROM SessionQuestion s WHERE s.userId = '" + userId + "' AND s.quizId = " + quizId);
        SessionQuestion s = new SessionQuestion();

        if (isCorrect) {
            s.setUserId(userId);
            s.setQuizId(quizId);
            s.setQuestionId(questionId);
            s.setIsCorrect(true);
            em.persist(s);
        } else {
            s.setUserId(userId);
            s.setQuizId(quizId);
            s.setQuestionId(questionId);
            s.setIsCorrect(false);
            em.persist(s);
        }
    }

    public List<QuizResults> getQuizResults(String userId, Long quizId) {
        Query q = em.createQuery("SELECT s FROM SessionQuestion s WHERE s.userId = '" + userId + "' AND s.quizId = " + quizId);
        List<SessionQuestion> list = q.getResultList();
        List<QuizResults> results = new ArrayList<QuizResults>();

        for (SessionQuestion s : list) {
            Long questionId = s.getQuestionId();
            Question question = em.find(Question.class, questionId);
            String text = question.getQuestionText();
            q = em.createQuery("SELECT a FROM QuestionAnswer a WHERE a.question.questionId = '" + questionId + "' AND a.correctAnswer = TRUE");
            QuestionAnswer ans = (QuestionAnswer) q.getSingleResult();
            String corrAns = ans.getAnswer();

            QuizResults r = new QuizResults(text, corrAns, s.isIsCorrect());
            results.add(r);
        }
        return results;
    }

    public void finishQuiz(String userId, String moduleId, String quizId) {
        Query q = em.createQuery("SELECT s FROM QuizSession s WHERE s.userId = '" + userId + "' AND s.quizId = " + quizId);
        QuizSession s = (QuizSession) q.getSingleResult();

        Date date = new Date();
        s.setTimeCompleted(date);
        s.setStatus("complete");
        em.persist(s);

        Quiz quiz = em.find(Quiz.class, Long.valueOf(quizId));
        String difficulty = quiz.getDifficultyLvl();
        Boolean levelUp = false;

        if (difficulty.equals("beginner")) {
            updateExpPoints(userId, moduleId, 5);

        } else if (difficulty.equals("intermediate")) {
            updateExpPoints(userId, moduleId, 8);
        } else {
            updateExpPoints(userId, moduleId, 12);
        }
    }

    public List<LeaderboardDetails> getLeaderboard(String moduleId) {
        Query q = em.createQuery("SELECT l FROM Leaderboard l WHERE l.moduleId = '" + moduleId + "' ORDER BY l.points DESC");
        List<Leaderboard> list = q.getResultList();
        List<LeaderboardDetails> dataList = new ArrayList<LeaderboardDetails>();

        for (Leaderboard l : list) {
            String userId = l.getUserId();
            Student s = em.find(Student.class, userId);
            GameProfile p = getGameProfile(s.getUserId(), moduleId);

            LeaderboardDetails d = new LeaderboardDetails(userId, p.getExpLevel(), p.getExpPoint());
            dataList.add(d);
        }

        return dataList;
    }

    public QuizDetails getUnlockedQuiz(Long quizId) {
        Quiz q = em.find(Quiz.class, quizId);
        QuizDetails q2 = new QuizDetails(q.getQuizId(), q.getName());

        return q2;
    }

    public QuizItemDetails getNewItem(String userId, String moduleId) {
        //Min + (int)(Math.random() * ((Max - Min) + 1))
        Integer randNum = 3 + (int) (Math.random() * 3);

        GameProfile profile = getGameProfile(userId, moduleId);
        String name = "";
        QuizItemDetails item = new QuizItemDetails();

        if (randNum == 3) {
            name = "Retry";
            item.setName(name);
            item.setDescr("Use this item in Quiz Page to retry a completed Quiz.");
        } else if (randNum == 2) {
            name = "Fifty-Fifty";
            item.setName(name);
            item.setDescr("Use this item during Quiz to randomly eliminate two of the incorrect answer choices.");
        } else {
            name = "Get Help";
            item.setName("GetHelp");
            item.setDescr("Use this item during Quiz to get some hints.");
        }

        for (QuizItem i : profile.getItems()) {
            if (i.getName().equals(name)) {
                int qty = i.getQty();
                i.setQty(qty + 1);
                em.persist(i);
            }
        }

        return item;
    }

    public Boolean enoughItem(String userId, String moduleId, String itemName) {
        GameProfile profile = getGameProfile(userId, moduleId);

        for (QuizItem i : profile.getItems()) {
            if (i.getName().equals(itemName) && i.getQty() > 0) {
                return true;
            }
        }

        return false;
    }

    public String useHints(String userId, String moduleId, Long questionId) {
        Question q = em.find(Question.class, questionId);
        GameProfile profile = getGameProfile(userId, moduleId);
        String hint = "";

        try {
            for (QuizItem i : profile.getItems()) {

                if (i.getName().equals("GetHelp")) {
                    int qty = i.getQty();
                    if (qty > 0) {
                        i.setQty(qty - 1);
                        hint = q.getAnswerHint();
                    } else {
                        hint = "false";
                    }
                }
            }

            return hint;
        } catch (Exception e) {
            e.printStackTrace();
            return hint;
        }
    }

    public Boolean createQuizItems(String userId, String moduleId, String name, Integer qty) {
        try {
            GameProfile profile = getGameProfile(userId, moduleId);

            QuizItem item = new QuizItem();
            item.setName(name);
            item.setQty(qty);
            item.setProfile(profile);
            profile.getItems().add(item);
            em.persist(profile);
            em.persist(item);

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public GameProfile getGameProfile(String userId, String moduleId) {
        Query q = em.createQuery("SELECT p FROM GameProfile p WHERE p.userId = '" + userId + "' AND p.moduleId = '" + moduleId + "'");
        return (GameProfile) q.getSingleResult();
    }

    public GameProfileDetails getProfileDetails(String userId, String moduleId) {
        Query q = em.createQuery("SELECT p FROM GameProfile p WHERE p.userId = '" + userId + "' AND p.moduleId = '" + moduleId + "'");
        GameProfile p = (GameProfile) q.getSingleResult();
        GameProfileDetails profile = new GameProfileDetails(p.getUserId(), p.getModuleId(), p.getExpPoint(), p.getExpLevel(), p.getStreak());

        return profile;
    }

    public Integer ptsToNextLvl(String userId, String moduleId) {
        GameProfile p = getGameProfile(userId, moduleId);
        Integer pts = p.getExpPoint();

        if (pts < 50) {
            return 50 - pts;
        } else if (pts < 100) {
            return 100 - pts;
        } else if (pts < 150) {
            return 150 - pts;
        } else if (pts < 250) {
            return 250 - pts;
        } else {
            return 0;

        }
    }

    private Boolean quizIsActive(Long quizId) {
        Quiz quiz = em.find(Quiz.class, quizId);
        Date dateToday = new Date();
        Date dateOpen = quiz.getDateOpen();
        Date dateClose = quiz.getDateClose();

        return (dateOpen.before(dateToday)
                && dateToday.before(dateClose)) ? true : false;
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

    private Integer increaseStreakCount(String userId, String moduleId, Boolean increase) {
        GameProfile profile = getGameProfile(userId, moduleId);
        int count = profile.getStreak();
        if (increase) {
            count += 1;
            profile.setStreak(count);
        } else {
            count = 0;
            profile.setStreak(0);
        }
        return count;
    }

    private Boolean updateExpPoints(String userId, String moduleId, Integer pts) {
        try {
            GameProfile profile = getGameProfile(userId, moduleId);
            String level1 = profile.getExpLevel(), level2 = "";

            int p1 = profile.getExpPoint();
            int p2 = p1 + pts;
            profile.setExpPoint(p2);
            level2 = getLevelStatus(p2);
            profile.setExpLevel(level2);
            em.persist(profile);

            if (!level1.equals(level2)) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private String getLevelStatus(Integer pts) {
        if (pts < 50) {
            return "novice";
        } else if (pts < 100) {
            return "apprentice";
        } else if (pts < 150) {
            return "entusiast";
        } else if (pts < 250) {
            return "expert";
        } else {
            return "guru";
        }
    }
}
