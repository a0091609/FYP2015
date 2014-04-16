package entity;

import java.io.Serializable;

public class GameProfileId implements Serializable {

    private String userId;
    private String moduleId;

    @Override
    public int hashCode() {
        int hash = 0;
        hash += ((userId + moduleId) != null ? (userId + moduleId).hashCode() : 0);
        return hash;
    }

    public boolean equals(Object object) {
        if (object instanceof GameProfileId) {
            GameProfileId otherId = (GameProfileId) object;
            return (otherId.userId == this.userId) && (otherId.moduleId == this.moduleId);
        }
        return false;
    }
}
