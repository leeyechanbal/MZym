package com.mzym.common.template;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) {
		

		String originName = originFile.getName();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		int ranNum = (int)(Math.random() * 900 + 100);

		String ext = originName.substring(originName.lastIndexOf("."));
		
		
		String changeName = "mzym_" + currentTime + "_" + ranNum + "_" + ext;
		
		
		return new File(originFile.getParent(), changeName); 
	}
}
