package entity;

public class Goods {

    private int id;//商品编号
    private String name;//商品名称
    private String image;//商品图片
    private int old_price;//商品原价
    private int new_price;//商品现价
    private String info_brief;//商品简要信息
    private String info_detailed;//商品详细信息
    private String info_additional;//商品附加信息
    private int status;//商品状态

    public Goods() {
        super();
    }

    public Goods(int id, String name, String image, int old_price, int new_price, String info_brief, String info_detailed, String info_additional, int status) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.old_price = old_price;
        this.new_price = new_price;
        this.info_brief = info_brief;
        this.info_detailed = info_detailed;
        this.info_additional = info_additional;
        this.status = status;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", image='" + image + '\'' +
                ", old_price=" + old_price +
                ", new_price=" + new_price +
                ", info_brief='" + info_brief + '\'' +
                ", info_detailed='" + info_detailed + '\'' +
                ", info_additional='" + info_additional + '\'' +
                ", status=" + status +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getOld_price() {
        return old_price;
    }

    public void setOld_price(int old_price) {
        this.old_price = old_price;
    }

    public int getNew_price() {
        return new_price;
    }

    public void setNew_price(int new_price) {
        this.new_price = new_price;
    }

    public String getInfo_brief() {
        return info_brief;
    }

    public void setInfo_brief(String info_brief) {
        this.info_brief = info_brief;
    }

    public String getInfo_detailed() {
        return info_detailed;
    }

    public void setInfo_detailed(String info_detailed) {
        this.info_detailed = info_detailed;
    }

    public String getInfo_additional() {
        return info_additional;
    }

    public void setInfo_additional(String info_additional) {
        this.info_additional = info_additional;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
