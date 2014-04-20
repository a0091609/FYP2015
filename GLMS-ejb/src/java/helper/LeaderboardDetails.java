package helper;

import java.io.Serializable;

public class LeaderboardDetails implements Serializable {

    private String name;
    private String lvl;
    private Integer pts;

    public LeaderboardDetails(String name, String lvl, Integer pts) {
        this.name = name;
        this.lvl = lvl;
        this.pts = pts;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLvl() {
        return lvl;
    }

    public void setLvl(String lvl) {
        this.lvl = lvl;
    }

    public Integer getPts() {
        return pts;
    }

    public void setPts(Integer pts) {
        this.pts = pts;
    }

}
