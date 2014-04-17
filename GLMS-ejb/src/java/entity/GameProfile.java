package entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
public class GameProfile implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long profileId;
    private String userId;
    private String moduleId;
    private Integer expPoint;
    private Integer expLevel;

    @OneToMany(mappedBy = "profile")
    private List<QuizItem> items;

    @ManyToOne
    @PrimaryKeyJoinColumn(name = "USERID", referencedColumnName = "USERID")
    private Student student;
    @ManyToOne
    @PrimaryKeyJoinColumn(name = "MODULEID", referencedColumnName = "MODULEID")
    private Module module;

    public Long getProfileId() {
        return profileId;
    }

    public void setProfileId(Long profileId) {
        this.profileId = profileId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getModuleId() {
        return moduleId;
    }

    public void setModuleId(String moduleId) {
        this.moduleId = moduleId;
    }

    public Integer getExpPoint() {
        return expPoint;
    }

    public void setExpPoint(Integer expPoint) {
        this.expPoint = expPoint;
    }

    public Integer getExpLevel() {
        return expLevel;
    }

    public void setExpLevel(Integer expLevel) {
        this.expLevel = expLevel;
    }

    public List<QuizItem> getItems() {
        return items;
    }

    public void setItems(List<QuizItem> items) {
        this.items = items;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (profileId != null ? profileId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GameProfile)) {
            return false;
        }
        GameProfile other = (GameProfile) object;
        if ((this.profileId == null && other.profileId != null) || (this.profileId != null && !this.profileId.equals(other.profileId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.GameProfile[ profileId=" + profileId + " ]";
    }

}
