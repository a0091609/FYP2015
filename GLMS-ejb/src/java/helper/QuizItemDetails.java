package helper;

import java.io.Serializable;

public class QuizItemDetails implements Serializable {

    private String name;
    private Integer qty;
    private String descr;

    public QuizItemDetails() {
    }

    public QuizItemDetails(String name, String descr) {
        this.name = name;
        this.descr = descr;
    }

    public QuizItemDetails(String name, Integer qty) {
        this.name = name;
        this.qty = qty;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(Integer qty) {
        this.qty = qty;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

}
