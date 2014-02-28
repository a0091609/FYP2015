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
public interface QuestionBeanLocal
{

    public Boolean saveMultiChoice(String quizId, String questName, String questText,
            String option1, String option2, String option3, String option4, Integer answer);

}
