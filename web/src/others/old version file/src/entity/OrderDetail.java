package entity;

public class OrderDetail {
	private String goods_name;
	private int number;
	private int price;
	private String person_id;
	
	public OrderDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderDetail(String goods_name, int number, int price, String person_id) {
		super();
		this.goods_name = goods_name;
		this.number = number;
		this.price = price;
		this.person_id = person_id;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPerson_id() {
		return person_id;
	}

	public void setPerson_id(String person_id) {
		this.person_id = person_id;
	}

	@Override
	public String toString() {
		return "OrderDetail [goods_name=" + goods_name + ", number=" + number + ", price=" + price + ", person_id="
				+ person_id + "]";
	}

}
