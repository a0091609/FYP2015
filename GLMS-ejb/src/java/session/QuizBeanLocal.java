package session;

import helper.AnswerResultsDetails;
import helper.QuizItemDetails;
import java.util.Date;
import java.util.List;
import javax.ejb.Local;

@Local
public interface QuizBeanLocal {

    public List instructorGetModuleQuiz(String moduleId);

    public Long saveNewQuiz(String quizName, String moduleId);

    public Boolean saveQuizInfo(Long quizId, String descr, String difficultyLvl, Date dateOpen, Date dateClose, Long prereqQuizId);

    public List studentGetModuleQuiz(String userId, String moduleId);

    public Boolean checkAuthToPlay(String userId, String moduleId, Long quizId);

    public Boolean createQuizSession(String userId, Long quizId);

    public List getQuizQuestions(Long quizId);

    public List<QuizItemDetails> getProfileQuizItems(String userId, String moduleId);

    public AnswerResultsDetails checkAnswer(Long questionId, String answer);

    public Boolean createQuizItems(String userId, String moduleId, String name, Integer qty);
}
