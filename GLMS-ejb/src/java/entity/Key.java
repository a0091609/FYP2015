/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

/**
 *
 * @author Philson
 */
@Entity
public class Key extends Item implements Serializable
{
    private Integer cost;
    @OneToOne(mappedBy="keyRequired")
    private Quest unlock;

    public Integer getCost()
    {
        return cost;
    }

    public void setCost(Integer cost)
    {
        this.cost = cost;
    }

    public Quest getUnlock()
    {
        return unlock;
    }

    public void setUnlock(Quest unlock)
    {
        this.unlock = unlock;
    }
}
