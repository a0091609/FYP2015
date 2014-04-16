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
    //  1. Retrieve all Quests for a module             [NOT DONE]
    //  2. Retrieve all Quests submitted by Avatar      [DONE!] //Just use the dot
    //  3. Retrieve all Keys owned by Avatar            [DONE!]
    //  4. Retrieve all details for partcular Quest     [DONE!]
    //  5. Submit a quest and update rewards            [NOT DONE]
    //  6. Notify user of their accomplishment          [NOT DONE]

    @PersistenceContext
    private EntityManager em;

    @EJB
    ModuleBeanLocal moduleBean;

    //Retrieve all the Items for a particular module
    public List<Quest> getAllQuests(String moduleId) throws Exception
    {
        em.flush();
        Query query = em.createQuery("SELECT q FROM Quest q");
        List<Quest> allQuests = new ArrayList(query.getResultList());
        List<Quest> moduleQuests = new ArrayList();

        for (Quest quest : allQuests)
        {
            if (quest.getModule().equals(moduleId))
            {
                moduleQuests.add(quest);
            }
        }
        System.out.println("QUEST LIST: " + moduleQuests);
        return moduleQuests;
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
