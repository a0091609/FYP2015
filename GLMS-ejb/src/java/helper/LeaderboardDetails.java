package helper;

import java.io.Serializable;

public class LeaderboardDetails implements Serializable {

    private String userId;
    private String name;
    private String imgUrl;
    private String lvl;
    private Integer position;
    private Integer pts;
    private Integer ptsAway;
    private String userInFront;

    public LeaderboardDetails(String userId, String name, String imgUrl, String lvl, Integer pts) {
        this.userId = userId;
        this.name = name;
        this.imgUrl = imgUrl;
        this.lvl = lvl;
        this.pts = pts;
    }

    public LeaderboardDetails(Integer position, Integer ptsAway, String userInFront) {
        this.position = position;
        this.ptsAway = ptsAway;
        this.userInFront = userInFront;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getLvl() {
        return lvl;
    }

    public void setLvl(String lvl) {
        this.lvl = lvl;
    }

    public Integer getPosition() {
        return position;
    }

    public void setPosition(Integer position) {
        this.position = position;
    }

    public Integer getPts() {
        return pts;
    }

    public void setPts(Integer pts) {
        this.pts = pts;
    }

    public Integer getPtsAway() {
        return ptsAway;
    }

    public void setPtsAway(Integer ptsAway) {
        this.ptsAway = ptsAway;
    }

    public String getUserInFront() {
        return userInFront;
    }

    public void setUserInFront(String userInFront) {
        this.userInFront = userInFront;
    }

}
