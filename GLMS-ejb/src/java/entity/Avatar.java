/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 *
 * @author Philson
 */
@Entity
public class Avatar implements Serializable
{
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String avatarName;
    private String avatarBio;
    private String status;
    private Integer currentBalance;
    private Integer lifetimeEarnings;
    
    @OneToOne(mappedBy="avatar")
    private Student student;
    @ManyToMany
    private List<Item> inventory;
    @ManyToMany
    private List<Quest> questsCompleted;
    @ManyToMany
    private List<JobClass> jobClasses;
    @OneToMany
    private List<Skill> skills;
    @ManyToOne
    private Module module;

    
    public String getAvatarName()
    {
        return avatarName;
    }

    public void setAvatarName(String avatarName)
    {
        this.avatarName = avatarName;
    }

    public String getAvatarBio()
    {
        return avatarBio;
    }

    public void setAvatarBio(String avatarBio)
    {
        this.avatarBio = avatarBio;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public Integer getCurrentBalance()
    {
        return currentBalance;
    }

    public void setCurrentBalance(Integer currentBalance)
    {
        this.currentBalance = currentBalance;
    }

    public Integer getLifetimeEarnings()
    {
        return lifetimeEarnings;
    }

    public void setLifetimeEarnings(Integer lifetimeEarnings)
    {
        this.lifetimeEarnings = lifetimeEarnings;
    }

    public Student getStudent()
    {
        return student;
    }

    public void setStudent(Student student)
    {
        this.student = student;
    }

    public List<Item> getInventory()
    {
        return inventory;
    }

    public void setInventory(List<Item> inventory)
    {
        this.inventory = inventory;
    }

    public List<Quest> getQuestsCompleted()
    {
        return questsCompleted;
    }

    public void setQuestsCompleted(List<Quest> questsCompleted)
    {
        this.questsCompleted = questsCompleted;
    }

    public List<JobClass> getJobClasses()
    {
        return jobClasses;
    }

    public void setJobClasses(List<JobClass> jobClasses)
    {
        this.jobClasses = jobClasses;
    }

    public List<Skill> getSkills()
    {
        return skills;
    }

    public void setSkills(List<Skill> skills)
    {
        this.skills = skills;
    }

    public Module getModule()
    {
        return module;
    }

    public void setModule(Module module)
    {
        this.module = module;
    }
    
    
    
    

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Avatar))
        {
            return false;
        }
        Avatar other = (Avatar) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id)))
            return false;
        return true;
    }

    @Override
    public String toString()
    {
        return "entity.Avatar[ id=" + id + " ]";
    }
    
}
