package practica.practias.exception;

public class InsufficientPrivilegesException extends RuntimeException{
    private final String requiredPrivilege;
    private final String userType;
    private final Long resourceId;
    
    public InsufficientPrivilegesException(String message, String requiredPrivilege, String userType, Long resourceId) {
        super(message);
        this.requiredPrivilege = requiredPrivilege;
        this.userType = userType;
        this.resourceId = resourceId;
    }
    
    public InsufficientPrivilegesException(String message) {
        super(message);
        this.requiredPrivilege = null;
        this.userType = null;
        this.resourceId = null;
    }
    
    public String getRequiredPrivilege() {
        return requiredPrivilege;
    }
    
    public String getUserType() {
        return userType;
    }
    
    public Long getResourceId() {
        return resourceId;
    }
}
