package session;

import entity.Student;
import javax.ejb.Local;

@Local
public interface AccountBeanLocal {

    /* Methods for Student */
    public Boolean createStudent(String userId, String name, String email, String gender, String faculty, String firstMajor, String secondMajor, Integer matriculationYear);

    public Boolean isStudent(String userId);
    /* End of methods for Student */

    /* Methods for Instructor */
    public Boolean createInstructor(String userId, String name, String email, String gender, String faculty);

    public Boolean isInstructorUserId(String userId);

    public Boolean isInstructor(String userId);

    /* End of methods for Instructor */

    public Boolean createStudent(Student stud);
}
