package session;

import entity.Avatar;
import entity.GameProfile;
import entity.Instructor;
import entity.Leaderboard;
import entity.Student;
import helper.GameProfileDetails;
import helper.LeaderboardDetails;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class AccountBean implements AccountBeanLocal {

    @PersistenceContext
    private EntityManager em;

    /* Methods for Student */
    public Boolean createStudent(String userId, String name, String email, String gender,
            String faculty, String firstMajor, String secondMajor, Integer matriculationYear) {

        try {
            // Non-student userId is allowed to login
//            if (!isStudent(userId) && !isInstructorUserId(userId)) {
            if (!isStudent(userId)) {
                Student student = new Student();

                student.setUserId(userId);
                student.setName(name);
                student.setEmail(email);
                student.setGender(gender.toLowerCase());
                student.setFaculty(faculty);
                student.setFirstMajor(firstMajor);
                student.setSecondMajor(secondMajor);
                student.setMatriculationYear(matriculationYear);

                em.persist(student);
                em.flush();
                System.out.println("New student " + userId + " created.");
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void createAvatar(Student s, Avatar a) {
        em.persist(a);
        em.persist(s);
        em.flush();
    }

    public Boolean isStudent(String userId) {
        Student student = em.find(Student.class, userId);
        if (student != null) {
            System.out.println("Student " + userId + " already exists.");
            return true;
        } else {
            System.out.println("Student does not exist.");
            return false;
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

            LeaderboardDetails d = new LeaderboardDetails(userId, s.getName(), p.getExpLevel(), p.getExpPoint());
            dataList.add(d);
        }

        return dataList;
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
    
    public Student getStudent(String userId) {
        Student student = em.find(Student.class, userId);
        return student;
    }
    /* End of methods for Student */

    /* Methods for Instructor */
    public Boolean createInstructor(String userId, String name, String email,
            String gender, String faculty) {

        try {
            if (!isInstructor(userId) && isInstructorUserId(userId)) {
                Instructor instructor = new Instructor();

                instructor.setUserId(userId);
                instructor.setName(name);
                instructor.setEmail(email);
                instructor.setGender(gender.toLowerCase());
                instructor.setFaculty(faculty);

                em.persist(instructor);
                System.out.println("New instructor " + userId + " created.");
            }
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public Boolean isInstructorUserId(String userId) {
        if (userId.length() > 4 && !isNumeric(userId.substring(4))) {
            return true;
        } else {
            return false;
        }
    }

    public Boolean isInstructor(String userId) {
        Instructor instructor = em.find(Instructor.class, userId);
        if (instructor != null) {
            System.out.println("Instructor " + userId + " already exists.");
            return true;
        } else {
            System.out.println("Instructor does not exist.");
            return false;
        }
    }

    private static boolean isNumeric(String str) {
        return str.matches("-?\\d+(\\.\\d+)?");  //match a number with optional '-' and decimal.
    }
    /* End of methods for Instructor */
}
