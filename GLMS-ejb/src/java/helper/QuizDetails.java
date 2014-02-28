package helper;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Chih Yong
 */
public class QuizDetails implements Serializable
{

    private String name;
    private String intro;
    //private Integer timeLimit;      // in minits
    private Boolean isActive;
    @Temporal(TemporalType.TIMESTAMP)
    private Date timeCreated;

    public QuizDetails(String name, String intro, Boolean isActive, Date timeCreated) {
        this.name = name;
        this.intro = intro;
        this.isActive = isActive;
        this.timeCreated = timeCreated;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public Boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    public Date getTimeCreated() {
        return timeCreated;
    }

    public void setTimeCreated(Date timeCreated) {
        this.timeCreated = timeCreated;
    }

}
