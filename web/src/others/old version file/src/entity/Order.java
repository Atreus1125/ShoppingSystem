package entity;

public class Order {
	private String person_id;
	private String person_name;
	private String address;
	private int sumprice;
	
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(String person_id, String person_name, String address, int sumprice) {
		super();
		this.person_id = person_id;
		this.person_name = person_name;
		this.address = address;
		this.sumprice = sumprice;
	}

	public String getPerson_id() {
		return person_id;
	}

	public void setPerson_id(String person_id) {
		this.person_id = person_id;
	}

	public String getPerson_name() {
		return person_name;
	}

	public void setPerson_name(String person_name) {
		this.person_name = person_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getSumprice() {
		return sumprice;
	}

	public void setSumprice(int sumprice) {
		this.sumprice = sumprice;
	}

	@Override
	public String toString() {
		return "Order [person_id=" + person_id + ", person_name=" + person_name + ", address=" + address + ", sumprice="
				+ sumprice + "]";
	}
	
}
