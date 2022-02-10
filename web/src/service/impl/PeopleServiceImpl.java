package service.impl;

import dao.PeopleDAO;
import dao.impl.PeopleDAOImpl;
import entity.People;
import service.PeopleService;
import util.CustomUtil;

public class PeopleServiceImpl implements PeopleService {

    private PeopleDAO peopleDAO = new PeopleDAOImpl();//不实例化会导致空指针异常

    @Override
    public int register(People people) {
        CustomUtil.outPosition("red", "PeopleServiceImpl.register()");
        CustomUtil.outParameter("red", "people", people.toString());

        if (peopleDAO.findById(people.getId()).getId() == 0) {
            if (peopleDAO.doInsert(
                    people.getId(), people.getPassword(), people.getName(),
                    people.getEmail(), people.getAddress(), people.getStatus()) == 1) {
                return 0;
            } else {
                return 2;
            }
        }
        return 1;
    }

    @Override
    public boolean login(People people) {
        if (peopleDAO.findByLogin(people.getId(), people.getPassword()).getId() != 0) {
            return true;
        }
        return false;
    }

    @Override
    public People find(int id) {
        return peopleDAO.findById(id);
    }

    @Override
    public boolean alter(People people) {
        return false;
    }
}
