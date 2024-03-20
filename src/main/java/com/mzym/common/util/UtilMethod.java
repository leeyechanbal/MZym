package com.mzym.common.util;

import java.util.Random;

public class UtilMethod {
	
	 public static String generateRandomString() {
	        // 영문 대소문자와 숫자로 이루어진 문자열을 생성할 것입니다.
	        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	        
	        // 난수 생성기 생성
	        Random random = new Random();
	        
	        // 결과 문자열을 담을 변수 생성
	        StringBuilder sb = new StringBuilder();
	        
	        // 8자리 문자열 생성
	        for (int i = 0; i < 8; i++) {
	            // 문자열에서 무작위로 문자 선택
	            int randomIndex = random.nextInt(characters.length());
	            
	            // 선택된 문자를 결과 문자열에 추가
	            sb.append(characters.charAt(randomIndex));
	        }
	        
	        // 결과 문자열 반환
	        return sb.toString();
	    }
}
