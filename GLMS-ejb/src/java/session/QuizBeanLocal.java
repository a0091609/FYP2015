package session;

import entity.GameProfile;
import helper.AnswerResultsDetails;
import helper.GameProfileDetails;
import helper.LeaderboardDetails;
import helper.QuizDetails;
import helper.QuizItemDetails;
import helper.QuizResults;
import java.util.Date;
import java.util.List;
import javax.ejb.Local;

@Local
public interface QuizBeanLocal {

    public List instructorGetModuleQuiz(String moduleId);

    public Long saveNewQuiz(String quizName, String moduleId);

    public Boolean saveQuizInfo(Long quizId, String descr, String difficultyLvl, Date dateOpen, Date dateClose, Long prereqQuizId);

    public List studentGetModuleQuiz(String userId, String moduleId);

    public List<QuizDetails> getCompletedQuiz(String userId, String moduleId);

    public Boolean checkAuthToPlay(String userId, String moduleId, Long quizId);

    public Boolean createQuizSession(String userId, Long quizId);

    public List getQuizQuestions(Long quizId);

    public Integer getQuizItemQty(String userId, String moduleId, String itemName);

    public Integer getStreakCount(String userId, String moduleId);

    public AnswerResultsDetails checkAnswer(String userId, String moduleId, Long quizId, Long questionId, String answer);

    public void finishQuiz(String userId, String moduleId, String quizId);

    public List<QuizResults> getQuizResults(String userId, Long quizId);

    public QuizDetails getUnlockedQuiz(Long quizId);

    public QuizItemDetails getNewItem(String userId, String module);

    public Integer getSreakBonus(String userId, String moduleId);

    public LeaderboardDetails getLeaderboardPos(String userId, String moduleId);

    public List<LeaderboardDetails> getLeaderboard(String moduleId);
    
    public Boolean saveStudentFeedback(String userId, Long quizId, String feedback);

    public GameProfile getGameProfile(String userId, String moduleId);

    public GameProfileDetails getProfileDetails(String userId, String moduleId);

    public Integer ptsToNextLvl(String userId, String moduleId);

    public Boolean enoughItem(String userId, String moduleId, String itemName);

    public String useHints(String userId, String moduleId, Long questionId);

    public String useFifty(String userId, String moduleId, Long questionId);

    public Boolean createQuizItems(String userId, String moduleId, String name, Integer qty);

}
