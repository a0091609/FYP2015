/*
 * Stateless Session Bean for Item Operations
 */
package session;

import entity.Item;
import java.util.List;
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

    //Retrieve all the Items for a particular module
    public List<Item> getAllItems(String moduleId) throws Exception
    {
//        em.flush();
//
//        ET_Administrator admin = getAdmin(userID);
//        List<ET_Coupon> allCpn = new ArrayList(admin.getCoupon());
//        List<ET_Coupon> savedCpns = new ArrayList();
//
//        for (ET_Coupon cpn : allCpn)
//        {
//            if (cpn.getCouponState().equals("saved"))
//            {
//                savedCpns.add(cpn);
//                System.out.println(cpn + "added to saved list");
//            }
//        }
//
//        return savedCpns;
        return null;
    }

}
