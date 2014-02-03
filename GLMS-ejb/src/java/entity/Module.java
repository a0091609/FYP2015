package entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author Chih Yong
 */
@Entity
public class Module implements Serializable
{
    /* Fields to be added: quiz */

    private static final long serialVersionUID = 1L;
    @Id
    private String moduleId;
    private String moduleCode;
    private String moduleName;
    @ManyToOne
    @JoinColumn(name = "CREATORUSERID")
    private Instructor creator;
    private Boolean isActive;

    public String getModuleId() {
        return moduleId;
    }

    public void setModuleId(String moduleId) {
        this.moduleId = moduleId;
    }

    public String getModuleCode() {
        return moduleCode;
    }

    public void setModuleCode(String moduleCode) {
        this.moduleCode = moduleCode;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public Instructor getCreator() {
        return creator;
    }

    public void setCreator(Instructor creator) {
        this.creator = creator;
    }

    public Boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (moduleId != null ? moduleId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Module)) {
            return false;
        }
        Module other = (Module) object;
        if ((this.moduleId == null && other.moduleId != null) || (this.moduleId != null && !this.moduleId.equals(other.moduleId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Module[ moduleId=" + moduleId + " ]";
    }

}
