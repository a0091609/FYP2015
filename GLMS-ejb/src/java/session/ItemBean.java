/*
 * Stateless Session Bean for Item Operations
 */
package session;

import entity.Avatar;
import entity.Booster;
import entity.Item;
import entity.Key;
import entity.Module;
import entity.Pet;
import entity.Quest;
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
public class ItemBean implements ItemBeanLocal
{
    //Functionalities needed:        
    //  1. Retrieve all the Items for a particular module      [DONE!]
    //  2. Create a Style Item                                 [NOT DONE]
    //  3. Create a Pet                                        [DONE!]
    //  4. Create a Booster Pack                               [DONE!]
    //  5. Create a Quest Item                                 [DONE!]
    //  6. Delete an Item                                      [DONE!]

    @PersistenceContext
    private EntityManager em;

    @EJB
    QuestBeanLocal questBean;

    //Retrieve all the Items for a particular module
    public List<Item> getAllItems(String moduleId) throws Exception
    {
        em.flush();
        List<Item> moduleItems = new ArrayList();
        Query query = em.createQuery("SELECT i FROM Item i");
        if (!query.getResultList().isEmpty())
        {
            List<Item> allItems = new ArrayList(query.getResultList());

            for (Item item : allItems)
            {
                if (item.getModule().getModuleId().equals(moduleId) && !item.getStatus().equalsIgnoreCase("DELETED"))
                {
                    moduleItems.add(item);
                    System.out.println(item + "added to moduleItems list");
                }
            }
        }
        return moduleItems;
    }

    //This method creates a new Pet Item for a Module
    public void createPet(String moduleId, String name, String description, int cost, int bonus) throws Exception
    {
        Module module = getModule(moduleId);
        String imgURL = "Need to upload the image";
        Pet pet = new Pet();

        //Set all the item info
        pet.setName(name);
        pet.setDescription(description);
        pet.setCost(cost);
        pet.setMaxBonus(bonus);
        pet.setModule(module);
        pet.setImgURL(imgURL);
        pet.setStatus("AVAILABLE");

        //Add the Pet to appropriate Module and persist
        module.getItems().add(pet);
        em.persist(pet);
        em.persist(module);
        em.flush();
    }

    //This method creates a new Booster Item for a Module
    public void createBooster(String moduleId, String name, String description, String type, int cost, int bonus) throws Exception
    {
        Module module = getModule(moduleId);
        String imgURL = "Need to upload the image";
        String fileURL = "Need the URL of the file uploaded";
        Booster booster = new Booster();

        //Set all the item info
        booster.setName(name);
        booster.setDescription(description);
        booster.setCost(cost);
        booster.setModule(module);
        booster.setImgURL(imgURL);
        booster.setFileURL(fileURL);
        booster.setType(type);
        booster.setStatus("AVAILABLE");

        //Add the Booster to appropriate Module and persist
        module.getItems().add(booster);
        em.persist(booster);
        em.persist(module);
        em.flush();
    }

    //This method creates a new Key Item for a particular Quest in a Module
    public void createKey(String moduleId, Long questId, String name, String description, String type, int cost, int bonus) throws Exception
    {
        Module module = getModule(moduleId);
        Quest quest = getQuest(questId);
        String imgURL = "assets/img/key2.png";
        Key key = new Key();

        //Set all the item info
        key.setName(name);
        key.setDescription(description);
        key.setCost(cost);
        key.setImgURL(imgURL);
        key.setModule(module);
        key.setUnlock(quest);
        key.setStatus("AVAILABLE");

        //Add the Key to appropriate Module & Quest and persist
        module.getItems().add(key);
        quest.setKeyRequired(key);
        em.persist(key);
        em.persist(quest);
        em.persist(module);
        em.flush();
    }

    //This method creates a new Key Item for a particular Quest in a Module
    public void createKey2(Module mod, Quest q, Key k) throws Exception
    {
        em.persist(q);
        em.persist(k);
        em.persist(mod);
        em.flush();
    }

    //This method is used to set an item as DELETED
    public void deleteItem(Long itemId) throws Exception
    {
        Item item = getItem(itemId);
        item.setStatus("DELETED");
        em.persist(item);
        em.flush();
    }

    public void buyItem(String userId, String moduleId, Long itemId) throws Exception
    {
        Avatar student = questBean.getAvatar(userId, moduleId);
        Item item = getItem(itemId);
        Integer gold = student.getCurrentBalance() - item.getCost();

        //Deduct the monies
        student.setCurrentBalance(gold);
        //Give him the item
        student.getInventory().add(item);
        //Persist
        em.persist(student);
        em.flush();
    }

    //Helper method: retrieves the module based on moduleId
    private Module getModule(String moduleId) throws Exception
    {
        Module module = em.find(Module.class, moduleId);
        //Check if Module exists
        if (module == null)
        {
            throw new Exception("ERROR: MODULE DOES NOT EXIST!");
        }
        return module;
    }

    //Helper method: retrieves the quest based on questId
    private Quest getQuest(Long questId) throws Exception
    {
        Quest quest = em.find(Quest.class, questId);
        //Check if Quest exists
        if (quest == null)
        {
            throw new Exception("ERROR: QUEST DOES NOT EXIST!");
        }
        return quest;
    }

    //Helper method: retrieves the item based on itemId
    public Item getItem(Long itemId) throws Exception
    {
        Item item = em.find(Item.class, itemId);
        //Check if Item exists
        if (item == null || item.getStatus().equalsIgnoreCase("DELETED"))
        {
            throw new Exception("ERROR: ITEM DOES NOT EXIST!");
        }
        return item;
    }

}
