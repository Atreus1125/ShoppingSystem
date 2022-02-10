package test;

import dao.PeopleDAO;
import dao.impl.PeopleDAOImpl;
import entity.People;
import org.junit.jupiter.api.Test;
import util.CustomUtil;

class PeopleDAOImplTest {

    @Test
    void doInsert() {
        PeopleDAO peopleDAO = new PeopleDAOImpl();
        int result = peopleDAO.doInsert(
                2022107,
                "123456",
                "斯维因",
                "534953576@qq.com",
                "诺克萨斯",
                0);
        System.out.println(result);
    }

    @Test
    void doDelete() {
    }

    @Test
    void doUpdate() {
    }

    @Test
    void findByLogin() {
        PeopleDAO peopleDAO = new PeopleDAOImpl();
        People people = peopleDAO.findByLogin(2022107, "123456");
        System.out.println(people.toString());
    }

    @Test
    void findById() {
        PeopleDAO peopleDAO = new PeopleDAOImpl();
        People people = peopleDAO.findById(2022107);
        System.out.println(people.toString());

        if (peopleDAO.findById(2022109).getId() == 0) {
            CustomUtil.outParameter("red", "test", "search failed");
        }
    }
}