package helper;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Chih Yong
 */
public class QuizDetails implements Serializable {

    private Long quizId;
    private String name;
    private String descr;
    //private Integer timeLimit;      // in minits
    private String difficultyLvl;
    private Boolean active;
    private String dateOpen;
    private String dateClose;
    private String status;
    @Temporal(TemporalType.TIMESTAMP)
    private Date timeCreated;

    public QuizDetails(String name, String descr, String difficultyLvl, String dateOpen, String dateClose, Date timeCreated) {
        this.name = name;
        this.descr = descr;
        this.difficultyLvl = difficultyLvl;
        this.dateOpen = dateOpen;
        this.dateClose = dateClose;
        this.timeCreated = timeCreated;
    }

    public QuizDetails(Long quizId, String name, String descr, String difficultyLvl, String dateOpen, String dateClose, Boolean active, String status) {
        this.quizId = quizId;
        this.name = name;
        this.descr = descr;
        this.difficultyLvl = difficultyLvl;
        this.dateOpen = dateOpen;
        this.dateClose = dateClose;
        this.active = active;
        this.status = status;
    }

    public Long getQuizId() {
        return quizId;
    }

    public void setQuizId(Long quizId) {
        this.quizId = quizId;
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

    public String getDateOpen() {
        return dateOpen;
    }

    public void setDateOpen(String dateOpen) {
        this.dateOpen = dateOpen;
    }

    public String getDateClose() {
        return dateClose;
    }

    public void setDateClose(String dateClose) {
        this.dateClose = dateClose;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getTimeCreated() {
        return timeCreated;
    }

    public void setTimeCreated(Date timeCreated) {
        this.timeCreated = timeCreated;
    }

}
