package session;

import helper.AnswerResultsDetails;
import java.util.Date;
import java.util.List;
import javax.ejb.Local;

@Local
public interface QuizBeanLocal {

    public List instructorGetModuleQuiz(String moduleId);

    public Long saveNewQuiz(String quizName, String moduleId);

    public Boolean saveQuizInfo(Long quizId, String descr, String difficultyLvl, Date dateOpen, Date dateClose, Long prereqQuizId);

    public List studentGetModuleQuiz(String moduleId);

    public Boolean checkAuthToPlay(String userId, String moduleId, Long quizId);

    public List getQuizQuestions(Long quizId);

    public AnswerResultsDetails checkAnswer(Long questionId, String answer);
}
