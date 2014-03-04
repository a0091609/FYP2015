/*
 * Stateless Session Bean for Item Operations
 */
package session;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Philson
 */
@Stateless
public class ItemBean implements ItemBeanLocal
{
    //Functionalities needed:        
        //  1. Retrieve all the Items for a particular module      [NOT DONE]
        //  2. Create a Style Item                                 [NOT DONE]
        //  3. Create a Pet                                        [NOT DONE]
        //  4. Create a Booster Pack                               [NOT DONE]
        //  5. Create a Quest Item                                 [NOT DONE]
        //  6. Delete an Item                                      [NOT DONE]
    
    @PersistenceContext
    private EntityManager em;
    
}
