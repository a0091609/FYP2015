package session;

import entity.Avatar;
import entity.GameProfile;
import entity.Key;
import entity.Leaderboard;
import entity.Module;
import entity.Quest;
import entity.Skill;
import entity.Student;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
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
public class StartupBean {

    @EJB
    private AccountBeanLocal acctBean;
    @EJB
    private QuestBeanLocal quest;
    @EJB
    private ModuleBeanLocal moduleBean;
    @EJB
    private QuizBeanLocal quizbean;
    @EJB
    private QuestionBeanLocal questBean;
    @EJB
    private ItemBeanLocal itemBean;

    @PersistenceContext
    private EntityManager em;

    @PostConstruct
    private void init() {
        try {
            createInstructors();
            createStudents();
            createModules();
            createGameProfile();
            createAvatar();
            createQuests();
            createItems();
            createQuizzes();
            createQuizItems();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void createInstructors() {
        System.out.println("Creating instructors...");
        //String userId, String name, String email, String gender, String faculty
        acctBean.createInstructor("gstwchihyong", "Wong Chih Yong", "wchihyong@gmail.com", "male", "");
        acctBean.createInstructor("Philson", "Philson Nah", "philsonnah@msn.com", "male", "School of Computing");
        System.out.println("Instructors [gstwchihyong, Philson] created.");
    }

    private void createStudents() {
        System.out.println("Creating students...");
        /* String userId, String name, String email, String gender,
         String faculty, String firstMajor, String secondMajor, Integer matriculationYear*/
        acctBean.createStudent("a0075128", "WONG CHIH YONG", "chihyong@nus.edu.sg",
                "male", "School of Computing", "Information Systems (Hons)", "", 2010, "");
        acctBean.createStudent("gstwchihyong", "Wong Chih Yong", "wchihyong@gmail.com",
                "male", "School of Computing", "Information Systems (Hons)", "", 2010, "/Student/assets/img/gstwchihyong.jpg");
        acctBean.createStudent("micheal", "Micheal Chang", "chihyong@nus.edu.sg",
                "male", "School of Computing", "Information Systems (Hons)", "", 2010, "/Student/assets/img/avatar.png");
        acctBean.createStudent("kelvin", "Kelvin Lee", "chihyong@nus.edu.sg",
                "male", "School of Computing", "Information Systems (Hons)", "", 2010, "/Student/assets/img/avatar.png");
        acctBean.createStudent("adam", "Adam Tan", "chihyong@nus.edu.sg",
                "male", "School of Computing", "Information Systems (Hons)", "", 2010, "/Student/assets/img/avatar.png");
        acctBean.createStudent("vincent", "Vincent Liew", "chihyong@nus.edu.sg",
                "male", "School of Computing", "Information Systems (Hons)", "", 2010, "/Student/assets/img/avatar.png");
        acctBean.createStudent("Philson", "PHILSON NAH", "philson@nus.edu.sg",
                "male", "School of Computing", "Information Systems (Hons)", "", 2010, "/Student/assets/img/avatar.png");
        System.out.println("Students [a0075128, gstwchihyong, Philson] created.");
    }

    private void createModules() {
        System.out.println("Creating modules...");
        //String moduleId, String moduleCode, String moduleName, String moduleCreator, String userId        
        moduleBean.saveStudentModule("a7f180e1-5361-4426-a6fa-5d90404ef2b1",
                "IS1112", "E-BUSINESS ESSENTIALS", "gstwchihyong", "gstwchihyong");
        moduleBean.saveStudentModule("a7f180e1-5361-4426-a6fa-5d90404ef2b1",
                "IS1112", "E-BUSINESS ESSENTIALS", "gstwchihyong", "micheal");
        moduleBean.saveStudentModule("a7f180e1-5361-4426-a6fa-5d90404ef2b1",
                "IS1112", "E-BUSINESS ESSENTIALS", "gstwchihyong", "kelvin");
        moduleBean.saveStudentModule("a7f180e1-5361-4426-a6fa-5d90404ef2b1",
                "IS1112", "E-BUSINESS ESSENTIALS", "gstwchihyong", "adam");
        moduleBean.saveStudentModule("a7f180e1-5361-4426-a6fa-5d90404ef2b1",
                "IS1112", "E-BUSINESS ESSENTIALS", "gstwchihyong", "vincent");

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
        System.out.println("Modules [IS1112, IS1112, IS4240, IS4224, IS3260] created.");
    }

    private void createGameProfile() {
        Date date = new Date();

        // update Game Profiles created in saveStudentModule method
        GameProfile profile1 = quizbean.getGameProfile("gstwchihyong", "a7f180e1-5361-4426-a6fa-5d90404ef2b1");
        Leaderboard l1 = new Leaderboard();
        profile1.setExpPoint(45);
        profile1.setExpLevel("novice");
        profile1.setStreak(2);
        em.persist(profile1);
        l1.setUserId("gstwchihyong");
        l1.setModuleId("a7f180e1-5361-4426-a6fa-5d90404ef2b1");
        l1.setPoints(45);
        l1.setTimeCreated(date);
        em.persist(l1);

        GameProfile profile2 = quizbean.getGameProfile("micheal", "a7f180e1-5361-4426-a6fa-5d90404ef2b1");
        Leaderboard l2 = new Leaderboard();
        profile2.setExpPoint(60);
        profile2.setExpLevel("apprentice");
        profile2.setStreak(3);
        em.persist(profile2);
        l2.setUserId("micheal");
        l2.setModuleId("a7f180e1-5361-4426-a6fa-5d90404ef2b1");
        l2.setPoints(60);
        l2.setTimeCreated(date);
        em.persist(l2);

        GameProfile profile3 = quizbean.getGameProfile("kelvin", "a7f180e1-5361-4426-a6fa-5d90404ef2b1");
        Leaderboard l3 = new Leaderboard();
        profile3.setExpPoint(151);
        profile3.setExpLevel("expert");
        profile3.setStreak(3);
        em.persist(profile3);
        l3.setUserId("kelvin");
        l3.setModuleId("a7f180e1-5361-4426-a6fa-5d90404ef2b1");
        l3.setPoints(151);
        l3.setTimeCreated(date);
        em.persist(l3);

        GameProfile profile4 = quizbean.getGameProfile("adam", "a7f180e1-5361-4426-a6fa-5d90404ef2b1");
        Leaderboard l4 = new Leaderboard();
        profile4.setExpPoint(110);
        profile4.setExpLevel("enthusiast");
        profile4.setStreak(3);
        em.persist(profile4);
        l4.setUserId("adam");
        l4.setModuleId("a7f180e1-5361-4426-a6fa-5d90404ef2b1");
        l4.setPoints(110);
        l4.setTimeCreated(date);
        em.persist(l4);

        GameProfile profile5 = quizbean.getGameProfile("vincent", "a7f180e1-5361-4426-a6fa-5d90404ef2b1");
        Leaderboard l5 = new Leaderboard();
        profile5.setExpPoint(40);
        profile5.setExpLevel("novice");
        profile5.setStreak(3);
        em.persist(profile5);
        l5.setUserId("vincent");
        l5.setModuleId("a7f180e1-5361-4426-a6fa-5d90404ef2b1");
        l5.setPoints(40);
        l5.setTimeCreated(date);
        em.persist(l5);
    }

    private void createQuests() throws Exception {
        Module eBiz = moduleBean.getModule("IS1112");
        Quest q1 = new Quest();
        Quest q2 = new Quest();

        q1.setName("What's that sequel!?");
        q1.setDescription("The purpose of this assignment is getting practical experience of requirement analysis, database design, and implementing database system in MS SQL Server 2005. In this assignment, you are going to design a simple database system for Xiaoshan International Airport. You can find more detail in the following specification. Besides the database design, you also must to answer some questions.");
        q1.setDifficulty(1);
        q1.setFileURL("assets/quests/Assignment_1.pdf");
        //Set closing date
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, 1);
        q1.setClosingDate(cal.getTime());
        //Set rewards and link up
        q1.setGoldReward(50);
        Skill db = new Skill("Databases", 5);
        q1.setSkillReward(db);
        q1.setModule(eBiz);
        eBiz.getQuests().add(q1);
        //Call session bean to persist
        quest.createQuest(eBiz, db, q1);

        //Create Key for module
        String imgURL = "assets/img/key2.png";
        Key key = new Key();

        //Set all the item info
        key.setName("Intermediate Database Key");
        key.setDescription("Unlocks 2 star database quest.");
        key.setCost(50);
        key.setImgURL(imgURL);
        key.setModule(eBiz);
        key.setStatus("AVAILABLE");

        //Create 2 Star quest
        q2.setName("The sequel to What's That Sequel??");
        q2.setDescription("More advanced Database questions. Involves application of knowledge.");
        q2.setDifficulty(2);
        q2.setFileURL("assets/quests/Assignment_1.pdf");
        //Set closing date
        q2.setClosingDate(cal.getTime());
        //Set rewards and link up
        q2.setGoldReward(100);
        Skill db2 = new Skill("Databases", 10);
        q2.setSkillReward(db2);
        q2.setModule(eBiz);
        q2.setKeyRequired(key);

        //Update Module stats
        eBiz.getQuests().add(q2);
        eBiz.getItems().add(key);

        //Update Key stats
        key.setUnlock(q2);

        //Call session bean to persist
        quest.createQuest(eBiz, db2, q2);
        itemBean.createKey2(eBiz, q2, key);
    }

    private void createAvatar() throws Exception {
        Student phil = acctBean.getStudent("Philson");
        Module eBiz = moduleBean.getModule("IS1112");
        Avatar aang = new Avatar();

        aang.setAvatarName("AzureKn1ght");
        aang.setAvatarBio("Bio text here.");
        aang.setCurrentBalance(0);
        aang.setLifetimeEarnings(0);
        aang.setStudent(phil);
        aang.setModule(eBiz);

        List<Skill> skills = new ArrayList();
        skills.add(new Skill("Databases", 5));
        skills.add(new Skill("Marketing", 5));
        skills.add(new Skill("Security", 0));
        skills.add(new Skill("HTML", 5));
        skills.add(new Skill("PHP", 10));

        aang.setSkills(skills);
        phil.getAvatars().add(aang);

        acctBean.createAvatar(phil, aang);
    }

    private void createItems() {

    }

    private void createQuizzes() {
        System.out.println("Creating quizzes...");
        //String quizName, String moduleId
        Long quiz1 = quizbean.saveNewQuiz("Pre-class Quiz Week 10", "a7f180e1-5361-4426-a6fa-5d90404ef2b1");
        Long quiz2 = quizbean.saveNewQuiz("Pre-class Quiz Week 11", "a7f180e1-5361-4426-a6fa-5d90404ef2b1");

        //Long quizId, String descr, String difficultyLvl, Date dateOpen, Date dateClose
        quizbean.saveQuizInfo(quiz1, "Pre-class Quiz Week 10", "beginner", convertToDateObj("18/04/2014"), convertToDateObj("25/04/2014"), null);
        quizbean.saveQuizInfo(quiz2, "Pre-class Quiz Week 11", "beginner", convertToDateObj("25/04/2014"), convertToDateObj("02/05/2014"), null);

        /*String quizId, String questName, String questText,
         String option1, String option2, String option3, String option4, Integer answer*/
        createQuestion(quiz1.toString(), "Definition of Gamification", "Who defined Gamification as \"<i>using  game-based  mechanics,  aesthetics  and  game "
                + "thinking  to  engage  people,  motivate  action,  promote  learning,  and  solve  problems</i>\"?", "Refer to \"What is Gamification? paragraph 2\"", "Karl Kapp", "Mark Zuckerberg", "Bill Gates", "Sebastian Deterding", 0);
        createQuestion(quiz1.toString(), "Pedagogies", "Which is one of the pedagogies we have adopted?", "Refer to Reading \"Gamifying Pedagogies paragraph 3\"", "Confrontational Pedagogy", "Just-in-Time Teaching", "Traditional Pedagogy", "None of the above", 1);
        createQuestion(quiz1.toString(), "Just-in-Time Teaching", "Which one is not an issue in Just-in-Time Teaching?", "Refer to Reading \"Just-in-Time Teaching paragraph 5\"", "Students skip over pre-class assignment.", "Students have negative impressions on the need.", "Students are happy with the assignment.", "Students simply overlook the assignment.", 2);

        createQuestion(quiz2.toString(), "First Question", "Which is correct?", "", "Correct", "Incorrect", "Incorrect", "Incorrect", 0);
        createQuestion(quiz2.toString(), "Second Question", "Which is correct?", "", "Incorrect", "Correct", "Incorrect", "Incorrect", 1);
        createQuestion(quiz2.toString(), "Third Question", "Which is correct?", "", "Incorrect", "Incorrect", "Correct", "Incorrect", 2);

        Long quiz3 = quizbean.saveNewQuiz("Week 10 Quiz Exercise", "a7f180e1-5361-4426-a6fa-5d90404ef2b1");
        quizbean.saveQuizInfo(quiz3, "Week 10 Quiz Exercise", "intermediate", convertToDateObj("16/04/2014"), convertToDateObj("23/04/2014"), quiz1);
        createQuestion(quiz3.toString(), "First Question", "Which is correct?", "", "Correct", "Incorrect", "Incorrect", "Incorrect", 0);
        createQuestion(quiz3.toString(), "Second Question", "Which is correct?", "", "Incorrect", "Correct", "Incorrect", "Incorrect", 1);
        createQuestion(quiz3.toString(), "Third Question", "Which is correct?", "", "Incorrect", "Incorrect", "Correct", "Incorrect", 2);

        // Create QuizSession with student feedbacks for "Pre-class Quiz Week 1".
        quizbean.createQuizSession("micheal", quiz1);
        quizbean.createQuizSession("kelvin", quiz1);
        quizbean.createQuizSession("adam", quiz1);
        quizbean.createQuizSession("vincent", quiz1);

        quizbean.saveStudentFeedback("micheal", quiz1, "I found it particularly hard for question 3.");
        quizbean.saveStudentFeedback("kelvin", quiz1, "I really had a hard time understanding concepts of Gamification.");
        quizbean.saveStudentFeedback("adam", quiz1, "The topics on Gamification techniques are too complex. Please explain more during the class.");
        quizbean.saveStudentFeedback("vincent", quiz1, "Please provide more case studies on Gamification in education.");

        System.out.println("Quizzes created.");
    }

    private void createQuestion(String quizId, String questName, String questText, String hint,
            String option1, String option2, String option3, String option4, Integer answer) {
        System.out.println("Creating questions...");
        /*String quizId, String questName, String questText,
         String option1, String option2, String option3, String option4, Integer answer*/
        questBean.saveMultiChoice(quizId.toString(), questName, questText, hint, option1, option2, option3, option4, answer);
        System.out.println("Questions created.");
    }

    private void createQuizItems() {
        //String userId, String moduleId, String name, Integer qty
        quizbean.createQuizItems("gstwchihyong", "a7f180e1-5361-4426-a6fa-5d90404ef2b1", "GetHelp", 3);
        quizbean.createQuizItems("gstwchihyong", "a7f180e1-5361-4426-a6fa-5d90404ef2b1", "Fifty-Fifty", 2);
        quizbean.createQuizItems("gstwchihyong", "a7f180e1-5361-4426-a6fa-5d90404ef2b1", "Retry", 2);
    }

    private Date convertToDateObj(String date) {
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        Date dateObj;
        try {
            dateObj = df.parse(date);
            return dateObj;
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

}
