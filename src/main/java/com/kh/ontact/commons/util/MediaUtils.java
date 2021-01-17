package com.kh.ontact.commons.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {
	private static Map<String, MediaType> mediaTypeMap;

	// 클래스 초기화 블럭
	static {
		mediaTypeMap = new HashMap<>();
		mediaTypeMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaTypeMap.put("JPEG", MediaType.IMAGE_JPEG);
		mediaTypeMap.put("GIF", MediaType.IMAGE_GIF);
		mediaTypeMap.put("PNG", MediaType.IMAGE_PNG);
	}

	// 파일 타입
	static MediaType getMediaType(String fileName) {
		String formatName = getFormatName(fileName);
		return mediaTypeMap.get(formatName);
	}

	// 파일 확장자 추출
	static String getFormatName(String fileName) {
		return fileName.substring(fileName.lastIndexOf(".") + 1).toUpperCase();
	}

	// 사이즈 계산
	public static String getFileSize(String fsize) {
		String gubn[] = { "Byte", "KB", "MB" };
		String returnSize = new String();
		int gubnKey = 0;
		double changeSize = 0;
		long fileSize = 0;
		try {
			fileSize = Long.parseLong(fsize);
			for (int x = 0; (fileSize / (double) 1024) > 0; x++, fileSize /= (double) 1024) {
				gubnKey = x;
				changeSize = fileSize;
			}
			returnSize = changeSize + " " + gubn[gubnKey];
		} catch (Exception ex) {
			returnSize = "0.0 Byte";
		}

		return returnSize;
	}
}
