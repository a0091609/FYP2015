package entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Student implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    private String userId;
    private String name;
    private String email;
    private String gender;              // male or female
    private String faculty;
    private String firstMajor;
    private String secondMajor;
    private Integer matriculationYear;
    @OneToMany(mappedBy = "student")
    private List<GameProfile> moduleList;
    @ManyToMany(mappedBy = "students")
    private List<Module> modules;
    @JoinTable(name = "buddyList")
    @ManyToMany
    private List<Student> buddies;

    @OneToMany(mappedBy = "student")
    private List<Avatar> avatars;

    public List<Avatar> getAvatars()
    {
        return avatars;
    }

    public void setAvatars(List<Avatar> avatars)
    {
        this.avatars = avatars;
    }

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getGender()
    {
        return gender;
    }

    public void setGender(String gender)
    {
        this.gender = gender;
    }

    public String getFaculty()
    {
        return faculty;
    }

    public void setFaculty(String faculty)
    {
        this.faculty = faculty;
    }

    public String getFirstMajor()
    {
        return firstMajor;
    }

    public void setFirstMajor(String firstMajor)
    {
        this.firstMajor = firstMajor;
    }

    public String getSecondMajor()
    {
        return secondMajor;
    }

    public void setSecondMajor(String secondMajor)
    {
        this.secondMajor = secondMajor;
    }

    public Integer getMatriculationYear()
    {
        return matriculationYear;
    }

    public void setMatriculationYear(Integer matriculationYear)
    {
        this.matriculationYear = matriculationYear;
    }

    public List<GameProfile> getModuleList()
    {
        return moduleList;
    }

    public void setModuleList(List<GameProfile> moduleList)
    {
        this.moduleList = moduleList;
    }

    public List<Module> getModules()
    {
        return modules;
    }

    public void setModules(List<Module> modules)
    {
        this.modules = modules;
    }

    public void addModule(Module module)
    {
        if (!getModules().contains(module))
        {
            getModules().add(module);
        }
        if (!module.getStudents().contains(this))
        {
            module.getStudents().add(this);
        }
    }

    public List<Student> getBuddies()
    {
        return buddies;
    }

    public void setBuddies(List<Student> buddies)
    {
        this.buddies = buddies;
    }

    public void addStudent(Student student)
    {
        if (!getBuddies().contains(student))
        {
            getBuddies().add(student);
        }
        if (!student.getBuddies().contains(this))
        {
            student.getBuddies().add(this);
        }
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (userId != null ? userId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Student))
        {
            return false;
        }
        Student other = (Student) object;
        if ((this.userId == null && other.userId != null) || (this.userId != null && !this.userId.equals(other.userId)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "entity.Student[ userId=" + userId + " ]";
    }

}