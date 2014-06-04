package hl.base.util;



import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

public class ShiroDbRealm extends AuthorizingRealm{


	protected AuthorizationInfo doGetAuthorizationInfo(
            PrincipalCollection principals) {
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        /*//获取当前登录的用户名
        String account = (String) super.getAvailablePrincipal(principals);
        
        List<String> roles = new ArrayList<String>();  
        List<String> permissions = new ArrayList<String>();
        if(user != null){
        	List<ClientRole> rolesDB = user.getRoles();
            if (rolesDB != null && rolesDB.size() > 0) {
                for (ClientRole role : rolesDB) {
                    roles.add(role.getName());
                    List<ClientPermission> permissionsDB = role.getPermissions();
                    if (permissionsDB != null && permissionsDB.size() > 0) {
                        for (ClientPermission pmss : permissionsDB) {
                            if(!StringUtils.isEmpty(pmss.getName())){
                                permissions.add(pmss.getName());
                            }
                        }
                    }
                }
            }
        }else{
            throw new AuthorizationException();
        }
        //给当前用户设置角色
        info.addRoles(roles);
        //给当前用户设置权限
        info.addStringPermissions(permissions); */
        return info;
    }
	
    /**
     *  认证回调函数,登录时调用.
     */
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken authcToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        if (token.getUsername().equals("jason")) {
            return new SimpleAuthenticationInfo("jason", "111111","jason");
        } else {
            return null;
        }
    }
}