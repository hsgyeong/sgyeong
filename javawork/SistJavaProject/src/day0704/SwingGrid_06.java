package day0704;

import java.awt.Color;
import java.awt.Container;
import java.awt.GraphicsConfiguration;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class SwingGrid_06 extends JFrame implements ActionListener{
	
	private static final GraphicsConfiguration title = null;
	Container cp;
	//이미지아이콘
	ImageIcon icon1=new ImageIcon("C:\\sist0615\\swingimage\\captain.png");
	ImageIcon icon2=new ImageIcon("C:\\sist0615\\swingimage\\icon02.png");
	ImageIcon icon3=new ImageIcon("C:\\sist0615\\swingimage\\toy01.png");
	ImageIcon icon4=new ImageIcon("C:\\sist0615\\swingimage\\blackwidow.png");
	
	//버튼선언
	JButton btn1,btn2,btn3,btn4;
	
	public SwingGrid_06() {
		super(title);
		cp=this.getContentPane();
		this.setBounds(800,200,800,500);
		cp.setBackground(new Color(212,244,250));
		setDesign();
		setVisible(true);
		
	}
	
	public void setDesign()
	{
		//버튼 4개 생성
		this.setLayout(new GridLayout(2,2)); //버튼을 2행 2열로 배치
		btn1=new JButton("정처기 뿌시기",icon1);
		btn1.setVerticalTextPosition(JButton.BOTTOM); //텍스트 세로위치
		btn1.setHorizontalTextPosition(JButton.CENTER);  //텍스트 가로위치
		this.add(btn1);
				
		btn1.setRolloverIcon(icon2); //마우스 올렸을때 아이콘
		btn1.setPressedIcon(icon3); //클릭시 아이콘
		
		//2
		btn2=new JButton(icon4);
		this.add(btn2);
		
		
		//3
		btn3=new JButton("JAVA");
		this.add(btn3);
		
		//4
		btn4=new JButton("나 귀엽지???", icon2);
		this.add(btn4);
		
		//버튼에 액션이벤트 추가
		btn1.addActionListener(this);
		btn2.addActionListener(this);
		btn3.addActionListener(this);
		btn4.addActionListener(this);
		
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();
		
		if(ob==btn1)
		JOptionPane.showMessageDialog(this, "관악구 불주먹");
		
		else if(ob==btn2)
		JOptionPane.showMessageDialog(this, "멋진 언니");
			
		else if(ob==btn3)
		JOptionPane.showMessageDialog(this, "재밌는 자바");
		
		else if(ob==btn4)
		JOptionPane.showMessageDialog(this, "귀여운 아저씨");
	}
	
		
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		new SwingGrid_06();
	}


		

}
