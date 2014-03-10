/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author Philson
 */
@Entity
public class Pet extends Item implements Serializable
{
    private Integer cost;
    private Integer maxBonus;

    public Integer getCost()
    {
        return cost;
    }

    public void setCost(Integer cost)
    {
        this.cost = cost;
    }

    public Integer getMaxBonus()
    {
        return maxBonus;
    }

    public void setMaxBonus(Integer maxBonus)
    {
        this.maxBonus = maxBonus;
    }
}
