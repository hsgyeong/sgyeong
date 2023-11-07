package test;

import java.util.Scanner;

public class Main{
    
    public static void main(String[] args){
        
        Scanner sc = new Scanner(System.in);
        
        int n;
        int a;
        int i;
        
        n = sc.nextInt();
        
        for(a=1; a<=n; a++){
        
        for(i=1; i<=n; i++)
        {
            System.out.print("*");
        }
            System.out.println();
        }
    }
}
