package dao;

import java.util.List;

import entity.People;

public interface InterfacePeopleDao {
	public abstract int insertPeople(String id, String password, String name, String email, String address);
	
	public abstract int deletePeople(String id);
	
	public abstract int updatePeople(String id, String password, String name, String email, String address);
	
	public abstract People checkPeople(String id, String password);
	
	public abstract List<People> findAllPeople();
}
