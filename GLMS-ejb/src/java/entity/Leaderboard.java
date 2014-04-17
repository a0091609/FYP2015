package entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Leaderboard implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long leaderboardId;
    private Long profileId;
    private String moduleId;
    private Integer points;
    @Temporal(TemporalType.TIMESTAMP)
    private Date timeCreated;

    public Long getLeaderboardId() {
        return leaderboardId;
    }

    public void setLeaderboardId(Long leaderboardId) {
        this.leaderboardId = leaderboardId;
    }

    public Long getProfileId() {
        return profileId;
    }

    public void setProfileId(Long profileId) {
        this.profileId = profileId;
    }

    public String getModuleId() {
        return moduleId;
    }

    public void setModuleId(String moduleId) {
        this.moduleId = moduleId;
    }

    public Integer getPoints() {
        return points;
    }

    public void setPoints(Integer points) {
        this.points = points;
    }

    public Date getTimeCreated() {
        return timeCreated;
    }

    public void setTimeCreated(Date timeCreated) {
        this.timeCreated = timeCreated;
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
