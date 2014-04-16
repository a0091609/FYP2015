package session;

import entity.Student;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.Singleton;
import javax.ejb.LocalBean;
import javax.ejb.Startup;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Singleton
@LocalBean
@Startup
public class StartupBean
{

    @PersistenceContext
    private EntityManager em;

    @EJB
    private AccountBeanLocal acctBean;

    @EJB
    private ModuleBeanLocal moduleBean;

    @EJB
    private QuizBeanLocal quizbean;

    @EJB
    private QuestionBeanLocal questBean;

    @PostConstruct
    private void init()
    {
        try
        {
            createInstructors();
            createStudents();
            createModules();
            createQuizzes();

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    private void createInstructors()
    {
        //String userId, String name, String email, String gender, String faculty
        acctBean.createInstructor("gstwchihyong", "Wong Chih Yong", "wchihyong@gmail.com", "male", "");
        acctBean.createInstructor("Philson", "Philson Nah", "philsonnah@msn.com", "male", "School of Computing");
        System.out.println("Philson INSTRUCTOR created");
    }

    private void createStudents()
    {
        Student student = new Student();
        student.setUserId("a0075128");
        student.setName("WONG CHIH YONG");
        student.setEmail("chihyong@nus.edu.sg");
        student.setGender("male");
        student.setFaculty("School of Computing");
        student.setFirstMajor("Information Systems (Hons)");
        student.setSecondMajor("");
        student.setMatriculationYear(2010);
        acctBean.createStudent(student);

        Student student2 = new Student();
        student2.setUserId("Philson");
        student2.setName("PHILSON NAH");
        student2.setEmail("philson@nus.edu.sg");
        student2.setGender("male");
        student2.setFaculty("School of Computing");
        student2.setFirstMajor("Information Systems (Hons)");
        student2.setSecondMajor(null);
        student2.setMatriculationYear(2010);
        acctBean.createStudent(student2);
    }

    private void createModules()
    {
        //String moduleId, String moduleCode, String moduleName, String moduleCreator, String userId        
        moduleBean.saveStudentModule("a7f180e1-5361-4426-a6fa-5d90404ef2b1",
                                     "IS1112", "E-BUSINESS ESSENTIALS", "gstwchihyong", "gstwchihyong");

        //Create Modules for PHILSON
        //IS1112
        moduleBean.saveStudentModule("IS1112",
                                     "IS1112", "E-BUSINESS ESSENTIALS", "Philson", "Philson");
        //IS4240
        moduleBean.saveStudentModule("IS4240",
                                     "IS4240", "BUSINESS INTELLIGENCE SYSTEMS", "Philson", "Philson");
        //IS4224
        moduleBean.saveStudentModule("IS4224",
                                     "IS4224", "SERVICE SYSTEMS", "Philson", "Philson");
        //IS3260
        moduleBean.saveStudentModule("IS3260",
                                     "IS3260", "GAMIFICATION", "Philson", "Philson");
    }

    private void createQuizzes()
    {
        //String quizName, String moduleId
        Long quiz1 = quizbean.saveNewQuiz("Pre-class Quiz Week 1", "a7f180e1-5361-4426-a6fa-5d90404ef2b1");
        Long quiz2 = quizbean.saveNewQuiz("Pre-class Quiz Week 2", "a7f180e1-5361-4426-a6fa-5d90404ef2b1");

        //Long quizId, String descr, String difficultyLvl, Date dateOpen, Date dateClose
        quizbean.saveQuizInfo(quiz1, "Pre-class Quiz Week 1", "Beginner", convertToDateObj("16/04/2014"), convertToDateObj("23/04/2014"), null);
        quizbean.saveQuizInfo(quiz2, "Pre-class Quiz Week 2", "Beginner", convertToDateObj("23/04/2014"), convertToDateObj("30/04/2014"), null);

        /*String quizId, String questName, String questText,
         String option1, String option2, String option3, String option4, Integer answer*/
        createQuestion(quiz1.toString(), "First Question", "Which is correct?", "Correct", "Incorrect", "Incorrect", "Incorrect", 0);
        createQuestion(quiz1.toString(), "Second Question", "Which is correct?", "Incorrect", "Correct", "Incorrect", "Incorrect", 1);
        createQuestion(quiz1.toString(), "Third Question", "Which is correct?", "Incorrect", "Incorrect", "Correct", "Incorrect", 2);

        createQuestion(quiz2.toString(), "First Question", "Which is correct?", "Correct", "Incorrect", "Incorrect", "Incorrect", 0);
        createQuestion(quiz2.toString(), "Second Question", "Which is correct?", "Incorrect", "Correct", "Incorrect", "Incorrect", 1);
        createQuestion(quiz2.toString(), "Third Question", "Which is correct?", "Incorrect", "Incorrect", "Correct", "Incorrect", 2);

        Long quiz3 = quizbean.saveNewQuiz("Week 1 Quiz Exercise", "a7f180e1-5361-4426-a6fa-5d90404ef2b1");
        quizbean.saveQuizInfo(quiz1, "Week 1 Quiz Exercise", "Intermediate", convertToDateObj("16/04/2014"), convertToDateObj("23/04/2014"), quiz1);
        createQuestion(quiz2.toString(), "First Question", "Which is correct?", "Correct", "Incorrect", "Incorrect", "Incorrect", 0);
        createQuestion(quiz2.toString(), "Second Question", "Which is correct?", "Incorrect", "Correct", "Incorrect", "Incorrect", 1);
        createQuestion(quiz2.toString(), "Third Question", "Which is correct?", "Incorrect", "Incorrect", "Correct", "Incorrect", 2);

    }

    private void createQuestion(String quizId, String questName, String questText,
                                String option1, String option2, String option3, String option4, Integer answer)
    {
        /*String quizId, String questName, String questText,
         String option1, String option2, String option3, String option4, Integer answer*/
        questBean.saveMultiChoice(quizId.toString(), questName, questText, option1, option2, option3, option4, answer);

    }

    private Date convertToDateObj(String date)
    {
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        Date dateObj;
        try
        {
            dateObj = df.parse(date);
            return dateObj;
        }
        catch (ParseException e)
        {
            e.printStackTrace();
            return null;
        }
    }

}
