package session;

import entity.Avatar;
import entity.Instructor;
import entity.Student;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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
