/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

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
}
