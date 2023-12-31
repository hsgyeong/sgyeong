package day0705;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;

public class SwingRadioCheck_01 extends JFrame implements ActionListener {
	
	Container cp;
	JRadioButton [] rb=new JRadioButton[4];  //하나만 선택하고 싶을때
	JCheckBox [] cb=new JCheckBox[4];
	JLabel lblMessage;  //라디오버튼, 체크박스 결과값 출력
	JPanel pTop,pBottom;  //라디오버튼, 체크박스 올릴 패널
	Color [] colors= {Color.yellow,Color.pink,Color.blue,Color.green};

	public SwingRadioCheck_01(String title) {
		super(title);
		cp=this.getContentPane();
		this.setBounds(200,100,500,400);
		cp.setBackground(new Color(218,217,255));
		setDesign();
		setVisible(true);
		
	}
	
	public void setDesign() {
		
		//상단패널(pTop)에 보더로 감싼 4개의 radio버튼 만들기
		String []str1= {"노랑","분홍","파랑","초록"};
		pTop = new JPanel();
		pTop.setBorder(new TitledBorder("글자색"));
		this.add("North",pTop);
		
		//라디오버튼 하나만 선택되도록 그룹을 지어줌
		ButtonGroup bg=new ButtonGroup();
		
		for(int i=0;i<rb.length;i++) {
			
			rb[i]=new JRadioButton(str1[i],i==0?true:false);//라디오버튼 생성  //1번째에 라디오 버튼이 추가되어있어야함?
			rb[i].addActionListener(this);  //라디오버튼에 액션 추가
			pTop.add(rb[i]);  //4개의 버튼을 탑패널에 추가
			bg.add(rb[i]);  //버튼그룹에 추가(만약 하지 않으면 다중 버튼 선택할 수 있음)
			
		}
		
		ImageIcon icon=new ImageIcon("C:\\sist0615\\swingimage\\profile-picture.png");
		
		lblMessage=new JLabel("뼈다귀탕!해물파전!",icon,JLabel.CENTER);
		lblMessage.setHorizontalTextPosition(JLabel.LEFT);
		lblMessage.setBorder(new LineBorder(Color.blue,2)); //2는 보더 라인굵기
		this.add("Center",lblMessage);
		
		//하단패널에 보더로 감싼 4개의 checkbox버튼 만들기
		pBottom=new JPanel();
		pBottom.setBorder(new TitledBorder("취미"));
		this.add("South",pBottom);
		
		String[] str2= {"등산","요리","음악감상","달리기"};
		
		for(int i=0;i<cb.length;i++) {
			
			cb[i]=new JCheckBox(str2[i]);
			pBottom.add(cb[i]);
			cb[i].addActionListener(this);
		}
				
	}
	
	//이벤트
	@Override
	public void actionPerformed(ActionEvent e) {
		
		Object ob=e.getSource();
		
		//라디오버튼 호출처리,메세지를 컬러별로 출력
		for(int i=0;i<rb.length;i++)
		{
			if(ob==rb[i])
			{
				lblMessage.setForeground(colors[i]);
				lblMessage.setFont(new Font("", Font.ITALIC,25));
			}
		}
		
		//체크박스 호출처리.. 선택한 처리를 라벨메세지별 출력
		//체크박스에서 누적시키려면 체크가 된건지 안 된건지.. isselected
		
		String c="나의 취미는 ";
		
		for(int i=0;i<cb.length;i++)
		{
			if(cb[i].isSelected())  //==true 생략되어 있음
			{
				c+=cb[i].getText()+" ";
			}
		}
		
		lblMessage.setText(c);
		
		//클래스 타입비교
		if(ob instanceof JCheckBox)
			lblMessage.setText(c);
		else if(ob instanceof JRadioButton)
			lblMessage.setText("뼈다귀탕!해물파전!");
			
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingRadioCheck_01("라디오 체크 연습");
	}

}
