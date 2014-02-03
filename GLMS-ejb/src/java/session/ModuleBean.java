package session;

import entity.Instructor;
import entity.Module;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Chih Yong
 */
@Stateless
public class ModuleBean implements ModuleBeanLocal
{

    @PersistenceContext
    private EntityManager em;

    public void createModule(String moduleId, String moduleCode, String moduleName, String moduleCreator) {
        if (!isModule(moduleId)) {
            Module module = new Module();

            module.setModuleId(moduleId);
            module.setModuleCode(moduleCode);
            module.setModuleName(moduleName);

            Instructor instructor = em.find(Instructor.class, moduleCreator);
            module.setCreator(instructor);

            em.persist(module);
            System.out.println("New module created.");
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
}
