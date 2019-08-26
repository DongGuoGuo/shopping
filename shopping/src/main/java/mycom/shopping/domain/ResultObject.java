package mycom.shopping.domain;

import java.io.Serializable;

public class ResultObject implements Serializable {
    private boolean result;
    private String msg;
    private Object data;

    public ResultObject() {
    }

    public ResultObject(boolean result, Object data, String msg) {
        this.result = result;
        this.data = data;
        this.msg = msg;
    }

    public boolean isResult() {
        return result;
    }

    public void setResult(boolean result) {
        this.result = result;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    @Override
    public String toString() {
        return "ResultObject{" +
                "result=" + result +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }
}
