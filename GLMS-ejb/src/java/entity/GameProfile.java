package entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
@IdClass(GameProfileId.class)
public class GameProfile implements Serializable {

    @Id
    private String userId;
    @Id
    private String moduleId;
    private Integer expPoint;
    private Integer expLevel;

    @ManyToOne
    @PrimaryKeyJoinColumn(name = "USERID", referencedColumnName = "USERID")
    private Student student;
    @ManyToOne
    @PrimaryKeyJoinColumn(name = "MODULEID", referencedColumnName = "MODULEID")
    private Module module;

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
    public String toString() {
        return "entity.GameProfile[ userId=" + userId + " ]";
    }

}
