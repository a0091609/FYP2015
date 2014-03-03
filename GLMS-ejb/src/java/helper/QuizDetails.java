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
    private String descr;
    //private Integer timeLimit;      // in minits
    private String difficultyLvl;
    private Boolean active;
    @Temporal(TemporalType.DATE)
    private Date dateOpen;
    @Temporal(TemporalType.DATE)
    private Date dateClose;
    @Temporal(TemporalType.TIMESTAMP)
    private Date timeCreated;

    public QuizDetails(String name, String descr, String difficultyLvl, Date dateOpen, Date dateClose, Date timeCreated) {
        this.name = name;
        this.descr = descr;
        this.difficultyLvl = difficultyLvl;
        this.dateOpen = dateOpen;
        this.dateClose = dateClose;
        this.timeCreated = timeCreated;
    }
    
    public QuizDetails(String name, String descr, String difficultyLvl, Date dateOpen, Date dateClose) {
        this.name = name;
        this.descr = descr;
        this.difficultyLvl = difficultyLvl;
        this.dateOpen = dateOpen;
        this.dateClose = dateClose;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public String getDifficultyLvl() {
        return difficultyLvl;
    }

    public void setDifficultyLvl(String difficultyLvl) {
        this.difficultyLvl = difficultyLvl;
    }

    public Boolean isActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public Date getDateOpen() {
        return dateOpen;
    }

    public void setDateOpen(Date dateOpen) {
        this.dateOpen = dateOpen;
    }

    public Date getDateClose() {
        return dateClose;
    }

    public void setDateClose(Date dateClose) {
        this.dateClose = dateClose;
    }

    public Date getTimeCreated() {
        return timeCreated;
    }

    public void setTimeCreated(Date timeCreated) {
        this.timeCreated = timeCreated;
    }

}
