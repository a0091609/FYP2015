/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package session;

import entity.Item;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Philson
 */
@Local
public interface ItemBeanLocal
{

    public Item getItem(Long itemId) throws Exception;

    public void deleteItem(Long itemId) throws Exception;

    public void createKey(String moduleId, Long questId, String name, String description, String type, int cost, int bonus) throws Exception;

    public void createBooster(String moduleId, String name, String description, String type, int cost, int bonus) throws Exception;

    public void createPet(String moduleId, String name, String description, int cost, int bonus) throws Exception;

    public List<Item> getAllItems(String moduleId) throws Exception;
    
}
