package com.kh.server.tcp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
	
	public void serverStart() {
		// 0) 포트 번호 지정
		// - 0 ~1023 시스템 포트번호
		// - 1024~65535의 포트번호를 사용하는 것을 추천
		int port = 30027;
		
		// 1) 서버소켓 객체 생성(변수로만 지정)
		ServerSocket server= null;
		
		try {
			server = new ServerSocket(port);
			// 2) 클라이언트의 요청이 오길 기다리는 상태
			System.out.println("서버시작...");
			while(true) {
				
				//3) 접속요청이 오면 요청 수락 후 해당 클라이언트에 대한 소켓 객체 생성
				System.out.println("클라이언트의 요청이 들어올때까지 대기중.....");
				//4) 클라이언트의 정보를 저장
				Socket client = server.accept();// 클라이언트와 통신할수 있는 소켓 객체
				
				// 5) 6) 연결된 클라이언트와 입출력 스트림 생성.
				OutputStream os = client.getOutputStream();
				InputStream is  = client.getInputStream();
				
				// 보조스트림을 통해 성능개선
				// 클라이언트로부터 전달된 값을 한줄단위로 읽어들이기 위한 입력용 스트림
				BufferedReader br = new BufferedReader(new InputStreamReader(is));
				// 클라이언트에게 값을 한줄단위로 출력하는 스트림
				PrintWriter pw = new PrintWriter(os,true);// 데이터 출력해줄때 print, println메소드를 사용함.
				// 7) 스트림을 통해 읽고 쓰기
				while(true) {
					String message = br.readLine(); // 클라이언트로부터 입력이 있을때까지 블로킹 된다.
					
					if(message == null || "exit".equals(message)) {
						System.out.println("접속 종료 !!");
						break;
					}else {
						System.out.println(client.getInetAddress().getHostAddress()+"가 보낸 메시지 : " +message);
						pw.println("메세지 받기 성공");
						pw.flush(); // 현재스트림에 있는 내용중 출력이 안된 내용을 강제로 내보내는 메소드.
					}
					
				}
				
				br.close();
				pw.close();
				client.close();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
}
