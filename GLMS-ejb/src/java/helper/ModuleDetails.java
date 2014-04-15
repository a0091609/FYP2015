package helper;

import java.io.Serializable;

public class ModuleDetails implements Serializable {

    private String moduleId;
    private String moduleCode;
    private String moduleName;
    private Boolean activated;

    public ModuleDetails(String moduleId, String moduleCode, String moduleName) {
        this.moduleId = moduleId;
        this.moduleCode = moduleCode;
        this.moduleName = moduleName;
    }

    public ModuleDetails(String moduleId, String moduleCode, String moduleName, Boolean activated) {
        this.moduleId = moduleId;
        this.moduleCode = moduleCode;
        this.moduleName = moduleName;
        this.activated = activated;
    }

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

    public Boolean isActivated() {
        return activated;
    }

    public void setActivated(Boolean activated) {
        this.activated = activated;
    }

}
