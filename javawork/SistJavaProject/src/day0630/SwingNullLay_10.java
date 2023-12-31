package day0630;

import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
											//inplement 받는 이유? 메서드를 overriding하기 위해서
public class SwingNullLay_10 extends JFrame implements ActionListener{
	
	Container cp;	
	JButton btn1,btn2;

	public SwingNullLay_10(String title) {
		super(title);
		cp=this.getContentPane();
		this.setBounds(200,100,300,400);
		cp.setBackground(new Color(155,155,200));
		setDesign();
		setVisible(true);
	}
		
		//디자인
		public void setDesign()
		{
			//기본레이아웃 없애기
			this.setLayout(null);
			
			btn1=new JButton("◀");
			btn2=new JButton("▶");
			
			//위치 직접 지정
			btn1.setBounds(50,100,80,30);
			btn2.setBounds(150,100,80,30);
			
			//프레임추가
			this.add(btn1);
			this.add(btn2);
			
			//색상
			btn1.setBackground(Color.blue);
			btn2.setBackground(Color.yellow);
			
			btn1.setForeground(Color.cyan);
			btn2.setForeground(Color.red);
			
			//이벤트
			btn1.addActionListener(this);  //입력? 액션 명령을 인식받는 것(?)
			btn2.addActionListener(this);
			
		}
			
			//액션 (이벤트를 발생시키는 것)
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				
				Object ob=e.getSource();
				if(ob==btn1)
					JOptionPane.showMessageDialog(this, "왼쪽으로 넘어갑니다");
				else if(ob==btn2)	
					JOptionPane.showMessageDialog(this, "오른쪽으로 넘어갑니다");
		}


			public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingNullLay_10("레이아웃 없이 만들기");
	}
	

	}



