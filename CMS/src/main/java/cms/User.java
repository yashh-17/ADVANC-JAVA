package cms;

import jakarta.persistence.*;

@Entity
@Table(name = "Users")
public class User {
	@Id
	@Column(name = "User Name")
	private String username;
	
	@Column(name = "Password")
	private String password;
	
	@Column(name = "Role")
	private String role;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String username, String password, String role) {
		super();
		this.username = username;
		this.password = password;
		this.role = role;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	
}
