/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Chih Yong
 */
@Entity
public class Module implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    private String moduleId;
    private String moduleCode;
    private String moduleName;
    private String moduleSemester;
    private String moduleAcadYear;
    @Temporal(TemporalType.DATE)
    private Date moduleOpenDate;
    private Boolean isActive;

    // To be added: creator, quiz
    //
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

    public String getModuleSemester() {
        return moduleSemester;
    }

    public void setModuleSemester(String moduleSemester) {
        this.moduleSemester = moduleSemester;
    }

    public String getModuleAcadYear() {
        return moduleAcadYear;
    }

    public void setModuleAcadYear(String moduleAcadYear) {
        this.moduleAcadYear = moduleAcadYear;
    }

    public Date getModuleOpenDate() {
        return moduleOpenDate;
    }

    public void setModuleOpenDate(Date moduleOpenDate) {
        this.moduleOpenDate = moduleOpenDate;
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
