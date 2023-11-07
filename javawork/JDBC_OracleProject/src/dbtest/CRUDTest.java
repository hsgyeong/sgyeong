package src.dbtest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class CRUDTest {

	DBConnect db=new DBConnect();

	//insert
	public void insert()
	{
		Scanner sc=new Scanner(System.in);

		System.out.println("�̸��Է�");
		String name=sc.nextLine();
		System.out.println("�ּ��Է�");
		String addr=sc.nextLine();

		String sql="insert into myinfo values (seq1.nextval, '"
				+name+"','"+addr+"',sysdate)";

		//1.db����
		Connection conn=db.getConnection();  //�̹� �⺻ �޼��忡�� try~catch ó��
		//2.Statement
		Statement stmt=null;

		try {
			stmt=conn.createStatement();

			stmt.execute(sql);

			System.out.println(sql);

			System.out.println("***������ �߰��Ǿ����ϴ�***");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("insert error: "+e.getMessage());
		}finally {
			db.dbClose(stmt, conn);
		}

	}

	//select 

	public void select()
	{

		System.out.println("������\t�̸�\t�ּ�\t�Է½ð�");
		System.out.println("===============================");

		
		String sql="select * from myinfo order by num asc";

		//Connection
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;

		conn=db.getConnection();

		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);

			//2���̻��ϰ��� while��
			//resultset��ü�� next�̿��ؼ� ��������, get�޼��带 �̿��ؼ� ���̺��� �÷����� ȹ��
			while(rs.next())
			{
				System.out.println(rs.getInt("num")
						+"\t"+rs.getString("name")
						+"\t"+rs.getString("addr")
						+"\t"+rs.getDate("sdate"));
				
				System.out.println(num+"\t"+name+"\t"+addr+"\t"+sdate);
			}
		}catch (SQLException e) {

			e.printStackTrace();
			System.out.println("select error"+e.getMessage());
		}finally {
			db.dbClose(rs,stmt,conn);
		}

	}

	//delete
	public void delete()
	{
		Scanner sc=new Scanner(System.in);
		String num;

		System.out.println("������ ������ �Է�");
		num=sc.nextLine();

		String sql="delete from myinfo where num="+num;

		//db���� 
		Connection conn=db.getConnection();
		//statement
		Statement stmt=null;

		try {
			stmt=conn.createStatement();

			//sql�� ����
			int a=stmt.executeUpdate(sql); //������ ����
			
			if(a==0) //���¹�ȣ �Է½� ���� ������ ���������Ƿ� 0��ȯ
				System.out.println("���� ������ ��ȣ�Դϴ�");
			else     //�����Ǹ� 1��ȯ
				System.out.println("***������ �����Ǿ����ϴ�***");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
	}

	//update
	public void update()
	{
		//������ ������ �Է��� �̸�,�ּ� �Է�
		Scanner sc=new Scanner(System.in);
		String num;
		System.out.println("������ ��������?");
		num=sc.nextLine();
		
		//���� boolean�޼��� �����ͼ� ����
		if(!this.isData(num))
		{
			System.out.println("�ش��ȣ�� �������� �ʽ��ϴ�");
			return; //�޼��� ����
		}
		
		System.out.println("������ �̸���?");
		String name=sc.nextLine();
		System.out.println("������ �ּҴ�?");
		String addr=sc.nextLine();

		//sql
		String sql="update myinfo set name='"+name+"',addr='"+addr+"' where num="+num;

		System.out.println(sql);

		//db����
		Connection conn=db.getConnection();
		Statement stmt=null;

		try {
			stmt=conn.createStatement();

			int a=stmt.executeUpdate(sql);

			if(a==0)
				System.out.println("������ �����Ͱ� �������� �ʽ��ϴ�");
			else
				System.out.println("**�����Ǿ����ϴ�**");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("update error: "+e.getMessage());
		}finally {
			db.dbClose(stmt, conn);
		}
	}


	//update�Ҷ� ���¹�ȣ���� �ִ¹�ȣ���� ã���ֱ�
	public boolean isData(String num)
	{
		//num�� �ش��ϴ� �����Ͱ� ������ true,������ false
		boolean flag=false;
			
		String sql="select * from myinfo where num="+num;

		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;

		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);

			//1���ϰ��� if��
			if(rs.next())  //�����Ͱ� �ִ°��
				flag=true;
			else			//���°��
				flag=false;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, stmt, conn);
		}
		
		return flag;

	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub

		CRUDTest crud=new CRUDTest();

		Scanner sc=new Scanner(System.in);
		int n;

		while(true)
		{
			System.out.println("***Oracle db ����_myinfo***");
			System.out.println("1.insert  2.select  3.delete  4.update  9.����");

			n=Integer.parseInt(sc.nextLine());

			if(n==1)
				crud.insert();
			else if(n==9)
			{
				System.out.println("�����մϴ�");
				break;
			}
			else if (n==2)
				crud.select();
			else if(n==3)
				crud.delete();
			else if(n==4)
				crud.update();
		}
	}

}
