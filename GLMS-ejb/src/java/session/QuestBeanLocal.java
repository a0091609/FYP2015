/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package session;

import entity.Avatar;
import entity.Key;
import entity.Quest;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Philson
 */
@Local
public interface QuestBeanLocal
{

    public List<Key> getStudentKeys(Avatar stud);

    public Quest getQuest(Long ID) throws Exception;

    public Avatar getAvatar(String userId) throws Exception;

    public List<Quest> getAllQuests(String moduleId) throws Exception;
    
}
