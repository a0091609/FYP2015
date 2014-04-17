package entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class QuizItem implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long quizItemId;
    private String name;
    private Integer qty;

    @ManyToOne
    private GameProfile profile;

    public Long getQuizItemId() {
        return quizItemId;
    }

    public void setQuizItemId(Long quizItemId) {
        this.quizItemId = quizItemId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(Integer qty) {
        this.qty = qty;
    }

    public GameProfile getProfile() {
        return profile;
    }

    public void setProfile(GameProfile profile) {
        this.profile = profile;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (quizItemId != null ? quizItemId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof QuizItem)) {
            return false;
        }
        QuizItem other = (QuizItem) object;
        if ((this.quizItemId == null && other.quizItemId != null) || (this.quizItemId != null && !this.quizItemId.equals(other.quizItemId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.QuizItem[ quizItemId=" + quizItemId + " ]";
    }

}
