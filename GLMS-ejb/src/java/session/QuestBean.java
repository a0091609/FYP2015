/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.Avatar;
import entity.Item;
import entity.Key;
import entity.Module;
import entity.Quest;
import entity.Skill;
import entity.Student;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Philson
 */
@Stateless
public class QuestBean implements QuestBeanLocal
{
    //Functionalities needed:        
    //  1. Retrieve all Quests for a module             [DONE!]
    //  2. Retrieve all Quests submitted by Avatar      [DONE!] //Just use the dot
    //  3. Retrieve all Keys owned by Avatar            [DONE!]
    //  4. Retrieve all details for partcular Quest     [DONE!]
    //  5. Submit a quest and update rewards            [NOT DONE]
    //  6. Notify user of their accomplishment          [NOT DONE]

    @PersistenceContext
    private EntityManager em;

    @EJB
    ModuleBeanLocal moduleBean;

    public void createQuest(Module m, Skill s, Quest q)
    {
        em.persist(s);
        em.persist(q);
        em.persist(m);
        em.flush();
    }

    //Retrieve all the Items for a particular module
    public List<Quest> getAllQuests(String moduleId) throws Exception
    {
        em.flush();
        Module mod = moduleBean.getModule(moduleId);
        Query query = em.createQuery("SELECT q FROM Quest q");
        List<Quest> allQuests = new ArrayList(query.getResultList());
        List<Quest> moduleQuests = new ArrayList();

        for (Quest quest : allQuests)
        {
            if (quest.getModule().equals(mod))
            {
                moduleQuests.add(quest);
            }
        }
        System.out.println("QUEST LIST: " + moduleQuests);
        return moduleQuests;
    }

    public void submitQuest(Long questID, String userId, String moduleId) throws Exception
    {
        Avatar student = getAvatar(userId, moduleId);
        Quest quest = getQuest(questID);
        Integer goldReward = quest.getGoldReward();
        Skill skillReward = quest.getSkillReward();

        //Add the quest to completed list
        student.getQuestsCompleted().add(quest);

        //Add the gold rewards both lifetime and current
        student.setCurrentBalance(student.getCurrentBalance() + goldReward);
        student.setLifetimeEarnings(student.getLifetimeEarnings() + goldReward);

        //Add the skill points
        List<Skill> mySkills = student.getSkills();
        boolean exist = false;
        for (Skill s : mySkills)
        {
            if (s.getName().equalsIgnoreCase(skillReward.getName()))
            {
                exist = true;
                s.setSkillPoints(s.getSkillPoints()+skillReward.getSkillPoints());
            }
        }
        if(!exist)
        {
            student.getSkills().add(skillReward);
        }

        //Persist everything
        em.persist(student);
        em.flush();
    }

    public Avatar getAvatar(String userId, String moduleId) throws Exception
    {
        Student student = em.find(Student.class, userId);
        Module module = moduleBean.getModule(moduleId);
        if (student == null)
        {
            throw new Exception("ERROR: STUDENT DOES NOT EXIST!");
        }
        else
        {
            for (Avatar a : student.getAvatars())
            {
                if (a.getModule().equals(module))
                {
                    return a;
                }
            }
        }
        return null;
    }

    public Quest getQuest(Long ID) throws Exception
    {
        Quest quest = em.find(Quest.class, ID);
        //Check if Module exists
        if (quest == null)
        {
            throw new Exception("ERROR: QUEST DOES NOT EXIST!");
        }
        return quest;
    }

    public List<Key> getStudentKeys(Avatar stud)
    {
        List<Item> inventory = new ArrayList(stud.getInventory());
        List<Key> keys = new ArrayList();

        for (Item item : inventory)
        {
            if (item instanceof Key)
            {
                Key key = (Key) item;
                keys.add(key);
            }
        }
        System.out.println("List of Keys: " + keys);
        return keys;
    }
    
}
