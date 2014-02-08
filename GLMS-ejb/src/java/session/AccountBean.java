package session;

import entity.Instructor;
import entity.Student;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Chih Yong
 */
@Stateless
public class AccountBean implements AccountBeanLocal
{

    @PersistenceContext
    private EntityManager em;

    /* Methods for Student */
    public void createStudent(String userId, String name, String email, String gender,
            String faculty, String firstMajor, String secondMajor, Integer matriculationYear) {

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
            System.out.println("New student created.");
        }
    }

    public Boolean isStudent(String userId) {
        Student student = em.find(Student.class, userId);

        if (student != null) {
            return true;
        }
        else {
            System.out.println("Student does not exist.");
            return false;
        }
    }
    /* End of methods for Student */

    /* Methods for Instructor */
    public void createInstructor(String userId, String name, String email, String gender,
            String faculty) {

        if (!isInstructor(userId) && isInstructorUserId(userId)) {
            Instructor instructor = new Instructor();

            instructor.setUserId(userId);
            instructor.setName(name);
            instructor.setEmail(email);
            instructor.setGender(gender.toLowerCase());
            instructor.setFaculty(faculty);

            em.persist(instructor);
            System.out.println("New instructor created.");
        }
    }

    public Boolean isInstructorUserId(String userId) {
        if (userId.length() > 4 && !isNumeric(userId.substring(4))) {
            return true;
        }
        else {
            return false;
        }
    }

    public Boolean isInstructor(String userId) {
        Instructor instructor = em.find(Instructor.class, userId);
        if (instructor != null) {
            return true;
        }
        else {
            System.out.println("Instructor does not exist.");
            return false;
        }
    }

    private static boolean isNumeric(String str) {
        return str.matches("-?\\d+(\\.\\d+)?");  //match a number with optional '-' and decimal.
    }
    /* End of methods for Instructor */
}
