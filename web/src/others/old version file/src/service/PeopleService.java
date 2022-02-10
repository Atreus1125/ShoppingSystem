package service;

import java.util.List;

import dao.InterfacePeopleDao;
import dao.PeopleDao;
import entity.People;

public class PeopleService implements InterfacePeopleService {
	private InterfacePeopleDao peopleDao;
	
	public PeopleService() {
		peopleDao = new PeopleDao();
	}

	@Override
	public int insertPeople(String id, String password, String name, String email, String address) {
		return peopleDao.insertPeople(id, password, name, email, address);
	}

	@Override
	public int deletePeople(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePeople(String id, String password, String name, String email, String address) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public People checkPeople(String id, String password) {
		return peopleDao.checkPeople(id, password);
	}

	@Override
	public List<People> findAllPeople() {
		// TODO Auto-generated method stub
		return null;
	}

}
