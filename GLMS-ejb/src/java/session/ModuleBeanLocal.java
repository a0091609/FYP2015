package session;

import java.util.List;
import javax.ejb.Local;

@Local
public interface ModuleBeanLocal {

    public Boolean createModule(String moduleId, String moduleCode, String moduleName, String moduleCreator);

    public Boolean saveStudentModule(String moduleId, String moduleCode, String moduleName, String moduleCreator, String userid);

    public Boolean isModule(String moduleId);

    public List getInstructorModules(String userId);

    public List getStudentModules(String userId);

}
