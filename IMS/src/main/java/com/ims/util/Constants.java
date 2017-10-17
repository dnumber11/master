package com.ims.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Constants {
	
	@Value("${image.path.user}")
	public String UPLOAD_DIRECTORY;
	
	
}
