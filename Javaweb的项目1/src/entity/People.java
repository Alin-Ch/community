package entity;

public class People {
    private int id;
    private String name;
    private Integer age;
    private String sex;
    private String health;

    // 一定要创建这个函数，否则会出现
    // Cannot create entity.Foods: entity.Foods Query: select * from foods Parameters: []
    public People() {
    }

    public People(String name, Integer age, String sex, String health) {
        this.name = name;
        this.age = age;
        this.sex = sex;
        this.health = health;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getHealth() {
        return health;
    }

    public void setHealth(String health) {
        this.health = health;
    }

    @Override
    public String toString() {
        return "People{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", sex='" + sex + '\'' +
                ", health='" + health + '\'' +
                '}';
    }
}
