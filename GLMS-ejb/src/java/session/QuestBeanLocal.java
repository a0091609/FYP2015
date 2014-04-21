/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package session;

import entity.Avatar;
import entity.Key;
import entity.Module;
import entity.Quest;
import entity.Skill;
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

    public List<Quest> getAllQuests(String moduleId) throws Exception;

    public Avatar getAvatar(String userId, String moduleId) throws Exception;

    public void createQuest(Module m, Skill s, Quest q);

    public void submitQuest(Long questID, String userId, String moduleId) throws Exception;

    public void increaseGold(String userId, String moduleId, Integer goldReward) throws Exception;
    
}
