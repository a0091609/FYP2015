package session;

import entity.Instructor;
import entity.Module;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Chih Yong
 */
@Stateless
public class ModuleBean implements ModuleBeanLocal
{

    @PersistenceContext
    private EntityManager em;

    public Boolean createModule(String moduleId, String moduleCode, String moduleName, String moduleCreator, Boolean isActivated) {
        try {
            if (!isModule(moduleId)) {
                Module module = new Module();

                module.setModuleId(moduleId);
                module.setModuleCode(moduleCode);
                module.setModuleName(moduleName);
                module.setActivated(isActivated);

                Instructor instructor = em.find(Instructor.class, moduleCreator);
                module.setCreator(instructor);

                em.persist(module);
                System.out.println("New module created.");
            }
            else {
                System.out.println("Module " + moduleCode + " " + moduleName + " already exists.");
            }
            return true;
        }
        catch (Exception e) {
            return false;
        }
    }

    public Boolean isModule(String moduleId) {
        Module module = em.find(Module.class, moduleId);

        if (module != null) {
            return true;
        }
        else {
            System.out.println("Module does not exist.");
            return false;
        }
    }

    public List getInstructorModules(String userId) {
        Query q = em.createQuery("SELECT m FROM Module m WHERE m.creator.userId = '" + userId + "'");

        return q.getResultList();
    }
}
