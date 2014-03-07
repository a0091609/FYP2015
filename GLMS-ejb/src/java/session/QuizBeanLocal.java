package session;

import helper.QuizDetails;
import java.util.Date;
import java.util.List;
import javax.ejb.Local;

@Local
public interface QuizBeanLocal {

    public List instructorGetModuleQuiz(String moduleId);

    public Long saveNewQuiz(String quizName, String moduleId);

    public Boolean saveQuizInfo(Long quizId, String descr, String difficultyLvl, Date dateOpen, Date dateClose);

    public List<QuizDetails> studentGetModuleQuiz(String moduleId);

}
