package entity;

public class Notice {
    private int id;
    private String time;
    private String notice;

    public Notice() {
    }

    public Notice(int id, String time, String notice) {
        this.id = id;
        this.time = time;
        this.notice = notice;
    }
    public Notice(String time, String notice) {
        this.time = time;
        this.notice = notice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "time='" + time + '\'' +
                ", notice='" + notice + '\'' +
                '}';
    }
}
