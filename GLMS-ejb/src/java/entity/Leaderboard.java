package entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Leaderboard implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long leaderboardId;
    private String userId;
    private String moduleId;
    private Integer totalPoints;

    public Long getLeaderboardId() {
        return leaderboardId;
    }

    public void setLeaderboardId(Long leaderboardId) {
        this.leaderboardId = leaderboardId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getModuleId() {
        return moduleId;
    }

    public void setModuleId(String moduleId) {
        this.moduleId = moduleId;
    }

    public Integer getTotalPoints() {
        return totalPoints;
    }

    public void setTotalPoints(Integer totalPoints) {
        this.totalPoints = totalPoints;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (leaderboardId != null ? leaderboardId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Leaderboard)) {
            return false;
        }
        Leaderboard other = (Leaderboard) object;
        if ((this.leaderboardId == null && other.leaderboardId != null) || (this.leaderboardId != null && !this.leaderboardId.equals(other.leaderboardId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Leaderboard[ leaderboardId=" + leaderboardId + " ]";
    }

}
