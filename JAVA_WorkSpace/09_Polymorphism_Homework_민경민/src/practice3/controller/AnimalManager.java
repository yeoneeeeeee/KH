package practice3.controller;

import practice3.model.vo.Animal;
import practice3.model.vo.Cat;
import practice3.model.vo.Dog;

public class AnimalManager {

	public static void main(String[] args) {
		// Animal 타입의 객체배열 크기 5로 생성
		// 각 인덱스에 무작위로 Dog객체 또는 Cat객체로 생성
		// (이때, 매개변수 생성자를 이용하여 생성)
		// 반복문을 통해서 해당 배열의 0번 인덱스부터 마지막 인덱스까지의
		// 객체의 speak() 메소드 호출
		
		Animal[] animals = new Animal[5];
		animals[0] = new Dog("코코1","골든리트리버",40); 
		animals[1] = new Cat("코코","브리티쉬숏헤어","우리집","회색");
		animals[2] = new Dog("코코2","골든리트리버",40);
		animals[3] = new Dog("코코3","골든리트리버",40);
		animals[4] = new Dog("코코4","골든리트리버",40);
		
		for(Animal a : animals) {
			a.speak();
		}
		
	}

}
