package entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Quiz implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long quizId;
    private String name;
    private String descr;
    private String difficultyLvl;
    private Boolean active;
    @Temporal(TemporalType.DATE)
    private Date dateOpen;
    @Temporal(TemporalType.DATE)
    private Date dateClose;
    private String status;
    @OneToOne
    private Quiz prereq;
    @Temporal(TemporalType.TIMESTAMP)
    private Date timeCreated;

    @ManyToOne
    @JoinColumn(name = "MODULEID")
    private Module module;

    @OneToMany(mappedBy = "quiz")
    private List<QuizSession> students;

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

    public Date getTimeCreated() {
        return timeCreated;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Quiz getPrereq() {
        return prereq;
    }

    public void setPrereq(Quiz prereq) {
        this.prereq = prereq;
    }

    public void setTimeCreated(Date timeCreated) {
        this.timeCreated = timeCreated;
    }

    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }

    public List<QuizSession> getStudents() {
        return students;
    }

    public void setStudents(List<QuizSession> students) {
        this.students = students;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (quizId != null ? quizId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Quiz)) {
            return false;
        }
        Quiz other = (Quiz) object;
        if ((this.quizId == null && other.quizId != null) || (this.quizId != null && !this.quizId.equals(other.quizId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Quiz[ quizId=" + quizId + " ]";
    }

}
