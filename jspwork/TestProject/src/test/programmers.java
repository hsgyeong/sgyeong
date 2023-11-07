package test;

class Solution {
    public int solution(int n) {
        int answer = 0;
        int i;
        for(i=0;i<=n;i++)
        {
            if(n%2==1){
                answer+=i;
                }
        else
        { answer+=i*i;
        }
        
     }
		return answer;
      
    }
}
