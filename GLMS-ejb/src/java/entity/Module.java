package entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 *
 * @author Chih Yong
 */
@Entity
public class Module implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    private String moduleId;
    private String moduleCode;
    private String moduleName;
    private String descr;
    private Boolean activated;
    @ManyToOne
    @JoinColumn(name = "CREATORUSERID")
    private Instructor creator;
    @ManyToMany
    private List<Student> students;
    @OneToMany(mappedBy = "module")
    private List<Item> items;
    @OneToMany(mappedBy = "module")
    private List<Quest> quests;
    @OneToMany(mappedBy = "module")
    private List<JobClass> jobs;

    public List<JobClass> getJobs()
    {
        return jobs;
    }

    public void setJobs(List<JobClass> jobs)
    {
        this.jobs = jobs;
    }

    public List<Quest> getQuests()
    {
        return quests;
    }

    public void setQuests(List<Quest> quests)
    {
        this.quests = quests;
    }

    public List<Item> getItems()
    {
        return items;
    }

    public void setItems(List<Item> items)
    {
        this.items = items;
    }

    public String getModuleId()
    {
        return moduleId;
    }

    public void setModuleId(String moduleId)
    {
        this.moduleId = moduleId;
    }

    public String getModuleCode()
    {
        return moduleCode;
    }

    public void setModuleCode(String moduleCode)
    {
        this.moduleCode = moduleCode;
    }

    public String getModuleName()
    {
        return moduleName;
    }

    public void setModuleName(String moduleName)
    {
        this.moduleName = moduleName;
    }

    public String getDescr()
    {
        return descr;
    }

    public void setDescr(String descr)
    {
        this.descr = descr;
    }

    public Boolean isActivated()
    {
        return activated;
    }

    public void setActivated(Boolean activated)
    {
        this.activated = activated;
    }

    public Instructor getCreator()
    {
        return creator;
    }

    public void setCreator(Instructor creator)
    {
        this.creator = creator;
    }

    public List<Student> getStudents()
    {
        return students;
    }

    public void setStudents(List<Student> students)
    {
        this.students = students;
    }

    public void addStudent(Student student)
    {
        if (!getStudents().contains(student))
        {
            getStudents().add(student);
        }
        if (!student.getModules().contains(this))
        {
            student.getModules().add(this);
        }
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (moduleId != null ? moduleId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Module))
        {
            return false;
        }
        Module other = (Module) object;
        if ((this.moduleId == null && other.moduleId != null) || (this.moduleId != null && !this.moduleId.equals(other.moduleId)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "entity.Module[ moduleId=" + moduleId + " ]";
    }

}
