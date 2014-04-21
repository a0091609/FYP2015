package helper;

import java.io.Serializable;

public class StudentFeedback implements Serializable {

    private String userId;
    private String username;
    private String imgUrl;
    private String time;
    private String feedback;

    public StudentFeedback(String userId, String username, String imgUrl, String time, String feedback) {
        this.userId = userId;
        this.username = username;
        this.imgUrl = imgUrl;
        this.time = time;
        this.feedback = feedback;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

}
