package entity;

import java.util.Date;

public class OrderIndex {

    private int id;//订单编号
    private int person_id;//订单的属主的编号
    private int price;//订单总价
    private String address;//收获地址
    private Date date;//创建日期
    private int status;//订单状态

    public OrderIndex() {
        super();
    }

    public OrderIndex(int id, int person_id, int price, String address, Date date, int status) {
        this.id = id;
        this.person_id = person_id;
        this.price = price;
        this.address = address;
        this.date = date;
        this.status = status;
    }

    @Override
    public String toString() {
        return "OrderIndex{" +
                "id=" + id +
                ", person_id=" + person_id +
                ", price=" + price +
                ", address='" + address + '\'' +
                ", date=" + date +
                ", status=" + status +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPerson_id() {
        return person_id;
    }

    public void setPerson_id(int person_id) {
        this.person_id = person_id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
