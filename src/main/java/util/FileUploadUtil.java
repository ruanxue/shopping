package util;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class FileUploadUtil {
	public static String uploadSingleFile(Part part, HttpServletRequest request) {
		String path = null;
		String fileName = getFileName(part);
		if (!fileName.equals("")) {
			String fileExtName = getFileExtName(part);
			String newFileName = System.currentTimeMillis() + fileExtName;

			String savePath = request.getServletContext().getRealPath("/images/uploads");
			File f = new File(savePath);
			if (!f.exists()) {
				f.mkdirs();
			}

			try {
				part.write(savePath + File.separator + newFileName);
				path = "images/uploads/" + newFileName;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return path;
	}


	public static String getFileName(Part part) {

		String header = part.getHeader("content-disposition");
		String[] tempArr1 = header.split(";");

		String[] tempArr2 = tempArr1[2].split("=");

		String fileName = tempArr2[1].substring(tempArr2[1].lastIndexOf("\\") + 1).replaceAll("\"", "");
		return fileName;
	}

	public static String getFileExtName(Part part) {
		String fileName = getFileName(part);
		if(fileName.equals("")) {
			return "";
		}else {
			return fileName.substring(fileName.lastIndexOf("."));
		}
	}
}
