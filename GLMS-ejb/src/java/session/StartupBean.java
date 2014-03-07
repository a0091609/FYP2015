package session;

import javax.annotation.PostConstruct;
import javax.ejb.Singleton;
import javax.ejb.LocalBean;
import javax.ejb.Startup;

@Singleton
@LocalBean
@Startup
public class StartupBean {

    @PostConstruct
    private void init() {
    }
}
