package session;

import entity.GameProfile;
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
                System.out.println("New module " + moduleId + " created.");
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

                GameProfile gameProfile = new GameProfile();
                gameProfile.setStudent(student);
                gameProfile.setModule(module);
                gameProfile.setUserId(student.getUserId());
                gameProfile.setModuleId(moduleId);
                gameProfile.setExpPoint(0);
                gameProfile.setExpLevel(0);
                gameProfile.setStreak(0);

                //CY Link
                module.getStudentList().add(gameProfile);
                student.getModuleList().add(gameProfile);
                //Phil Link
                student.getModules().add(module);
                module.getStudents().add(student);

                em.persist(module);
                em.persist(gameProfile);
                em.persist(student);
                em.flush();

                System.out.println("Module initiated: " + module.getModuleId());
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
            System.out.println("Module " + moduleId + " does not exist.");
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

    //Helper method: retrieves the module based on moduleId
    public Module getModule(String moduleId) throws Exception {
        Module module = em.find(Module.class, moduleId);
        //Check if Item exists
        if (module == null) {
            throw new Exception("ERROR: MODULE DOES NOT EXIST!");
        }
        return module;
    }
}
