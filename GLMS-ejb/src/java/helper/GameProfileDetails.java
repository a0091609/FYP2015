package helper;

import java.io.Serializable;

public class GameProfileDetails implements Serializable {

    private String userId;
    private String username;
    private String moduleId;
    private Integer expPoint;
    private String expLevel;
    private Integer streak;

    public GameProfileDetails(String userId, String moduleId, Integer expPoint, String expLevel, Integer streak) {
        this.userId = userId;
        this.moduleId = moduleId;
        this.expPoint = expPoint;
        this.expLevel = expLevel;
        this.streak = streak;
    }

    public GameProfileDetails(String userId, String username, String expLevel, Integer streak) {
        this.userId = userId;
        this.username = username;
        this.expLevel = expLevel;
        this.streak = streak;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getModuleId() {
        return moduleId;
    }

    public void setModuleId(String moduleId) {
        this.moduleId = moduleId;
    }

    public Integer getExpPoint() {
        return expPoint;
    }

    public void setExpPoint(Integer expPoint) {
        this.expPoint = expPoint;
    }

    public String getExpLevel() {
        return expLevel;
    }

    public void setExpLevel(String expLevel) {
        this.expLevel = expLevel;
    }

    public Integer getStreak() {
        return streak;
    }

    public void setStreak(Integer streak) {
        this.streak = streak;
    }

}
