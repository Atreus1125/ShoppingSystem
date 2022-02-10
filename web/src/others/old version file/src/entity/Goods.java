package entity;

public class Goods {
	private String id;
	private String name;
	private int price;
	private int number;
	private String picture;
	private String explain;
	
	public Goods() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Goods(String id, String name, int price, int number, String picture) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.number = number;
		this.picture = picture;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	@Override
	public String toString() {
		return "Goods [id=" + id + ", name=" + name + ", price=" + price + ", number=" + number + ", picture=" + picture
				+ ", explain=" + explain + "]";
	}
	
}
