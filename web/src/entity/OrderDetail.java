package entity;

public class OrderDetail {

    private int order_index_id;//所属订单的编号
    private int goods_id;//商品的编号
    private String goods_name;//商品的名称
    private int number;//每种商品的数量
    private int price;//每种商品的总价

    public OrderDetail() {
        super();
    }

    public OrderDetail(int order_index_id, int goods_id, String goods_name, int number, int price) {
        this.order_index_id = order_index_id;
        this.goods_id = goods_id;
        this.goods_name = goods_name;
        this.number = number;
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "order_index_id=" + order_index_id +
                ", goods_id=" + goods_id +
                ", goods_name='" + goods_name + '\'' +
                ", number=" + number +
                ", price=" + price +
                '}';
    }

    public int getOrder_index_id() {
        return order_index_id;
    }

    public void setOrder_index_id(int order_index_id) {
        this.order_index_id = order_index_id;
    }

    public int getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(int goods_id) {
        this.goods_id = goods_id;
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
}
