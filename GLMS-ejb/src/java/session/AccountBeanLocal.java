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

    public void createStudent(String userId, String name, String email, String gender, String faculty, String firstMajor, String secondMajor, Integer matriculationYear);

    public Boolean isStudent(String userId);

}
