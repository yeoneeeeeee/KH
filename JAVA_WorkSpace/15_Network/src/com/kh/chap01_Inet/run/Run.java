package com.kh.chap01_Inet.run;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.UnknownHostException;

public class Run {

	public static void main(String[] args) {
		
		Run r = new Run();
		//r.test1();
		//r.test2();
		r.test3();
	}
	
	//URL객체 생성후 연결요청 , 파일로 저장
	public void test3() {
		String address = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=ABCD";
		BufferedReader br = null;
		BufferedWriter bw = null;
		
		try {
			URL url = new URL(address);
			URLConnection conn = url.openConnection();     //연결된 url과 http통신을 할수있또록 도와주느 클래스 
			br = new BufferedReader( new InputStreamReader(conn.getInputStream()) );
			bw = new BufferedWriter( new FileWriter("search_result.html") );
			
			String data = "";
			while( (data = br.readLine())  != null ) {
				bw.write(data);
				bw.write("\n");
			}
			System.out.println("검색 완료");			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			
			try {
				bw.close();
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
		
	}
	
	
	/*
	 * URL : 인터넷에 존재하는 서버들의 자원에 접근할 수 있는 주소를 다루는 클래스 
	 *       실제 URL에 대한 객체생성. 입력스트림과 연동하여 URL에 존재하는 데이터를 읽어 올수가 있음.
	 * 
	 * protocol + hostname + port + 자원path
	 * 
	 * protocol : 통신규약 http , https 
	 * 
	 * port : 서비스번호 . 컴퓨터내에 특정 프로그램을 가리키는 논리적인번호. 기본 포트번호는 생략가능
	 *                  http : 80
	 *                  https : 443
	 *                  ftp : 20
	 */
	public void test2() {
		
		try {
			URL url = new URL("https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=ABCD");
			System.out.println(url.getProtocol());
			System.out.println(url.getHost());
			System.out.println(url.getPort() != -1? url.getPort() : url.getDefaultPort());
			System.out.println(url.getPath());
			System.out.println(url.getQuery()); // 쿼리스트링 :: 사용자가 입력한 입력값
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	/*
	 * InetAddress
	 * IP주소에 대한 정보를 가진 클래스
	 * 
	 * - IP : 10.10.10.10 4바이트로 이루어진 실제 주소
	 * - hostname : naver.com, google.com , iei.or.kr == 도메인명
	 * 
	 * 모든메소드가 static메소드임
	 * 
	 */
	public void test1() {
		
		try {
			InetAddress naver = InetAddress.getByName("naver.com");
			System.out.println(naver.getHostAddress());
			
			// 도메인이름으로 지정된 모든 ip주소값 반환
			InetAddress[] arr = InetAddress.getAllByName("naver.com");
			System.out.println(arr.length);
			for(InetAddress inet    :  arr ) {
				System.out.println(inet.getHostAddress());
			}
			
			// 내 컴퓨터의 ip주소! 
			InetAddress localhost = InetAddress.getLocalHost();
			System.out.println(localhost.getHostAddress());
			
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
