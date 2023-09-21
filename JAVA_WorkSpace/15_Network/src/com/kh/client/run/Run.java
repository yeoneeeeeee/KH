package com.kh.client.run;

import com.kh.client.tcp.Client;

public class Run {
	
	/*
	 * 클라이언트용 TCP 소켓 프로그래밍 순서
	 * 
	 * 1) 서버의 IP주소와 서버가 정한 포트번호를 매개변수로 하여 클라이언트용 소켓 객체 생성 ==> 연결요청을 보냄
	 * 2) 서버와의 입출력 스트림 오픈
	 * 3) 보조스트림을통해 성능개선
	 * 4) 읽고쓰기
	 * 5) 통신종료
	 * 
	 * 
	 */
	public static void main(String[] args) {
		Client c = new Client();
		c.clientStart();
	}

}
