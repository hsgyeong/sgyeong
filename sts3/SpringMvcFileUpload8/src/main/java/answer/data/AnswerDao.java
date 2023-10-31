package answer.data;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnswerDao implements AnswerDaoInter {
	
	@Autowired
	private SqlSession session;

	@Override
	public void insertAnswer(AnswerDto dto) {
		// TODO Auto-generated method stub

		session.insert("InsertOfReanswer",dto);
	}

	@Override
	public List<AnswerDto> getAnswerList(int num) {
		// TODO Auto-generated method stub

		return session.selectList("SelectNumOfReanswer",num);
	}

	@Override
	public void deleteAnswer(int idx) {
		// TODO Auto-generated method stub
		
		session.delete("deleteOfReanswer",idx);
	}

	@Override					// 두 값의 형태가 다를때 object 사용. 만약 형태가 같으면 int, string 가능
	public int getCheckPass(int idx, String pass) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("idx", idx);
		map.put("pass", pass);
		return session.selectOne("PassCheckPassOfAnswer",map);
	}
	
	

}
