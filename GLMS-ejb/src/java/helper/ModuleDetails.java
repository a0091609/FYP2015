package helper;

import java.io.Serializable;

/**
 *
 * @author Chih Yong
 */
public class ModuleDetails implements Serializable {

    private String moduleId;
    private String moduleCode;
    private String moduleName;

    public ModuleDetails(String moduleId, String moduleCode, String moduleName) {
        this.moduleId = moduleId;
        this.moduleCode = moduleCode;
        this.moduleName = moduleName;
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
    
    
}
