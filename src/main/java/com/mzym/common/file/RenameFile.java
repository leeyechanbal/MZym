package com.mzym.common.file;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class RenameFile implements FileRenamePolicy  {
	
	private String type;
	
	/**
	 * @author 이예찬
	 * @param type 사진,파일 구분해서 문자열 값 넣어주세요
	 */
	public RenameFile(String type) {
		this.type = type;
	}
	
	/**
	 * @author 이예찬
	 * @return 파일 객체
	 * 저희 첨부파일 테이블에 사진, 파일 구분이 없어서 뒤에 글자를추가해서 구분 하려고 합니다.
	 * 속성 파일 이름 = mzym_"년도월일시간분초_난수3자리"_사진(파일).확장자
	 */
	@Override
	public File rename(File originFile) {
		
		String currentTime = new SimpleDateFormat("yyMMddHHmmss").format(new Date());
		int random = (int)(Math.random()*999+1);
		String name = originFile.getName();
		String exName = name.substring(name.lastIndexOf("."));
		String changeName = "mzym_" + currentTime+ "_" + random + "_" + type + exName;
		
		return new File(originFile.getPath(), changeName);
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "ReNameFile [type=" + type + "]";
	}
	
}
