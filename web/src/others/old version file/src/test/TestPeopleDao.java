package test;

import org.junit.Test;

import dao.PeopleDao;
import entity.People;

public class TestPeopleDao {
	@Test
	public void testInsertPeople() {
		PeopleDao dao = new PeopleDao();
		int result = 0;
		result = dao.insertPeople("20201125", "123456", "�����", "534953576@qq.com", "���չ�ҵ��ѧ");
		System.out.println("insertPeople()�ķ���ֵΪ:" + result);
	}
	
	/*@Test
	public void testCheckPeople() {
		PeopleDao dao = new PeopleDao();
		People result = new People();
		result = dao.checkPeople("20001125", "123456");
		System.out.println(result.toString());
	}*/
	
	@Test
	public void testfindPeople() {
		PeopleDao dao = new PeopleDao();
		String[] result = new String[601];
		result = dao.findPeople();
		System.out.println(result[0]);
	}
	
	/*@Test
	public void testupdatePeople() {
		PeopleDao dao = new PeopleDao();
		int result = 0;
		result = dao.updatePeople("20001125", "�����", "�����", "�����", "�����", "�����");
		System.out.println(result);
	}*/
	
	/*@Test
	public void testfindAllPeople() {
		PeopleDao dao = new PeopleDao();
		List<People> result = new ArrayList<People>();
		result = dao.findAllPeople();
		for(int i=0;i<result.size();i++){
			System.out.println(result.get(i).toString());
		}
	}*/
}
