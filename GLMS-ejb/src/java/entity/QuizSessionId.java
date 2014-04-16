package entity;

import java.io.Serializable;

public class QuizSessionId implements Serializable {

    private String userId;
    private Long quizId;

    @Override
    public int hashCode() {
        int hash = 0;
        hash += ((userId + userId) != null ? (userId + quizId).hashCode() : 0);
        return hash;
    }

    public boolean equals(Object object) {
        if (object instanceof QuizSessionId) {
            QuizSessionId otherId = (QuizSessionId) object;
            return (otherId.userId == this.userId) && (otherId.quizId == this.quizId);
        }
        return false;
    }
}
