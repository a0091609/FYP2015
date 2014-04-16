package entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@IdClass(QuizSessionId.class)
public class QuizSession implements Serializable {

    @Id
    private String userId;
    @Id
    private Long quizId;
    @Temporal(TemporalType.TIMESTAMP)
    private Date timeStarted;
    @Temporal(TemporalType.TIMESTAMP)
    private Date timeCompleted;
    private String status;      //complete or incomplete

    @ManyToOne
    @PrimaryKeyJoinColumn(name = "USERID", referencedColumnName = "USERID")
    private Student student;
    @ManyToOne
    @PrimaryKeyJoinColumn(name = "QUIZID", referencedColumnName = "QUIZID")
    private Quiz quiz;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Long getQuizId() {
        return quizId;
    }

    public void setQuizId(Long quizId) {
        this.quizId = quizId;
    }

    public Date getTimeStarted() {
        return timeStarted;
    }

    public void setTimeStarted(Date timeStarted) {
        this.timeStarted = timeStarted;
    }

    public Date getTimeCompleted() {
        return timeCompleted;
    }

    public void setTimeCompleted(Date timeCompleted) {
        this.timeCompleted = timeCompleted;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Quiz getQuiz() {
        return quiz;
    }

    public void setQuiz(Quiz quiz) {
        this.quiz = quiz;
    }

    @Override
    public String toString() {
        return "entity.QuizSession[ userId=" + userId + " ]";
    }

}
