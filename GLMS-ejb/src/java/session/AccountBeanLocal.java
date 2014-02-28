/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import javax.ejb.Local;

/**
 *
 * @author Chih Yong
 */
@Local
public interface AccountBeanLocal
{

    /* Methods for Student */
    public void createStudent(String userId, String name, String email, String gender, String faculty, String firstMajor, String secondMajor, Integer matriculationYear);

    public Boolean isStudent(String userId);
    /* End of methods for Student */

    /* Methods for Instructor */
    public Boolean createInstructor(String userId, String name, String email, String gender, String faculty);

    public Boolean isInstructorUserId(String userId);

    public Boolean isInstructor(String userId);

    /* End of methods for Instructor */
}
