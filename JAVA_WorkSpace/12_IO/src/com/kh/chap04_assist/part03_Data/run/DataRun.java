package com.kh.chap04_assist.part03_Data.run;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class DataRun {

	public static void main(String[] args) {
		DataRun dr = new DataRun();
		//dr.fileSave();
		dr.fileRead();
	}
	
	public void fileSave() {
		
		try(DataOutputStream dos = new DataOutputStream(new FileOutputStream("d_data.txt"))){
			// 자바 자료형별로 작성이 가능
			dos.writeBoolean(true);
			dos.writeInt(300);
			dos.writeDouble(5.0);
			dos.writeChar('하');
			dos.writeChar('2');
			dos.writeUTF("자바~~");
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void fileRead() {
		
		try(DataInputStream dis = new DataInputStream(new FileInputStream("d_data.txt"))){
			
			//반드시 씌여진 자료형 순서대로 읽어올것!!!
			System.out.println(dis.readBoolean());
			System.out.println(dis.readInt());
			System.out.println(dis.readDouble());
			System.out.println(dis.readChar());
			System.out.println(dis.readChar());
			System.out.println(dis.readUTF());
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
