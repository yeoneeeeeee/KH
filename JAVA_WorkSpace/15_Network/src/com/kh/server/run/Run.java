package com.kh.server.run;

import com.kh.server.tcp.Server;

public class Run {

	public static void main(String[] args) {

		/*
		 *	TCP(Transmission control Protocol)
		 *  - 서버 , 클라이언트간의 1:1 소켓 통신
		 *  - 데이터를 교환하기에 앞서서 서버 , 클라이언트 연결되어있어야됨(서버가 먼저 실행되어있어야하고, 클라이언트의 요청을 대기해야함)
		 *  - 신뢰성있는 데이터를 전달할수 있다.
		 *  
		 *   * ServerSocket
		 *   - 서버에서 클라이언트가 요청을 하면 그 요청을 받을 때까지 기다리는 클래스
		 *   - 사용법 : ServerSocket server = new ServerSocket(int portNumber)
		 *   - 메소드
		 *    > Socket client = server.accept(); 메소드를 통해 클라이언트의 연결을 기다림. 
		 *                                       연결요청이 오면 Socket를 반납
		 *   
		 *   
		 *   Socket
		 *   - 클라이언트에서 서버에 요청을 하거나, 서버에서 클라이언트의 요청을 받았을때 사용하는 클래스
		 *   - 사용법 : Socket socket = new Socket(String ip주소, int portNumber)
		 *   
		 *   - 메소드
		 *   > OuputStream out = client.getOuputStream(); 요 메소드를 통해 데이터를 내보낼수있는 OutStream객체 생성가능.
		 *   > InputStream in = client.getInputStream(); 요 메소드를 통해 데이터를 읽을 수있는 InputStream객체 생성가능.
		 *    
		 * 	서버의 연결 순서
		 * 1) 서버의 소켓 객체 생성
		 * - Socket client = server.accept(); 
		 * - 클라이언트의 접속 요청을 기다림
		 * 2) 클라이언트의 요청이 오면 수락
		 * 3) 클라이언트이 정보를 저장.
		 * 4) 클라이언트의 정보를 통해서 OutputStream 객체 생성
		 * 5) 클라이언트의 정보를 통해서 InputStream 객체 생성
		 * 6) 스트림을 통해 입.출력
		 * 7) 통신종료	
		 */
		Server server= new Server();
		server.serverStart();
		
	}

}
