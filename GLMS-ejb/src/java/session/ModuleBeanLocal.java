/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Chih Yong
 */
@Local
public interface ModuleBeanLocal
{

    public void createModule(String moduleId, String moduleCode, String moduleName, String moduleCreator);

    public Boolean isModule(String moduleId);

    public List getInstructorModules(String userId);

}
