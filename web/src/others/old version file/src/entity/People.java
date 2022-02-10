package entity;

public class People {
	private String id;
	private String password;
	private String name;
	private String email;
	private String address;
	
	public People() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public People(String id, String password, String name, String email, String address) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.address = address;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "People [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email + ", address="
				+ address + "]";
	}
	
}
