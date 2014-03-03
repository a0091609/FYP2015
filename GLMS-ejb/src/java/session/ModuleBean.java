package session;

import entity.Instructor;
import entity.Module;
import entity.Student;
import helper.ModuleDetails;
import java.util.ArrayList;
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
public class ModuleBean implements ModuleBeanLocal {

    @PersistenceContext
    private EntityManager em;

    public Boolean createModule(String moduleId, String moduleCode, String moduleName, String moduleCreator) {
        try {
            if (!isModule(moduleId)) {
                Module module = new Module();

                module.setModuleId(moduleId);
                module.setModuleCode(moduleCode);
                module.setModuleName(moduleName);
                module.setActivated(false);     // set false for modules without gamification features

                Instructor instructor = em.find(Instructor.class, moduleCreator);
                module.setCreator(instructor);

                em.persist(module);
                em.flush();
                System.out.println("New module created.");
            } else {
                System.out.println("Module " + moduleCode + " " + moduleName + " already exists.");
            }
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public Boolean saveStudentModule(String moduleId, String moduleCode, String moduleName, String moduleCreator, String userId) {
        try {
            if (!isModule(moduleId)) {
                createModule(moduleId, moduleCode, moduleName, moduleCreator);

                Student student = em.find(Student.class, userId);
                Module module = em.find(Module.class, moduleId);

                student.addModule(module);
                em.persist(module);
                em.persist(student);
            }

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public Boolean isModule(String moduleId) {
        Module module = em.find(Module.class, moduleId);

        if (module != null) {
            return true;
        } else {
            System.out.println("Module does not exist.");
            return false;
        }
    }

    public List<ModuleDetails> getInstructorModules(String userId) {
        Query q = em.createQuery("SELECT m FROM Module m WHERE m.creator.userId = '" + userId + "'");

        List<Module> moduleList = q.getResultList();

        ArrayList<ModuleDetails> modules = new ArrayList<ModuleDetails>();

        for (Module module : moduleList) {
            ModuleDetails quizDetails = new ModuleDetails(module.getModuleId(), module.getModuleCode(), module.getModuleName(), module.isActivated());
            modules.add(quizDetails);
        }

        return modules;
    }

    public List<ModuleDetails> getStudentModules(String userId) {
        Student student = em.find(Student.class, userId);
        List<Module> moduleList = student.getModules();

        ArrayList<ModuleDetails> modules = new ArrayList<ModuleDetails>();

        for (Module module : moduleList) {
            ModuleDetails quizDetails = new ModuleDetails(module.getModuleId(), module.getModuleCode(), module.getModuleName());
            modules.add(quizDetails);
        }

        return modules;
    }
}
