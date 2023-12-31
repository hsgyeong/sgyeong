package day0704;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class SwingRandom_11 extends JFrame implements ActionListener {
	
	Container cp;
	JLabel [] lblName=new JLabel[9];  //3행 3열이므로 9개
	String [] str= {"딸기","바나나","자두","체리","복숭아","포도","참외","수박","파인애플"};
	JButton btn;
	
	public SwingRandom_11(String title) {
		super(title);
		cp=this.getContentPane();
		this.setBounds(200,100,500,400);
		cp.setBackground(new Color(200,55,230));
		setDesign();
		setVisible(true);
		
	}
	
	public void setDesign() {
		
		//패널을 프레임의 센터에 추가
		JPanel pCenter=new JPanel(new GridLayout(3,3));
		this.add(pCenter,BorderLayout.CENTER);
		
		//라벨을 패널에 추가
		for(int i=0;i<lblName.length;i++)
		{
			lblName[i]=new JLabel(str[i],JLabel.CENTER);
			
			int r=(int)(Math.random()*256); //rgb 0~255
			int g=(int)(Math.random()*256); //rgb 0~255
			int b=(int)(Math.random()*256); //rgb 0~255
			
			lblName[i].setBackground(new Color(r,g,b));
			//panel에 라벨 추가
			pCenter.add(lblName[i]);
			
			//색상 투명도 주어야 색상이 표현된다
			lblName[i].setOpaque(true);
		}
		
		//버튼
		btn=new JButton("라벨색상변경");
		this.add(btn,BorderLayout.SOUTH);
		btn.addActionListener(this);
		
	}
	
		//액션
	
		@Override
		public void actionPerformed(ActionEvent e) {
			
			for(int i=0;i<lblName.length;i++) {
				
				int r=(int)(Math.random()*256); //rgb 0~255
				int g=(int)(Math.random()*256); //rgb 0~255
				int b=(int)(Math.random()*256); //rgb 0~255
			
				lblName[i].setBackground(new Color(r,g,b));
			}
		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingRandom_11("랜덤색상 구하기");
	}

}
